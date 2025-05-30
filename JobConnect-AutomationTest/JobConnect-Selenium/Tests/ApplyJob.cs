using JobConnect_Selenium.Pages;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
using OpenQA.Selenium.Edge;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;

namespace JobConnect_Selenium.Tests
{
    public class ApplyJob
    {
        [Test]
        public void ApplyJobWithNPOI()
        {
            string filePath = @"D:\lethanhvinh\JobConnect_AutomationTest\JobConnect-AutomationTest\TestData\ApplyJob.xlsx";
            FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.Read);
            IWorkbook workbook = new XSSFWorkbook(fs);
            ISheet sheet = workbook.GetSheetAt(0);

            for (int i = 1; i <= sheet.LastRowNum; i++)
            {
                IRow row = sheet.GetRow(i);
                if (row == null) continue;

                IWebDriver driver = new EdgeDriver();
                driver.Manage().Window.Maximize();
                WebDriverWait wait = new WebDriverWait(driver, TimeSpan.FromSeconds(10));

                try
                {
                    LoginPage loginPage = new LoginPage(driver);
                    JobListingPage jobListingPage = new JobListingPage(driver);
                    JobApplicationPage jobApplicationPage = new JobApplicationPage(driver);

                    string testData = row.GetCell(4)?.ToString();
                    string[] lines = testData.Split('\n');
                    string cv = lines[0].Substring(lines[0].IndexOf(':') + 1).Trim();
                    string cvl = lines[1].Substring(lines[1].IndexOf(':') + 1).Trim();

                    // Đăng nhập
                    loginPage.NavigateTo();
                    loginPage.Login("vinhle@gmail.com", "123456789");
                    Thread.Sleep(1000);

                    // Chọn công việc đầu tiên
                    string jobTitle = jobListingPage.SelectFirstJob(wait);

                    // Nộp đơn ứng tuyển
                    jobApplicationPage.ApplyForJob(wait, cv, cvl);
                    Thread.Sleep(1000);

                    string resultMessage = "";
                    string status = "Passed";

                    // Kiểm tra trường hợp không có CV
                    if (string.IsNullOrWhiteSpace(cv))
                    {
                        if (driver.Url.Contains("/Applications/Index"))
                        {
                            resultMessage += "Đưa ứng viên tới trang Đơn ứng tuyển của tôi để xem danh sách đơn ứng tuyển của bản thân.\n";
                            status = "Failed";
                        }
                        else
                        {
                            string errorMessage = jobApplicationPage.GetErrorMessage(new WebDriverWait(driver, TimeSpan.FromSeconds(5)));
                            if (errorMessage.Contains("CV là bắt buộc."))
                            {
                                resultMessage += errorMessage + "\n";
                            }
                            else
                            {
                                resultMessage += "Thông báo lỗi: " + errorMessage + "\n";
                                status = "Failed";
                            }
                        }
                    }

                    // Kiểm tra trường hợp không có CoverLetter
                    if (string.IsNullOrWhiteSpace(cvl))
                    {
                        if (driver.Url.Contains("/Applications/Index"))
                        {
                            resultMessage += "Đưa ứng viên tới trang Đơn ứng tuyển của tôi để xem danh sách đơn ứng tuyển của bản thân.\n";
                            status = "Passed";
                        }
                    }

                    // Kiểm tra trường hợp không có CV và CoverLetter
                    if (string.IsNullOrWhiteSpace(cv) && string.IsNullOrWhiteSpace(cvl))
                    {
                        if (driver.Url.Contains("/Applications/Index"))
                        {
                            resultMessage += "Đưa ứng viên tới trang Đơn ứng tuyển của tôi để xem danh sách đơn ứng tuyển của bản thân.\n";
                            status = "Failed";
                        }
                        else
                        {
                            string errorMessage = jobApplicationPage.GetErrorMessage(new WebDriverWait(driver, TimeSpan.FromSeconds(5)));
                            if (errorMessage.Contains("CV là bắt buộc."))
                            {
                                resultMessage += errorMessage + "\n";
                            }
                            else
                            {
                                resultMessage += "Thông báo lỗi: " + errorMessage + "\n";
                                status = "Failed";
                            }
                        }
                    }

                    // Kiểm tra định dạng file CV
                    string cvExtension = Path.GetExtension(cv);
                    if (!string.IsNullOrEmpty(cvExtension) && cvExtension.ToLower() != ".pdf")
                    {
                        string validationError = jobApplicationPage.GetValidationError(new WebDriverWait(driver, TimeSpan.FromSeconds(5)));
                        if (validationError.Contains("Chỉ chấp nhận file PDF cho CV."))
                        {
                            resultMessage += "Thông báo \"Chỉ nhận file PDF cho CV\"";
                            status = "Passed";
                        }
                        else
                        {
                            resultMessage += "Thông báo lỗi không đúng hoặc thiếu: " + validationError + "\n";
                            status = "Failed";
                        }
                    }

                    // Kiểm tra trường hợp thành công
                    if (string.IsNullOrWhiteSpace(resultMessage))
                    {
                        wait.Until(d => d.Url.Contains("/Applications/Index"));
                        string currentUrl = driver.Url;
                        if (currentUrl.Contains("/Applications/Index"))
                        {
                            bool isJobPosted = driver.PageSource.Contains(jobTitle);
                            if (isJobPosted)
                            {
                                resultMessage = "Đưa ứng viên tới trang Đơn ứng tuyển của tôi để xem danh sách đơn ứng tuyển của bản thân.";
                                status = "Passed";
                            }
                            else
                            {
                                resultMessage = "Chuyển hướng đúng nhưng không thấy công việc vừa đăng.";
                                status = "Failed";
                            }
                        }
                        else
                        {
                            resultMessage = "Không chuyển hướng đến /Applications/Index sau khi đăng.";
                            status = "Failed";
                        }
                    }

                    // Ghi kết quả vào Excel
                    row.CreateCell(6).SetCellValue(resultMessage);
                    row.CreateCell(7).SetCellValue(status);
                }
                catch (Exception ex)
                {
                    row.CreateCell(6).SetCellValue("Lỗi: " + ex.Message);
                    row.CreateCell(7).SetCellValue("Failed");
                }
                finally
                {
                    driver.Quit();
                }
            }

            fs.Close(); // Đóng file đầu vào

            // Ghi đè kết quả vào file
            using (FileStream outFile = new FileStream(filePath, FileMode.Create, FileAccess.Write))
            {
                workbook.Write(outFile);
            }
        }
    }
}

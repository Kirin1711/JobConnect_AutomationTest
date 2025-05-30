using JobConnect_Selenium.Pages;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
using OpenQA.Selenium.Edge;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;

namespace JobConnect_Selenium.Tests
{
    public class PostJob
    {
        private readonly Dictionary<string, string> jobTypeMap = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase)
        {
            { "contract", "5" },
            { "freelance", "4" },
            { "full-time", "1" },
            { "hybrid", "8" },
            { "internship", "3" },
            { "part-time", "2" },
            { "remote", "7" },
            { "temporary", "6" }
        };

        private readonly Dictionary<string, string> professionMap = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase)
        {
            { "Bán lẻ/Dịch vụ đời sống", "31" },
            { "Bất động sản/Xây dựng", "27" },
            { "Công nghệ Thông tin", "26" },
            { "Dịch vụ khách hàng/Vận hành", "23" },
            { "Điện/Điện tử/Viễn thông", "33" },
            { "Dược/Y tế/Sức khoẻ/Công nghệ sinh học", "36" },
            { "Giáo dục/Đào tạo", "30" },
            { "Kế toán/Kiểm toán/Thuế", "28" },
            { "Kinh doanh/Bán hàng", "21" },
            { "Logistics/Thu mua/Kho/Tài xế", "34" },
            { "Marketing/PR/Quảng cáo", "22" },
            { "Năng lượng/Môi trường/Nông nghiệp", "39" },
            { "Nhà hàng/Khách sạn/Du lịch", "38" },
            { "Nhân sự/Hành chính/Pháp chế", "24" },
            { "Nhóm nghề khác", "40" },
            { "Phim và truyền hình/Báo chí/Xuất bản", "32" },
            { "Sản xuất", "29" },
            { "Tài chính/Ngân hàng/Bảo hiểm", "25" },
            { "Thiết kế", "37" },
            { "Tư vấn chuyên môn/Luật/Biên phiên dịch", "35" }
        };

        private readonly Dictionary<string, string> locationMap = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase)
        {
            { "Hà Nội", "1" },
            { "Hồ Chí Minh", "2" },
            { "Hải Phòng", "3" },
            { "Đà Nẵng", "4" },
            { "Cần Thơ", "5" },
            { "An Giang", "6" },
            { "Bà Rịa - Vũng Tàu", "7" },
            { "Bắc Giang", "8" },
            { "Bắc Kạn", "9" },
            { "Bạc Liêu", "10" },
            { "Bắc Ninh", "11" },
            { "Bình Dương", "12" },
            { "Bình Định", "13" },
            { "Bình Phước", "14" },
            { "Bình Thuận", "15" },
            { "Cà Mau", "16" },
            { "Cao Bằng", "17" },
            { "Đắk Lắk", "18" },
            { "Đắk Nông", "19" },
            { "Điện Biên", "20" },
            { "Dồng Nai", "21" },
            { "Dồng Tháp", "22" },
            { "Gia Lai", "23" },
            { "Hà Giang", "24" },
            { "Hà Nam", "25" },
            { "Hà Tĩnh", "26" },
            { "Hậu Giang", "27" },
            { "Hòa Bình", "28" },
            { "Hưng Yên", "29" },
            { "Khánh Hòa", "30" },
            { "Kiên Giang", "31" },
            { "Kon Tum", "32" },
            { "Lai Châu", "33" },
            { "Lâm Đồng", "34" },
            { "Long An", "35" },
            { "Lào Cai", "36" },
            { "Nam Định", "37" },
            { "Nghệ An", "38" },
            { "Ninh Bình", "39" },
            { "Ninh Thuận", "40" },
            { "Phú Thọ", "41" },
            { "Phú Yên", "42" },
            { "Quảng Bình", "43" },
            { "Quảng Nam", "44" },
            { "Quảng Ngãi", "45" },
            { "Quảng Ninh", "46" },
            { "Quảng Trị", "47" },
            { "Sóc Trăng", "48" },
            { "Sơn La", "49" },
            { "Tây Ninh", "50" },
            { "Thái Bình", "51" },
            { "Thái Nguyên", "52" },
            { "Thanh Hóa", "53" },
            { "Thừa Thiên Huế", "54" },
            { "Tiền Giang", "55" },
            { "Trà Vinh", "56" },
            { "Tuyên Quang", "57" },
            { "Vĩnh Long", "58" },
            { "Vĩnh Phúc", "59" },
            { "Yên Bái", "60" },
            { "Bến Tre", "62" },
            { "Lạng Sơn", "63" }
        };

        [Test]
        public void PostJobWithNPOI()
        {
            string filePath = @"D:\lethanhvinh\JobConnect_AutomationTest\JobConnect-AutomationTest\TestData\PostJob.xlsx";
            FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.ReadWrite);
            IWorkbook workbook = new XSSFWorkbook(fs);
            ISheet sheet = workbook.GetSheetAt(0);

            for (int i = 1; i <= sheet.LastRowNum; i++)
            {
                IRow row = sheet.GetRow(i);
                if (row == null) continue;

                IWebDriver driver = new EdgeDriver();
                driver.Manage().Window.Maximize();

                try
                {
                    LoginPage loginPage = new LoginPage(driver);
                    JobPostingPage jobPostingPage = new JobPostingPage(driver);

                    string testData = row.GetCell(4)?.ToString();
                    string[] lines = testData.Split('\n');
                    string jobTitle = lines[0].Split(':')[1].Trim();
                    string description = lines[1].Split(':')[1].Trim();
                    string salary = lines[2].Split(':')[1].Trim();
                    string experience = lines[3].Split(':')[1].Trim();
                    string type = lines[4].Split(':')[1].Trim();
                    string profession = lines[5].Split(':')[1].Trim();
                    string address = lines[6].Split(':')[1].Trim();

                    loginPage.NavigateTo();
                    loginPage.Login("thongnguyen@gmail.com", "123456789");
                    Thread.Sleep(1000);

                    jobPostingPage.NavigateToPostJob();
                    jobPostingPage.FillJobForm(
                        jobTitle,
                        description,
                        salary,
                        experience,
                        jobTypeMap[type.ToLower()],
                        professionMap[profession.ToLower()],
                        locationMap[address.ToLower()]
                    );
                    jobPostingPage.SubmitJobForm();

                    string resultMessage = "";
                    string status = "Passed";

					// Kiểm tra lỗi cho các trường bắt buộc
					if (!string.IsNullOrWhiteSpace(jobTitle) && jobTitle.Length < 8)
					{
						if (driver.Url.Contains("/Jobs/Index2"))
						{
							resultMessage += "Chuyển hướng tới danh sách Quản lý tin tuyển dụng đã có công việc vừa tạo khi tiêu đề < 8 ký tự.\n";
							status = "Failed";
						}
						else
						{
							try
							{
								WebDriverWait waitError = new WebDriverWait(driver, TimeSpan.FromSeconds(5));
								IWebElement errorMessage = waitError.Until(d => d.FindElement(By.ClassName("text-danger")));
								if (errorMessage.Text.Contains("Tiêu đề công việc phải từ 8 ký tự trở lên") || errorMessage.Text.Contains("The Title must be at least 8 characters"))
								{
									resultMessage += "Lỗi độ dài Title: " + errorMessage.Text + "\n";
								}
								else
								{
									resultMessage += "Thông báo lỗi độ dài Title không đúng: " + errorMessage.Text + "\n";
									status = "Failed";
								}
							}
							catch
							{
								resultMessage += "Không tìm thấy thông báo lỗi độ dài Title\n";
								status = "Failed";
							}
						}
					}

					// Kiểm tra lỗi Description
					if (string.IsNullOrWhiteSpace(description))
                    {
                        // Nếu chuyển hướng đến trang Index2 thì rõ ràng là lỗi (không kiểm tra đúng Description)
                        if (driver.Url.Contains("/Jobs/Index2"))
                        {
                            resultMessage += "Chuyển hướng tới danh sách Quản lý tin tuyển dụng đã có công việc vừa tạo.\n";
                            status = "Failed";
                        }
                        else
                        {
                            try
                            {
                                WebDriverWait waitError = new WebDriverWait(driver, TimeSpan.FromSeconds(5));
                                IWebElement errorMessage = waitError.Until(d => d.FindElement(By.ClassName("text-danger")));
                                if (errorMessage.Text.Contains("The Description field is required."))
                                {
                                    resultMessage += "Lỗi Description: " + errorMessage.Text + "\n";
                                }
                                else
                                {
                                    resultMessage += "Thông báo lỗi Description không đúng: " + errorMessage.Text + "\n";
                                    status = "Failed";
                                }
                            }
                            catch
                            {
                                resultMessage += "Không tìm thấy thông báo lỗi Description\n";
                                status = "Failed";
                            }
                        }
                    }
					if (string.IsNullOrWhiteSpace(jobTitle))
					{
						if (driver.Url.Contains("/Jobs/Index2"))
						{
							resultMessage += "Chuyển hướng tới danh sách Quản lý tin tuyển dụng đã có công việc vừa tạo.\n";
							status = "Failed";
						}
						else
						{
							try
							{
								WebDriverWait waitError = new WebDriverWait(driver, TimeSpan.FromSeconds(5));
								IWebElement errorMessage = waitError.Until(d => d.FindElement(By.ClassName("text-danger")));
								if (errorMessage.Text.Contains("The Title field is required."))
								{
									resultMessage += "Lỗi Title: " + errorMessage.Text + "\n";
								}
								else
								{
									resultMessage += "Thông báo lỗi Title không đúng: " + errorMessage.Text + "\n";
									status = "Failed";
								}
							}
							catch
							{
								resultMessage += "Không tìm thấy thông báo lỗi Title\n";
								status = "Failed";
							}
						}
					}

					// Kiểm tra lỗi Description
					if (string.IsNullOrWhiteSpace(description))
					{
						if (driver.Url.Contains("/Jobs/Index2"))
						{
							resultMessage += "Chuyển hướng tới danh sách Quản lý tin tuyển dụng đã có công việc vừa tạo.\n";
							status = "Failed";
						}
						else
						{
							try
							{
								WebDriverWait waitError = new WebDriverWait(driver, TimeSpan.FromSeconds(5));
								IWebElement errorMessage = waitError.Until(d => d.FindElement(By.ClassName("text-danger")));
								if (errorMessage.Text.Contains("The Description field is required."))
								{
									resultMessage += "Lỗi Description: " + errorMessage.Text + "\n";
								}
								else
								{
									resultMessage += "Thông báo lỗi Description không đúng: " + errorMessage.Text + "\n";
									status = "Failed";
								}
							}
							catch
							{
								resultMessage += "Không tìm thấy thông báo lỗi Description\n";
								status = "Failed";
							}
						}
					}
					if (string.IsNullOrWhiteSpace(salary))
                    {
                        // Nếu chuyển hướng đến trang Index2 thì rõ ràng là lỗi (không kiểm tra đúng Description)
                        if (driver.Url.Contains("/Jobs/Index2"))
                        {
                            resultMessage += "Chuyển hướng tới danh sách Quản lý tin tuyển dụng đã có công việc vừa tạo.\n";
                            status = "Failed";
                        }
                        else
                        {
                            try
                            {
                                WebDriverWait waitError = new WebDriverWait(driver, TimeSpan.FromSeconds(5));
                                IWebElement errorMessage = waitError.Until(d => d.FindElement(By.ClassName("text-danger")));
                                if (errorMessage.Text.Contains("The Salary field is required."))
                                {
                                    resultMessage += "Lỗi Salary: " + errorMessage.Text + "\n";
                                }
                                else
                                {
                                    resultMessage += "Thông báo lỗi Salary không đúng: " + errorMessage.Text + "\n";
                                    status = "Failed";
                                }
                            }
                            catch
                            {
                                resultMessage += "Không tìm thấy thông báo lỗi Salary\n";
                                status = "Failed";
                            }
                        }
                    }

                    // Kiểm tra đăng tin thành công
                    if (string.IsNullOrWhiteSpace(resultMessage))
                    {
                        if (jobPostingPage.IsOnJobIndexPage())
                        {
                            if (jobPostingPage.IsJobPosted(jobTitle))
                            {
                                resultMessage = "Chuyển hướng tới danh sách Quản lý tin tuyển dụng đã có công việc vừa tạo.";
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
                            resultMessage = "Không chuyển hướng đến /Jobs/Index2 sau khi đăng.";
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

            fs.Close();
            using (FileStream outFile = new FileStream(filePath, FileMode.Create, FileAccess.Write))
            {
                workbook.Write(outFile);
            }
        }
    }
}
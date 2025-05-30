using JobConnect_Selenium.Pages;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
using OpenQA.Selenium.Edge;
using OpenQA.Selenium.Support.UI;
using OpenQA.Selenium;

namespace JobConnect_Selenium.Tests
{
    public class Login
    {
        private IWebDriver driver;

        [Test]
        public void LoginWithNPOI()
        {
            string filePath = @"D:\lethanhvinh\JobConnect_AutomationTest\JobConnect-AutomationTest\TestData\Login.xlsx";
            FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.ReadWrite);
            IWorkbook workbook = new XSSFWorkbook(fs);
            ISheet sheet = workbook.GetSheetAt(0);

            for (int i = 1; i <= sheet.LastRowNum; i++)
            {
                IRow row = sheet.GetRow(i);
                if (row == null) continue;

                string testData = row.GetCell(4)?.ToString();
                string[] lines = testData.Split('\n');
                string email = lines[0].Split(':')[1].Trim();
                string password = lines[1].Split(':')[1].Trim();

                string result = "";
                string status = "Passed";

                try
                {
                    driver = new EdgeDriver();
                    driver.Manage().Window.Maximize();

                    // Sử dụng LoginPage POM
                    var loginPage = new LoginPage(driver);
                    loginPage.NavigateTo();
                    loginPage.Login(email, password);

                    WebDriverWait wait = new WebDriverWait(driver, TimeSpan.FromSeconds(5));

                    if (string.IsNullOrWhiteSpace(email))
                    {
                        IWebElement error = wait.Until(d => d.FindElement(By.ClassName("text-danger")));
                        if (error.Text.Contains("Tài khoản hoặc Email không được trống."))
                        {
                            result = "Hiển thị thông báo \"Tài khoản không để trống\"";
                        }
                        else
                        {
                            result = "Sai thông báo khi email trống: " + error.Text;
                            status = "Failed";
                        }
                    }
                    else if (!email.Contains("@"))
                    {
                        IWebElement error = wait.Until(d => d.FindElement(By.ClassName("text-danger")));
                        if (error.Text.Contains("Tài khoản/Email hoặc mật khẩu không đúng."))
                        {
                            result = "Hiển thị thông báo \"Tài khoản/Email hoặc mật khẩu không đúng\"";
                        }
                        else
                        {
                            result = "Sai thông báo định dạng email: " + error.Text;
                            status = "Failed";
                        }
                    }
                    else if (string.IsNullOrWhiteSpace(password))
                    {
                        IWebElement error = wait.Until(d => d.FindElement(By.XPath("/html/body/div/div/div/div/div/form/div[2]/span")));
                        if (error.Text.Contains("Mật khẩu không được trống."))
                        {
                            result = "Hiển thị thông báo \"Mật khẩu không được để trống.\"";
                        }
                        else
                        {
                            result = "Sai thông báo khi mật khẩu trống: " + error.Text;
                            status = "Failed";
                        }
                    }
                    else
                    {
                        try
                        {
                            wait.Until(d => d.Url == "https://localhost:7214/Jobs/Index1");
                            if (driver.Url == "https://localhost:7214/Jobs/Index1")
                            {
                                result = "Đăng nhập thành công, chuyển hướng tới trang chủ";
                            }
                            else
                            {
                                result = "Chuyển hướng sai URL.";
                                status = "Failed";
                            }
                        }
                        catch
                        {
                            IWebElement error = driver.FindElement(By.ClassName("text-danger"));
                            if (error.Text.Contains("Tài khoản/Email hoặc mật khẩu không đúng."))
                            {
                                result = "Hiển thị thông báo \"Tài khoản/Email hoặc mật khẩu không đúng.\"";
                            }
                            else
                            {
                                result = "Sai thông báo khi tài khoản/mật khẩu sai: " + error.Text;
                                status = "Failed";
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    result = "Lỗi trong quá trình test: " + ex.Message;
                    status = "Failed";
                }
                finally
                {
                    driver.Quit();
                }

                // Ghi kết quả vào Excel
                row.CreateCell(6).SetCellValue(result);
                row.CreateCell(7).SetCellValue(status);
            }

            fs.Close(); // Đóng file đang đọc

            using (var outFile = new FileStream(filePath, FileMode.Create, FileAccess.Write))
            {
                workbook.Write(outFile);
            }
        }
    }
}
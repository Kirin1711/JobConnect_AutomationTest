using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
using OpenQA.Selenium.Edge;
using OpenQA.Selenium;
using JobConnect_Selenium.Pages;
using System.Text.RegularExpressions;

namespace JobConnect_Selenium.Tests
{
    public class Register
    {
        private IWebDriver driver;
        private RegisterPage registerPage;
        private string url = "https://localhost:7214/";

        [Test]
        public void SignupWithNPOI()
        {
            string filePath = @"D:\lethanhvinh\JobConnect_AutomationTest\JobConnect-AutomationTest\TestData\Register.xlsx";
            FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.ReadWrite);
            IWorkbook workbook = new XSSFWorkbook(fs);
            ISheet sheet = workbook.GetSheetAt(0);

            for (int i = 1; i <= sheet.LastRowNum; i++)
            {
                IRow row = sheet.GetRow(i);
                if (row == null) continue;
                driver = new EdgeDriver();
                driver.Manage().Window.Maximize();
                registerPage = new RegisterPage(driver);
                registerPage.NavigateTo(url);

                string testData = row.GetCell(4)?.ToString();
                if (string.IsNullOrWhiteSpace(testData)) continue;

                string[] lines = testData.Split('\n');
                if (lines.Length < 6) continue;

                string GetValue(string line)
                {
                    int index = line.IndexOf(':');
                    if (index >= 0 && index < line.Length - 1)
                        return line.Substring(index + 1).Trim();
                    return "";
                }

                string username = GetValue(lines[0]);
                string password = GetValue(lines[1]);
                string fullname = GetValue(lines[2]);
                string email = GetValue(lines[3]);
                string birth = GetValue(lines[4]);
                string phone = GetValue(lines[5]);
                string result = "";
                string status = "Passed";

                try
                {
                    registerPage.ClickSignupLink();
                    registerPage.EnterUsername(username);
                    registerPage.EnterPassword(password);
                    registerPage.EnterFullName(fullname);
                    registerPage.EnterEmail(email);
                    registerPage.EnterDateOfBirth(birth);
                    registerPage.EnterPhoneNumber(phone);
                    registerPage.ClickSubmitButton();

                    if (string.IsNullOrWhiteSpace(username))
                    {
                        if (registerPage.IsAtLoginPage())
                        {
                            result = "Đăng ký thành công, chuyển hướng tới trang đăng nhập.";
                            status = "Failed";
                        }
                        else
                        {
                            string error = registerPage.GetErrorMessage();
                            if (error.Contains("The Username field is required."))
                            {
                                result = "Hiển thị thông báo \"The Username field is required\"";
                            }
                            else
                            {
                                result = "Sai thông báo: " + error;
                                status = "Failed";
                            }
                        }
                    }
                    else if (username.Length < 4)
                    {
                        if (registerPage.IsAtLoginPage())
                        {
                            result = "Đăng ký thành công, chuyển hướng tới trang đăng nhập.";
                            status = "Failed";
                        }
                        else
                        {
                            string error = registerPage.GetErrorMessage();
                            if (error.Contains("Tài khoản phải từ 4 đến 16 ký tự."))
                            {
                                result = "Hiển thị thông báo \"Tài khoản phải từ 4 đến 16 ký tự\"";
                            }
                            else
                            {
                                result = "Sai thông báo: " + error;
                                status = "Failed";
                            }
                        }
                    }
                    else if (username.Length > 16)
                    {
                        if (registerPage.IsAtLoginPage())
                        {
                            result = "Đăng ký thành công, chuyển hướng tới trang đăng nhập.";
                            status = "Failed";
                        }
                        else
                        {
                            string error = registerPage.GetErrorMessage();
                            if (error.Contains("Tài khoản phải từ 4 đến 16 ký tự."))
                            {
                                result = "Hiển thị thông báo \"Tài khoản phải từ 4 đến 16 ký tự\"";
                            }
                            else
                            {
                                result = "Sai thông báo khi: " + error;
                                status = "Failed";
                            }
                        }
                    }
                    else if (username.Length >= 4 && username.Length <= 16)
                    {
                        if (registerPage.IsAtLoginPage())
                        {
                            result = "Đăng ký thành công, chuyển hướng tới trang đăng nhập.";
                            status = "Pass";
                        }
                        else
                        {
                            string error = registerPage.GetErrorMessage();
                            result = "Sai kết quả: " + error;
                            status = "Failed";
                        }
                    }
                    else if (!Regex.IsMatch(username, @"[^a-zA-Z0-9]")) // chỉ chứa chữ và số
                    {
                        if (registerPage.IsAtLoginPage())
                        {
                            result = "Đăng ký thành công, chuyển hướng tới trang đăng nhập.";
                            status = "Pass";
                        }
                        else
                        {
                            string error = registerPage.GetErrorMessage();
                            result = "Sai kết quả: " + error;
                            status = "Failed";
                        }
                    }

                    else if (username.Contains(" "))
                    {
                        if (registerPage.IsAtLoginPage())
                        {
                            result = "Đăng ký thành công, chuyển hướng tới trang đăng nhập.";
                            status = "Failed";
                        }
                        else
                        {
                            string error = registerPage.GetErrorMessage();
                            if (error.Contains("Tài khoản không được có khoảng trắng."))
                            {
                                result = "Thông báo tài khoản không được có khoảng trắng";
                            }
                            else
                            {
                                result = "Sai thông báo: " + error;
                                status = "Failed";
                            }
                        }
                    }
                    else if (username.Any(c => !char.IsLetterOrDigit(c)))
                    {
                        if (registerPage.IsAtLoginPage())
                        {
                            result = "Đăng ký thành công, chuyển hướng tới trang đăng nhập.";
                            status = "Failed";
                        }
                        else
                        {
                            string error = registerPage.GetErrorMessage();
                            if (error.Contains("Tài khoản không được chứa ký tự in hoa và ký tự đặc biệt."))
                            {
                                result = "Hiển thị thông báo \"Tài khoản không được chứa ký tự in hoa và ký tự đặc biệt\"\r\n";
                            }
                            else
                            {
                                result = "Sai thông báo: " + error;
                                status = "Failed";
                            }
                        }
                    }
                    else if (string.IsNullOrWhiteSpace(email))
                    {
                        if (registerPage.IsAtLoginPage())
                        {
                            result = "Đăng ký thành công, chuyển hướng tới trang đăng nhập.";
                            status = "Failed";
                        }
                        else
                        {
                            string error = registerPage.GetErrorMessage();
                            if (error.Contains("Email không được để trống."))
                            {
                                result = "Thông báo \"Email không được để trống\"";
                            }
                            else
                            {
                                result = "Sai thông báo: " + error;
                                status = "Failed";
                            }
                        }
                    }
                    else if (!email.Contains("@") || !email.Contains("."))
                    {
                        if (registerPage.IsAtLoginPage())
                        {
                            result = "Đăng ký thành công, chuyển hướng tới trang đăng nhập.";
                            status = "Failed";
                        }
                        else
                        {
                            string error = registerPage.GetErrorMessage();
                            if (error.Contains("Email đăng ký không hợp lệ"))
                            {
                                result = "Thông báo \"Email đăng ký không hợp lệ\"";
                            }
                            else
                            {
                                result = "Sai thông báo: " + error;
                                status = "Failed";
                            }
                        }
                    }
                    else if (string.IsNullOrWhiteSpace(password))
                    {
                        if (registerPage.IsAtLoginPage())
                        {
                            result = "Đăng ký thành công, chuyển hướng tới trang đăng nhập.";
                            status = "Failed";
                        }
                        else
                        {
                            string error = registerPage.GetErrorMessage();
                            if (error.Contains("Mật khẩu không được để trống"))
                            {
                                result = "Thông báo \"Mật khẩu không được để trống\"";
                            }
                            else
                            {
                                result = "Sai thông báo: " + error;
                                status = "Failed";
                            }
                        }
                    }
                    else if (password.Length < 6)
                    {
                        if (registerPage.IsAtLoginPage())
                        {
                            result = "Đăng ký thành công, chuyển hướng tới trang đăng nhập.";
                            status = "Failed";
                        }
                        else
                        {
                            string error = registerPage.GetErrorMessage();
                            if (error.Contains("Mật khẩu quá yếu"))
                            {
                                result = "Hệ thống thông báo \"Mật khẩu quá yếu\"";
                            }
                            else
                            {
                                result = "Sai thông báo: " + error;
                                status = "Failed";
                            }
                        }
                    }
                    else if (password.Length >= 6 && Regex.IsMatch(password, "[A-Z]") && Regex.IsMatch(password, @"[\W_]") && Regex.IsMatch(password, @"\d"))
                    {
                        if (registerPage.IsAtLoginPage())
                        {
                            result = "Đăng ký thành công, chuyển hướng tới trang đăng nhập.";
                            status = "Pass";
                        }
                        else
                        {
                            string error = registerPage.GetErrorMessage();
                            result = "Sai kết quả: " + error;
                            status = "Failed";
                        }
                    }

                    else if (!password.Any(char.IsUpper))
                    {
                        if (registerPage.IsAtLoginPage())
                        {
                            result = "Đăng ký thành công, chuyển hướng tới trang đăng nhập.";
                            status = "Failed";
                        }
                        else
                        {
                            string error = registerPage.GetErrorMessage();
                            if (error.Contains("Mật khẩu quá yếu"))
                            {
                                result = "Hệ thống thông báo \"Mật khẩu quá yếu\"";
                            }
                            else
                            {
                                result = "Sai thông báo: " + error;
                                status = "Failed";
                            }
                        }
                    }
                    else if (!password.Any(char.IsDigit))
                    {
                        if (registerPage.IsAtLoginPage())
                        {
                            result = "Đăng ký thành công, chuyển hướng tới trang đăng nhập.";
                            status = "Failed";
                        }
                        else
                        {
                            string error = registerPage.GetErrorMessage();
                            if (error.Contains("Mật khẩu quá yếu"))
                            {
                                result = "Hệ thống thông báo \"Mật khẩu quá yếu\"";
                            }
                            else
                            {
                                result = "Sai thông báo: " + error;
                                status = "Failed";
                            }
                        }
                    }
                    else if (!password.Any(c => !char.IsLetterOrDigit(c)))
                    {
                        if (registerPage.IsAtLoginPage())
                        {
                            result = "Đăng ký thành công, chuyển hướng tới trang đăng nhập.";
                            status = "Failed";
                        }
                        else
                        {
                            string error = registerPage.GetErrorMessage();
                            if (error.Contains("Mật khẩu quá yếu"))
                            {
                                result = "Hệ thống thông báo \"Mật khẩu quá yếu\"";
                            }
                            else
                            {
                                result = "Sai thông báo: " + error;
                                status = "Failed";
                            }
                        }
                    }
                    else if (string.IsNullOrWhiteSpace(phone))
                    {
                        if (registerPage.IsAtLoginPage())
                        {
                            result = "Đăng ký thành công, chuyển hướng tới trang đăng nhập.";
                            status = "Failed";
                        }
                        else
                        {
                            string error = registerPage.GetErrorMessage();
                            if (error.Contains("Thông báo không được để trống số điện thoại"))
                            {
                                result = "Thông báo không được để trống số điện thoại";
                            }
                            else
                            {
                                result = "Sai thông báo: " + error;
                                status = "Failed";
                            }
                        }
                    }
                    else if (!phone.All(char.IsDigit))
                    {
                        if (registerPage.IsAtLoginPage())
                        {
                            result = "Đăng ký thành công, chuyển hướng tới trang đăng nhập.";
                            status = "Failed";
                        }
                        else
                        {
                            string error = registerPage.GetErrorMessage();
                            if (error.Contains("Số điện thoại không hợp lệ"))
                            {
                                result = "Thông báo \"Số điện thoại không hợp lệ\"";
                            }
                            else
                            {
                                result = "Sai thông báo: " + error;
                                status = "Failed";
                            }
                        }
                    }
                    else if (phone.Length < 10)
                    {
                        if (registerPage.IsAtLoginPage())
                        {
                            result = "Đăng ký thành công, chuyển hướng tới trang đăng nhập.";
                            status = "Failed";
                        }
                        else
                        {
                            string error = registerPage.GetErrorMessage();
                            if (error.Contains("Số điện thoại không hợp lệ"))
                            {
                                result = "Thông báo \"Số điện thoại không hợp lệ\"";
                            }
                            else
                            {
                                result = "Sai thông báo: " + error;
                                status = "Failed";
                            }
                        }
                    }
                    else if (phone.Length > 10)
                    {
                        if (registerPage.IsAtLoginPage())
                        {
                            result = "Đăng ký thành công, chuyển hướng tới trang đăng nhập.";
                            status = "Failed";
                        }
                        else
                        {
                            string error = registerPage.GetErrorMessage();
                            if (error.Contains("Số điện thoại không hợp lệ"))
                            {
                                result = "Thông báo \"Số điện thoại không hợp lệ\"";
                            }
                            else
                            {
                                result = "Sai thông báo: " + error;
                                status = "Failed";
                            }
                        }
                    }

                    else  if (Regex.IsMatch(phone, @"^\d{10}$")) // 10 chữ số và toàn là số
                    {
                        if (registerPage.IsAtLoginPage())
                        {
                            result = "Đăng ký thành công, chuyển hướng tới trang đăng nhập.";
                            status = "Pass";
                        }
                        else
                        {
                            string error = registerPage.GetErrorMessage();
                            result = "Sai kết quả: " + error;
                            status = "Failed";
                        }
                    }
                    else if (!string.IsNullOrEmpty(fullname))
                    {
                        if (registerPage.IsAtLoginPage())
                        {
                            result = "Đăng ký thành công, chuyển hướng tới trang đăng nhập.";
                            status = "Pass";
                        }
                        else
                        {
                            string error = registerPage.GetErrorMessage();
                            result = "Sai kết quả: " + error;
                            status = "Failed";
                        }
                    }

                    else if (string.IsNullOrWhiteSpace(fullname))
                    {
                        if (registerPage.IsAtLoginPage())
                        {
                            result = "Đăng ký thành công, chuyển hướng tới trang đăng nhập.";
                            status = "Failed";
                        }
                        else
                        {
                            string error = registerPage.GetErrorMessage();
                            if (error.Contains("Tên không hợp lệ"))
                            {
                                result = "Thông báo \"Tên không hợp lệ\"";
                            }
                            else
                            {
                                result = "Sai thông báo: " + error;
                                status = "Failed";
                            }
                        }
                    }
                    else if (!fullname.Contains(" "))
                    {
                        if (registerPage.IsAtLoginPage())
                        {
                            result = "Đăng ký thành công, chuyển hướng tới trang đăng nhập.";
                            status = "Passed"; // Note: Original code had "Pass" here
                        }
                        else
                        {
                            string error = registerPage.GetErrorMessage();
                            if (error.Contains("Tên không hợp lệ"))
                            {
                                result = "Thông báo \"Tên không hợp lệ\"";
                            }
                            else
                            {
                                result = "Sai thông báo: " + error;
                                status = "Failed";
                            }
                        }
                    }
                    else if (fullname.Any(c => !char.IsLetter(c) && c != ' '))
                    {
                        if (registerPage.IsAtLoginPage())
                        {
                            result = "Đăng ký thành công, chuyển hướng tới trang đăng nhập.";
                            status = "Failed";
                        }
                        else
                        {
                            string error = registerPage.GetErrorMessage();
                            if (error.Contains("Họ tên không được chứa ký tự đặc biệt"))
                            {
                                result = "Hiển thị thông báo \"Họ tên không được chứa ký tự đặc biệt\"";
                            }
                            else
                            {
                                result = "Sai thông báo: " + error;
                                status = "Failed";
                            }
                        }
                    }

                    else if (string.IsNullOrWhiteSpace(birth))
                    {
                        if (registerPage.IsAtLoginPage())
                        {
                            result = "Đăng ký thành công, chuyển hướng tới trang đăng nhập.";
                            status = "Failed";
                        }
                        else
                        {
                            string error = registerPage.GetErrorMessage();
                            if (error.Contains("Thông báo không được để trống ngày sinh"))
                            {
                                result = "Thông báo không được để trống ngày sinh";
                            }
                            else
                            {
                                result = "Sai thông báo: " + error;
                                status = "Failed";
                            }
                        }
                    }
                    else if (DateTime.TryParse(birth, out DateTime birthDate))
                    {
                        if (birthDate.Year == DateTime.Now.Year)
                        {
                            result = "Năm sinh là năm hiện tại → báo lỗi hợp lệ.";
                        }
                        else if (birthDate > DateTime.Now)
                        {
                            result = "Ngày sinh trong tương lai → báo lỗi hợp lệ.";
                        }
                        else
                        {
                            result = "Ngày sinh hợp lệ.";
                        }
                    }

                    else
                    {
                        result = "Định dạng ngày sinh sai.";
                    }

                    DateTime dob;
                    if (DateTime.TryParse(birth, out dob))
                    {
                        if (registerPage.IsAtLoginPage())
                        {
                            result = "Đăng ký thành công, chuyển hướng tới trang đăng nhập.";
                            status = "Pass";
                        }
                        else
                        {
                            string error = registerPage.GetErrorMessage();
                            result = "Sai kết quả: " + error;
                            status = "Failed";
                        }
                    }

                    if (string.IsNullOrEmpty(result))
                    {
                        if (registerPage.IsAtJobsIndexPage())
                        {
                            result = "Đăng ký thành công, chuyển tới Jobs/Index1.";
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

                row.CreateCell(6).SetCellValue(result);
                row.CreateCell(7).SetCellValue(status);

            }

            fs.Close();
            using (var outFile = new FileStream(filePath, FileMode.Create, FileAccess.Write))
            {
                workbook.Write(outFile);
            }
        }
    }
}
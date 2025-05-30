using OpenQA.Selenium.Support.UI;
using OpenQA.Selenium;

namespace JobConnect_Selenium.Pages
{
    public class RegisterPage
    {
        private readonly IWebDriver driver;
        private readonly WebDriverWait wait;

        // Định vị phần tử
        private readonly By signupLink = By.XPath("//*[@id=\"navbarCollapse\"]/div[2]/div[2]");
        private readonly By usernameInput = By.XPath("//*[@id=\"Username\"]");
        private readonly By passwordInput = By.XPath("//*[@id=\"Password\"]");
        private readonly By fullNameInput = By.XPath("//*[@id=\"FullName\"]");
        private readonly By emailInput = By.XPath("//*[@id=\"Email\"]");
        private readonly By dateOfBirthInput = By.XPath("//*[@id=\"DateOfBirth\"]");
        private readonly By phoneNumberInput = By.XPath("//*[@id=\"PhoneNumber\"]");
        private readonly By submitButton = By.XPath("/html/body/div/div/div/div/div/form/input[2]");
        private readonly By errorMessage = By.ClassName("text-danger");

        // Constructor
        public RegisterPage(IWebDriver driver)
        {
            this.driver = driver;
            this.wait = new WebDriverWait(driver, TimeSpan.FromSeconds(5));
        }

        // Page Actions
        public void NavigateTo(string url)
        {
            driver.Navigate().GoToUrl(url);
        }

        public void ClickSignupLink()
        {
            driver.FindElement(signupLink).Click();
        }

        public void EnterUsername(string username)
        {
            var element = driver.FindElement(usernameInput);
            element.Clear();
            element.SendKeys(username);
        }

        public void EnterPassword(string password)
        {
            var element = driver.FindElement(passwordInput);
            element.Clear();
            element.SendKeys(password);
        }

        public void EnterFullName(string fullName)
        {
            var element = driver.FindElement(fullNameInput);
            element.Clear();
            element.SendKeys(fullName);
        }

        public void EnterEmail(string email)
        {
            var element = driver.FindElement(emailInput);
            element.Clear();
            element.SendKeys(email);
        }

        public void EnterDateOfBirth(string birth)
        {
            var element = driver.FindElement(dateOfBirthInput);
            element.Clear();
            element.SendKeys(birth);
        }

        public void EnterPhoneNumber(string phone)
        {
            var element = driver.FindElement(phoneNumberInput);
            element.Clear();
            element.SendKeys(phone);
        }

        public void ClickSubmitButton()
        {
            driver.FindElement(submitButton).Click();
            System.Threading.Thread.Sleep(1000); // Retained for stability, consider replacing with a wait
        }

        public string GetErrorMessage()
        {
            return wait.Until(d => d.FindElement(errorMessage)).Text;
        }

        public bool IsAtLoginPage()
        {
            return driver.Url.Contains("Users/Login");
        }

        public bool IsAtJobsIndexPage()
        {
            return wait.Until(d => d.Url == "https://localhost:7214/Jobs/Index1");
        }
    }
}

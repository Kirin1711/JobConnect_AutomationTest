using OpenQA.Selenium;

namespace JobConnect_Selenium.Pages
{
    public class LoginPage
    {
        private readonly IWebDriver driver;
        private readonly string url = "https://localhost:7214/";

        // Định vị phần tử
        private readonly By loginLink = By.XPath("//*[@id=\"navbarCollapse\"]/div[2]/div[1]/a");
        private readonly By usernameField = By.XPath("//*[@id=\"username\"]");
        private readonly By passwordField = By.XPath("//*[@id=\"password\"]");
        private readonly By loginButton = By.XPath("/html/body/div/div/div/div/div/form/input[1]");

        public LoginPage(IWebDriver driver)
        {
            this.driver = driver;
        }

        public void NavigateTo()
        {
            driver.Navigate().GoToUrl(url);
        }

        public void Login(string email, string password)
        {
            driver.FindElement(loginLink).Click();
            driver.FindElement(usernameField).SendKeys(email);
            driver.FindElement(passwordField).SendKeys(password);
            driver.FindElement(loginButton).Click();
        }
    }
}

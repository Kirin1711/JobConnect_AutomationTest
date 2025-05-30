using OpenQA.Selenium.Support.UI;
using OpenQA.Selenium;

namespace JobConnect_Selenium.Pages
{
    public class JobListingPage
    {
        private IWebDriver driver;
        private readonly WebDriverWait wait;

        private By jobLink = By.XPath("//*[@id=\"tab-1\"]/div[1]/div/div/div/a");

        public JobListingPage(IWebDriver driver)
        {
            this.driver = driver;
            this.wait = new WebDriverWait(driver, TimeSpan.FromSeconds(10));
        }

        public string SelectFirstJob(WebDriverWait wait)
        {
            IWebElement jobElement = wait.Until(d => d.FindElement(jobLink));
            string jobTitle = jobElement.Text;
            jobElement.Click();
            return jobTitle;
        }
    }
}

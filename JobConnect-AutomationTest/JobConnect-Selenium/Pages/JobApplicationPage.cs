using OpenQA.Selenium.Support.UI;
using OpenQA.Selenium;

namespace JobConnect_Selenium.Pages
{
    public class JobApplicationPage
    {
        private IWebDriver driver;
        private readonly WebDriverWait wait;

        private By applyNowButton = By.XPath("/html/body/div[1]/div/div/div/div/div[1]/form/div/div/a");
        private By cvUploadField = By.XPath("//*[@id=\"Cv\"]");
        private By coverLetterUploadField = By.XPath("//*[@id=\"CoverLetter\"]");
        private By submitButton = By.XPath("/html/body/div[1]/div/div/div/div/div[2]/form/div[4]/button");
        private By errorMessage = By.ClassName("text-danger");
        private By validationError = By.CssSelector(".validation-summary-errors");

        public JobApplicationPage(IWebDriver driver)
        {
            this.driver = driver;
            this.wait = new WebDriverWait(driver, TimeSpan.FromSeconds(10));
        }

        public void ApplyForJob(WebDriverWait wait, string cv, string cvl)
        {
            wait.Until(d => d.FindElement(applyNowButton)).Click();
            if (!string.IsNullOrWhiteSpace(cv))
            {
                driver.FindElement(cvUploadField).SendKeys(cv);
            }
            if (!string.IsNullOrWhiteSpace(cvl))
            {
                driver.FindElement(coverLetterUploadField).SendKeys(cvl);
            }
            driver.FindElement(submitButton).Click();
        }

        public string GetErrorMessage(WebDriverWait wait)
        {
            try
            {
                IWebElement error = wait.Until(d => d.FindElement(errorMessage));
                return error.Text;
            }
            catch
            {
                return string.Empty;
            }
        }

        public string GetValidationError(WebDriverWait wait)
        {
            try
            {
                IWebElement error = wait.Until(d => d.FindElement(validationError));
                return error.Text;
            }
            catch
            {
                return string.Empty;
            }
        }
    }
}

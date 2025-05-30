using OpenQA.Selenium.Support.UI;
using OpenQA.Selenium;

namespace JobConnect_Selenium.Pages
{
    public class SearchJobPage
    {
        private readonly IWebDriver driver;
        private WebDriverWait wait;

        public SearchJobPage(IWebDriver driver)
        {
            this.driver = driver;
            wait = new WebDriverWait(driver, TimeSpan.FromSeconds(10));
        }

        // Element locators
        private IWebElement JobTitleInput => driver.FindElement(By.XPath("/html/body/div[1]/div/form/div/div/div/div[1]/div/div[1]/input"));
        private IWebElement CompanyInput => driver.FindElement(By.XPath("/html/body/div[1]/div/form/div/div/div/div[1]/div/div[2]/input"));
        private SelectElement ProfessionDropdown => new SelectElement(driver.FindElement(By.XPath("/html/body/div[1]/div/form/div/div/div/div[1]/div/div[3]/select")));
        private SelectElement LocationDropdown => new SelectElement(driver.FindElement(By.XPath("/html/body/div[1]/div/form/div/div/div/div[1]/div/div[4]/select")));
        private IWebElement SearchButton => driver.FindElement(By.XPath("/html/body/div[1]/div/form/div/div/div/div[2]/button"));

        public void EnterSearchData(string jobTitle, string company, string profession, string location)
        {
            JobTitleInput.Clear();
            JobTitleInput.SendKeys(jobTitle);

            CompanyInput.Clear();
            CompanyInput.SendKeys(company);

            ProfessionDropdown.SelectByValue(profession);
            LocationDropdown.SelectByValue(location);
        }

        public void ClickSearch()
        {
            ((IJavaScriptExecutor)driver).ExecuteScript("arguments[0].scrollIntoView(true);", SearchButton);
            Thread.Sleep(500);
            SearchButton.Click();
            Thread.Sleep(1000);
        }

        public string GetCurrentUrl() => driver.Url;

        public IReadOnlyCollection<IWebElement> GetJobResults() => driver.FindElements(By.CssSelector(".job-item"));

        public (string Title, string Company) GetFirstJobInfo()
        {
            var title = driver.FindElement(By.XPath("//div[contains(@class, 'text-start') and contains(@class, 'ps-4')]//h5")).Text.ToLower();
            var company = driver.FindElement(By.XPath("//div[contains(@class, 'text-start') and contains(@class, 'ps-4')]//h6")).Text.ToLower();
            return (title, company);
        }
    }
}
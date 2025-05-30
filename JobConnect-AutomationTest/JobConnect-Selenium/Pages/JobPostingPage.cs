using OpenQA.Selenium.Support.UI;
using OpenQA.Selenium;
using SeleniumExtras.WaitHelpers;

namespace JobConnect_Selenium.Pages
{
    public class JobPostingPage
    {
        private readonly IWebDriver driver;
        private readonly WebDriverWait wait;

        // Định vị phần tử
        private readonly By postLink = By.CssSelector(".dangtuyen-1");
        private readonly By titleField = By.XPath("//input[@id='Title']");
        private readonly By descriptionField = By.XPath("//textarea[@id='Description']");
        private readonly By salaryField = By.XPath("//input[@id='SalaryRange']");
        private readonly By experienceField = By.XPath("//input[@id='ExperienceLevel']");
        private readonly By jobTypeDropdown = By.Id("JobTypeId");
        private readonly By professionDropdown = By.Id("ProfessionId");
        private readonly By locationDropdown = By.Id("LocationId");
        private readonly By submitButton = By.XPath("/html/body/div[1]/div/div/div/div/div[2]/form/div[9]/input");
        private readonly By errorMessage = By.ClassName("text-danger");

        public JobPostingPage(IWebDriver driver)
        {
            this.driver = driver;
            this.wait = new WebDriverWait(driver, TimeSpan.FromSeconds(10)); // Thời gian chờ giống code gốc
        }

        public void NavigateToPostJob()
        {
            IWebElement link = wait.Until(d => d.FindElement(postLink));
            link.Click();
        }

        public void FillJobForm(string jobTitle, string description, string salary, string experience,
            string jobTypeValue, string professionValue, string locationValue)
        {
            driver.FindElement(titleField).SendKeys(jobTitle);
            driver.FindElement(descriptionField).SendKeys(description);
            driver.FindElement(salaryField).SendKeys(salary);
            driver.FindElement(experienceField).SendKeys(experience);

            new SelectElement(driver.FindElement(jobTypeDropdown)).SelectByValue(jobTypeValue);
            new SelectElement(driver.FindElement(professionDropdown)).SelectByValue(professionValue);
            new SelectElement(driver.FindElement(locationDropdown)).SelectByValue(locationValue);
        }

        public void SubmitJobForm()
        {
            IWebElement submitBtn = driver.FindElement(submitButton);
            ((IJavaScriptExecutor)driver).ExecuteScript("arguments[0].scrollIntoView(true);", submitBtn);
            Thread.Sleep(500);
            submitBtn.Click();
        }


        public bool IsJobPosted(string jobTitle)
        {
            return wait.Until(d => d.Url.Contains("/Jobs/Index2")) && driver.PageSource.Contains(jobTitle);
        }

        public bool IsOnJobIndexPage()
        {
            return wait.Until(d => d.Url.Contains("/Jobs/Index2"));
        }
    }
}
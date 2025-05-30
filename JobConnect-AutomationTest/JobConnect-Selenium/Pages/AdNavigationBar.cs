using OpenQA.Selenium;

namespace JobConnect_Selenium.Pages
{
    public class AdNavigationBar
    {
        private IWebDriver driver;
        public AdNavigationBar(IWebDriver driver) => this.driver = driver;

        public void GoToManageRecruitment()
        {
            driver.FindElement(By.XPath("/html/body/nav/div[3]/a[1]")).Click();
        }
    }
}

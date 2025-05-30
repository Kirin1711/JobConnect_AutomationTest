using OpenQA.Selenium.Support.UI;
using OpenQA.Selenium;

namespace JobConnect_Selenium.Pages
{
    public class AdManageRecruitmentPage
    {
        private IWebDriver driver;
        private WebDriverWait wait;

        public AdManageRecruitmentPage(IWebDriver driver)
        {
            this.driver = driver;
            wait = new WebDriverWait(driver, TimeSpan.FromSeconds(10));
        }

        public IWebElement FirstDetailLink => wait.Until(d => d.FindElement(By.XPath("/html/body/div/div/div/table/tbody/tr[1]/td[10]/div/a[1]")));

        public IList<IWebElement> GetAllRows() =>
            driver.FindElements(By.XPath("/html/body/div/div/div/table/tbody/tr"));

        public void GoToApprovalPage() =>
            driver.Navigate().GoToUrl("https://localhost:7214/Jobs/Index4");

        public string GetJobIdFromLink(IWebElement link)
        {
            string href = link.GetAttribute("href");
            return href.Split('/').Last();
        }

        public bool ApproveFirstPendingJob(out string jobId)
        {
            foreach (var row in GetAllRows())
            {
                string status = row.FindElement(By.XPath(".//td[9]")).Text.Trim();
                if (status == "Chờ duyệt")
                {
                    var detailLink = row.FindElement(By.XPath(".//a[@title='Xem chi tiết']"));
                    jobId = GetJobIdFromLink(detailLink);

                    var approveBtn = row.FindElement(By.XPath(".//form[1]/button"));
                    ((IJavaScriptExecutor)driver).ExecuteScript("arguments[0].scrollIntoView(true);", approveBtn);
                    Thread.Sleep(500);
                    approveBtn.Click();
                    return true;
                }
            }
            jobId = null;
            return false;
        }

        public bool RejectFirstPendingJob(out string jobId)
        {
            foreach (var row in GetAllRows())
            {
                string status = row.FindElement(By.XPath(".//td[9]")).Text.Trim();
                if (status == "Chờ duyệt")
                {
                    var detailLink = row.FindElement(By.XPath(".//a[@title='Xem chi tiết']"));
                    jobId = GetJobIdFromLink(detailLink);

                    var rejectBtn = row.FindElement(By.XPath(".//form[2]/button"));
                    ((IJavaScriptExecutor)driver).ExecuteScript("arguments[0].scrollIntoView(true);", rejectBtn);
                    Thread.Sleep(500);
                    rejectBtn.Click();
                    return true;
                }
            }
            jobId = null;
            return false;
        }

        public bool CheckStatus(string jobId, string expectedStatus)
        {
            foreach (var row in GetAllRows())
            {
                string href = row.FindElement(By.XPath(".//a[@title='Xem chi tiết']")).GetAttribute("href");
                if (href.Contains($"/{jobId}"))
                {
                    string actualStatus = row.FindElement(By.XPath(".//td[9]")).Text;
                    return actualStatus.Contains(expectedStatus);
                }
            }
            return false;
        }
    }
}
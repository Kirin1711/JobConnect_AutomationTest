using JobConnect_Selenium.Pages;
using OpenQA.Selenium.Edge;
using OpenQA.Selenium.Support.UI;
using OpenQA.Selenium;

namespace JobConnect_Selenium.Tests
{
    public class ManageRecruitment
    {
        private IWebDriver driver;
        private string url = "https://localhost:7214/";
        private LoginPage loginPage;
        private AdNavigationBar navBar;
        private AdManageRecruitmentPage managePage;

        [SetUp]
        public void Setup()
        {
            driver = new EdgeDriver();
            driver.Manage().Window.Maximize();
            driver.Navigate().GoToUrl(url);

            loginPage = new LoginPage(driver);
            navBar = new AdNavigationBar(driver);
            managePage = new AdManageRecruitmentPage(driver);
        }

        [TearDown]
        public void TearDown()
        {
            driver.Quit();
        }

        [Test]
        public void TC1_ViewDetails()
        {
            loginPage.Login("jobconnect@hotro.vn", "admin123");
            Thread.Sleep(1000);
            navBar.GoToManageRecruitment();
            Thread.Sleep(1000);

            string expectedJobId = managePage.GetJobIdFromLink(managePage.FirstDetailLink);
            managePage.FirstDetailLink.Click();

            Assert.That(driver.Url.Contains("/Jobs/Details3"));
            string actualJobId = driver.Url.Split('/').Last();
            Assert.That(actualJobId, Is.EqualTo(expectedJobId));
        }

        [Test]
        public void TC2_ApprovePost()
        {
            loginPage.Login("jobconnect@hotro.vn", "admin123");
            Thread.Sleep(1000);
            navBar.GoToManageRecruitment();
            Thread.Sleep(1000);

            bool found = managePage.ApproveFirstPendingJob(out string jobId);
            Assert.IsTrue(found, "Không tìm thấy tin tuyển dụng để duyệt.");

            Thread.Sleep(1000);
            managePage.GoToApprovalPage();

            bool approved = managePage.CheckStatus(jobId, "Đã duyệt");
            Assert.IsTrue(approved, "Duyệt tin tuyển dụng không thành công.");
        }

        [Test]
        public void TC3_RejectPost()
        {
            loginPage.Login("jobconnect@hotro.vn", "admin123");
            Thread.Sleep(1000);
            navBar.GoToManageRecruitment();
            Thread.Sleep(1000);

            bool found = managePage.RejectFirstPendingJob(out string jobId);
            Assert.IsTrue(found, "Không tìm thấy tin tuyển dụng để từ chối.");

            Thread.Sleep(1000);
            managePage.GoToApprovalPage();

            bool rejected = managePage.CheckStatus(jobId, "Từ chối");
            Assert.IsTrue(rejected, "Từ chối tin tuyển dụng không thành công.");
        }
    }
}

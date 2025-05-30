using JobConnect_Selenium.Pages;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
using OpenQA.Selenium.Edge;
using OpenQA.Selenium;

namespace JobConnect_Selenium.Tests
{
    public class SearchJob
    {
        private IWebDriver driver;
        private string url = "https://localhost:7214/";
        private SearchJobPage searchPage;

        [SetUp]
        public void Setup()
        {
            driver = new EdgeDriver();
            driver.Manage().Window.Maximize();
            driver.Navigate().GoToUrl(url);
            searchPage = new SearchJobPage(driver);
        }

        [TearDown]
        public void TearDown()
        {
            driver.Quit();
        }

        [Test]
        public void SearchJobWithNPOI()
        {
            string filePath = @"D:\lethanhvinh\JobConnect_AutomationTest\JobConnect-AutomationTest\TestData\SearchJob.xlsx";
            FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.ReadWrite);
            IWorkbook workbook = new XSSFWorkbook(fs);
            ISheet sheet = workbook.GetSheetAt(0);

            for (int i = 1; i <= sheet.LastRowNum; i++)
            {
                IRow row = sheet.GetRow(i);
                if (row == null) continue;

                string testData = row.GetCell(4)?.ToString();

                string[] lines = testData.Split('\n');
                string jobTitle = lines[0].Split(':')[1].Trim();
                string company = lines[1].Split(':')[1].Trim();
                string profession = lines[2].Split(':')[1].Trim();
                string location = lines[3].Split(':')[1].Trim();

                try
                {
                    if (string.IsNullOrWhiteSpace(jobTitle) &&
                        string.IsNullOrWhiteSpace(company) &&
                        string.IsNullOrWhiteSpace(profession) &&
                        string.IsNullOrWhiteSpace(location))
                    {
                        string currentUrl = searchPage.GetCurrentUrl();
                        searchPage.ClickSearch();
                        string newUrl = searchPage.GetCurrentUrl();

                        if (newUrl != currentUrl)
                        {
                            row.CreateCell(6).SetCellValue("Hiển thị tất cả công việc khi tìm kiếm rỗng");
                            row.CreateCell(7).SetCellValue("Passed");
                        }
                        else
                        {
                            row.CreateCell(6).SetCellValue("Không chuyển URL khi tìm kiếm trống");
                            row.CreateCell(7).SetCellValue("Failed");
                        }

                        continue;
                    }

                    searchPage.EnterSearchData(jobTitle, company, profession, location);
                    searchPage.ClickSearch();

                    var results = searchPage.GetJobResults();
                    if (results.Count > 0)
                    {
                        var (actualTitle, actualCompany) = searchPage.GetFirstJobInfo();
                        if (actualTitle.Contains(jobTitle.ToLower()) && actualCompany.Contains(company.ToLower()))
                        {
                            row.CreateCell(6).SetCellValue("Hiển thị công việc theo mô tả đang có trong phần tìm kiếm");
                            row.CreateCell(7).SetCellValue("Passed");
                        }
                        else
                        {
                            row.CreateCell(6).SetCellValue("Kết quả không khớp với mong đợi");
                            row.CreateCell(7).SetCellValue("Failed");
                        }
                    }
                    else
                    {
                        row.CreateCell(6).SetCellValue("Không tìm thấy công việc nào");
                        row.CreateCell(7).SetCellValue("Failed");
                    }
                }
                catch (Exception ex)
                {
                    row.CreateCell(6).SetCellValue("Lỗi: " + ex.Message);
                    row.CreateCell(7).SetCellValue("Failed");
                }
            }

            fs.Close();
            using (FileStream outFile = new FileStream(filePath, FileMode.Create, FileAccess.Write))
            {
                workbook.Write(outFile);
            }
        }
    }
}

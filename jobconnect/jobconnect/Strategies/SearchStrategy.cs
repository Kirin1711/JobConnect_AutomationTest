using jobconnect.Models;

namespace jobconnect.Strategies
{
    public class TitleFilterStrategy : IJobFilterStrategy
    {
        public IQueryable<Job> Filter(IQueryable<Job> jobs, string keyword)
        {
            return string.IsNullOrEmpty(keyword)
                ? jobs
                : jobs.Where(j => j.Title.Contains(keyword) || j.Description.Contains(keyword));
        }
    }
    public class LocationFilterStrategy : IJobFilterStrategy
    {
        public IQueryable<Job> Filter(IQueryable<Job> jobs, string location)
        {
            return string.IsNullOrEmpty(location)
                ? jobs
                : jobs.Where(j => j.Location.LocationName == location);
        }
    }
    public class ProfessionFilterStrategy : IJobFilterStrategy
    {
        public IQueryable<Job> Filter(IQueryable<Job> jobs, string profession)
        {
            return string.IsNullOrEmpty(profession)
                ? jobs
                : jobs.Where(j => j.Profession.ProfessionName == profession);
        }
    }
    public class CompanyFilterStrategy : IJobFilterStrategy
    {
        public IQueryable<Job> Filter(IQueryable<Job> jobs, string company)
        {
            return string.IsNullOrEmpty(company)
                ? jobs
                : jobs.Where(j => j.Company.CompanyName.Contains(company));
        }
    }
}

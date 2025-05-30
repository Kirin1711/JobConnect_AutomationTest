using jobconnect.Models;
using jobconnect.Repositories;
using jobconnect.Decorators;
using Microsoft.EntityFrameworkCore;
using jobconnect.Strategies;

namespace jobconnect.Facades
{
    public class JobFacade
    {
        private readonly RecruitmentManagementContext _context;
        private readonly IJobRepository _jobRepository;

        public JobFacade(RecruitmentManagementContext context, IJobRepository jobRepository)
        {
            _context = context;
            _jobRepository = jobRepository;
        }

        public async Task<(List<Job> Jobs, Dictionary<int, string> JobDisplayInfos)> GetJobs(string keyword, string searchLocation, string searchProfession, string searchCompany)
        {
            // Query cơ bản
            IQueryable<Job> jobs = _context.Jobs
                .Include(j => j.Company)
                .Include(j => j.JobType)
                .Include(j => j.Location)
                .Include(j => j.Profession)
                .Where(j => j.Status == "Approved");

            // Áp dụng các chiến lược lọc
            jobs = new TitleFilterStrategy().Filter(jobs, keyword);
            jobs = new LocationFilterStrategy().Filter(jobs, searchLocation);
            jobs = new ProfessionFilterStrategy().Filter(jobs, searchProfession);
            jobs = new CompanyFilterStrategy().Filter(jobs, searchCompany);

            var jobList = await jobs.ToListAsync();

            // Trang trí thông tin Job
            var jobDisplayInfos = jobList.ToDictionary(
                job => job.JobId,
                job =>
                {
                    IJobDisplay jobDisplay = new BasicJobDisplay(job);
                    jobDisplay = new HotJobDecorator(jobDisplay, _context, job.JobId);
                    return $"{jobDisplay.GetDisplayInfo()}";
                });

            return (jobList, jobDisplayInfos);
        }
    }
}
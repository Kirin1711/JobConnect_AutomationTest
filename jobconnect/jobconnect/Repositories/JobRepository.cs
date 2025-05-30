using jobconnect.Models;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace jobconnect.Repositories
{
    public class JobRepository : IJobRepository
    {
        private readonly RecruitmentManagementContext _context;

        public JobRepository(RecruitmentManagementContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Job>> GetFilteredJobsAsync(string keyword, string searchLocation, string searchProfession, string searchCompany)
        {
            IQueryable<Job> query = _context.Jobs
                .Include(j => j.Company)
                .Include(j => j.JobType)
                .Include(j => j.Location)
                .Include(j => j.Profession)
                .Where(j => j.Status == "Approved");

            if (!string.IsNullOrEmpty(keyword))
            {
                query = query.Where(j => j.Title.Contains(keyword) || j.Description.Contains(keyword));
            }

            if (!string.IsNullOrEmpty(searchLocation))
            {
                query = query.Where(j => j.Location.LocationName == searchLocation);
            }

            if (!string.IsNullOrEmpty(searchProfession))
            {
                query = query.Where(j => j.Profession.ProfessionName == searchProfession);
            }

            if (!string.IsNullOrEmpty(searchCompany))
            {
                query = query.Where(j => j.Company.CompanyName.Contains(searchCompany));
            }

            return await query.ToListAsync();
        }

        public async Task<IEnumerable<Location>> GetAllLocationsAsync()
        {
            return await _context.Locations.ToListAsync();
        }

        public async Task<IEnumerable<Profession>> GetAllProfessionsAsync()
        {
            return await _context.Professions.ToListAsync();
        }

        public async Task<IEnumerable<Company>> GetAllCompaniesAsync()
        {
            return await _context.Companies.ToListAsync();
        }
    }
}
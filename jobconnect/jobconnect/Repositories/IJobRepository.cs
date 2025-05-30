using jobconnect.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace jobconnect.Repositories
{
    public interface IJobRepository
    {
        Task<IEnumerable<Job>> GetFilteredJobsAsync(string keyword, string searchLocation, string searchProfession, string searchCompany);
        Task<IEnumerable<Location>> GetAllLocationsAsync();
        Task<IEnumerable<Profession>> GetAllProfessionsAsync();
        Task<IEnumerable<Company>> GetAllCompaniesAsync();
    }
}
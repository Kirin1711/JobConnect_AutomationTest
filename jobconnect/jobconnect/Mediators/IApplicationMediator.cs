using jobconnect.Models;
using Microsoft.AspNetCore.Http;

namespace jobconnect.Mediators
{
    public interface IApplicationMediator
    {
        Task<Application> CreateApplicationAsync(int jobId, IFormFile cv, IFormFile coverLetter, string userId);
    }
}
using jobconnect.Models;
using Microsoft.AspNetCore.Http;

namespace jobconnect.Handlers
{
    public interface IApplicationHandler
    {
        IApplicationHandler SetNext(IApplicationHandler handler);
        Task<(bool Success, string ErrorMessage)> HandleAsync(int jobId, IFormFile cv, IFormFile coverLetter, string userId);
    }
}
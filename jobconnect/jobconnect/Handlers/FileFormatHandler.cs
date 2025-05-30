using jobconnect.Models;
using Microsoft.AspNetCore.Http;

namespace jobconnect.Handlers
{
    public class FileFormatHandler : BaseApplicationHandler
    {
        public override async Task<(bool Success, string ErrorMessage)> HandleAsync(int jobId, IFormFile cv, IFormFile coverLetter, string userId)
        {
            if (cv != null && Path.GetExtension(cv.FileName).ToLower() != ".pdf")
            {
                return (false, "Chỉ chấp nhận file PDF cho CV.");
            }
            return await base.HandleAsync(jobId, cv, coverLetter, userId);
        }
    }
}
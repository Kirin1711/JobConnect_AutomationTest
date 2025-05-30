using jobconnect.Mediators;
using jobconnect.Models;
using Microsoft.AspNetCore.Http;

namespace jobconnect.Handlers
{
    public class FileSizeHandler : BaseApplicationHandler
    {
        private readonly IApplicationMediator _mediator;

        public FileSizeHandler(IApplicationMediator mediator)
        {
            _mediator = mediator;
        }

        public override async Task<(bool Success, string ErrorMessage)> HandleAsync(int jobId, IFormFile cv, IFormFile coverLetter, string userId)
        {
            if (cv != null && cv.Length > 5 * 1024 * 1024) // 5MB
            {
                return (false, "File CV quá lớn, tối đa 5MB.");
            }
            await _mediator.CreateApplicationAsync(jobId, cv, coverLetter, userId);
            return (true, null);
        }
    }
}
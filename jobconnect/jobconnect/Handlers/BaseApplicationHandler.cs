using jobconnect.Models;
using Microsoft.AspNetCore.Http;

namespace jobconnect.Handlers
{
    public abstract class BaseApplicationHandler : IApplicationHandler
    {
        private IApplicationHandler _nextHandler;

        public IApplicationHandler SetNext(IApplicationHandler handler)
        {
            _nextHandler = handler;
            return handler;
        }

        public virtual async Task<(bool Success, string ErrorMessage)> HandleAsync(int jobId, IFormFile cv, IFormFile coverLetter, string userId)
        {
            if (_nextHandler != null)
            {
                return await _nextHandler.HandleAsync(jobId, cv, coverLetter, userId);
            }
            return (true, null);
        }
    }
}
using jobconnect.Models;
using Microsoft.AspNetCore.Http;

namespace jobconnect.Handlers
{
    public class AuthenticationHandler : BaseApplicationHandler
    {
        private readonly RecruitmentManagementContext _context;

        public AuthenticationHandler(RecruitmentManagementContext context)
        {
            _context = context;
        }

        public override async Task<(bool Success, string ErrorMessage)> HandleAsync(int jobId, IFormFile cv, IFormFile coverLetter, string userId)
        {
            if (string.IsNullOrEmpty(userId) || !int.TryParse(userId, out int parsedUserId))
            {
                return (false, "Cần đăng nhập để nộp đơn.");
            }

            var user = await _context.Users.FindAsync(parsedUserId);
            if (user == null || user.RoleId != 1) // Giả định RoleId = 1 là Applicant
            {
                return (false, "Chỉ Applicant mới được nộp đơn.");
            }

            return await base.HandleAsync(jobId, cv, coverLetter, userId);
        }
    }
}
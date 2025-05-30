using jobconnect.Builders;
using jobconnect.Models;
using jobconnect.Repositories;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;

namespace jobconnect.Mediators
{
    public class ApplicationMediator : IApplicationMediator
    {
        private readonly RecruitmentManagementContext _context;
        private readonly IJobRepository _jobRepository;

        public ApplicationMediator(RecruitmentManagementContext context, IJobRepository jobRepository)
        {
            _context = context;
            _jobRepository = jobRepository;
        }

        public async Task<Application> CreateApplicationAsync(int jobId, IFormFile cv, IFormFile coverLetter, string userId)
        {
            // Kiểm tra Job tồn tại
            var job = (await _jobRepository.GetFilteredJobsAsync(null, null, null, null))
                .FirstOrDefault(j => j.JobId == jobId);
            if (job == null)
            {
                throw new Exception("Công việc không tồn tại.");
            }

            // Chuẩn bị đường dẫn upload
            var uploadPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads");
            if (!Directory.Exists(uploadPath))
            {
                Directory.CreateDirectory(uploadPath);
            }

            // Dùng Builder để tạo Application
            var application = new ApplicationEntityBuilder()
                .WithJobId(jobId)
                .WithUserId(int.Parse(userId))
                .WithCv(cv, uploadPath)
                .WithCoverLetter(coverLetter, uploadPath)
                .WithApplicationDate(DateTime.Now)
                .WithStatusId(6) // Mặc định "Pending"
                .Build();

            // Lưu vào database
            _context.Applications.Add(application);
            await _context.SaveChangesAsync();

            return application;
        }
    }
}
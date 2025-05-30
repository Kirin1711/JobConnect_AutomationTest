using jobconnect.Models;
using Microsoft.AspNetCore.Http;

namespace jobconnect.Builders
{
    public class ApplicationEntityBuilder
    {
        private Application _application;

        public ApplicationEntityBuilder()
        {
            _application = new Application();
        }

        public ApplicationEntityBuilder WithJobId(int jobId)
        {
            _application.JobId = jobId;
            return this;
        }

        public ApplicationEntityBuilder WithUserId(int userId)
        {
            _application.UserId = userId;
            return this;
        }

        public ApplicationEntityBuilder WithCv(IFormFile cv, string uploadPath)
        {
            if (cv != null && cv.Length > 0)
            {
                var cvFileName = Guid.NewGuid() + Path.GetExtension(cv.FileName);
                var cvPath = Path.Combine(uploadPath, cvFileName);
                using (var stream = new FileStream(cvPath, FileMode.Create))
                {
                    cv.CopyTo(stream);
                }
                _application.Cv = "/uploads/" + cvFileName;
            }
            return this;
        }

        public ApplicationEntityBuilder WithCoverLetter(IFormFile coverLetter, string uploadPath)
        {
            if (coverLetter != null && coverLetter.Length > 0)
            {
                var coverLetterFileName = Guid.NewGuid() + Path.GetExtension(coverLetter.FileName);
                var coverLetterPath = Path.Combine(uploadPath, coverLetterFileName);
                using (var stream = new FileStream(coverLetterPath, FileMode.Create))
                {
                    coverLetter.CopyTo(stream);
                }
                _application.CoverLetter = "/uploads/" + coverLetterFileName;
            }
            return this;
        }

        public ApplicationEntityBuilder WithApplicationDate(DateTime applicationDate)
        {
            _application.ApplicationDate = applicationDate;
            return this;
        }

        public ApplicationEntityBuilder WithStatusId(int statusId)
        {
            _application.StatusId = statusId;
            return this;
        }

        public Application Build()
        {
            if (!_application.JobId.HasValue || !_application.UserId.HasValue)
            {
                throw new InvalidOperationException("JobId và UserId là bắt buộc.");
            }
            if (string.IsNullOrEmpty(_application.Cv))
            {
                throw new InvalidOperationException("CV là bắt buộc.");
            }
            if (!_application.StatusId.HasValue)
            {
                _application.StatusId = 6; // Mặc định "Pending"
            }
            if (!_application.ApplicationDate.HasValue)
            {
                _application.ApplicationDate = DateTime.Now; // Mặc định ngày hiện tại
            }
            return _application;
        }
    }
}
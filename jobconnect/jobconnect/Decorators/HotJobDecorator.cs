using jobconnect.Models;

namespace jobconnect.Decorators
{
    public class HotJobDecorator : JobDisplayDecorator
    {
        private readonly RecruitmentManagementContext _context;
        private readonly int _jobId;

        public HotJobDecorator(IJobDisplay jobDisplay, RecruitmentManagementContext context, int jobId)
            : base(jobDisplay)
        {
            _context = context;
            _jobId = jobId;
        }

        public override string GetDisplayInfo()
        {
            var applicationCount = _context.Applications.Count(a => a.JobId == _jobId);
            if (applicationCount > 5)
            {
                return $"{base.GetDisplayInfo()} [Hot Job - {applicationCount} Applicants]";
            }
            return base.GetDisplayInfo();
        }
    }
}
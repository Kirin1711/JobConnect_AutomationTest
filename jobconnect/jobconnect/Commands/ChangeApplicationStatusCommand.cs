using jobconnect.Models;
using Microsoft.EntityFrameworkCore;

namespace jobconnect.Commands
{
    public class ChangeApplicationStatusCommand : ICommand
    {
        private readonly RecruitmentManagementContext _context;
        private readonly int _applicationId;
        private readonly int _newStatusId;
        private int _oldStatusId;

        public ChangeApplicationStatusCommand(RecruitmentManagementContext context, int applicationId, int newStatusId)
        {
            _context = context;
            _applicationId = applicationId;
            _newStatusId = newStatusId;
        }

        public async Task ExecuteAsync()
        {
            var application = await _context.Applications.FindAsync(_applicationId);
            if (application == null)
            {
                throw new Exception("Không tìm thấy đơn xin việc.");
            }
            _oldStatusId = application.StatusId.Value; // Lưu trạng thái cũ
            application.StatusId = _newStatusId;       // Cập nhật trạng thái mới
            await _context.SaveChangesAsync();
        }

        public async Task UndoAsync()
        {
            var application = await _context.Applications.FindAsync(_applicationId);
            if (application != null)
            {
                application.StatusId = _oldStatusId; // Hoàn tác về trạng thái cũ
                await _context.SaveChangesAsync();
            }
        }
    }
}
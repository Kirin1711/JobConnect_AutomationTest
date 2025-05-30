using jobconnect.Models;
using Microsoft.EntityFrameworkCore;

namespace jobconnect.Factories
{
    public static class UserFactory
    {
        public static async Task<User> CreateUserAsync(string roleName, RecruitmentManagementContext context)
        {
            var role = await context.Roles.FirstOrDefaultAsync(r => r.RoleName == roleName);
            if (role == null)
                throw new ArgumentException($"Role '{roleName}' not found");

            return new User
            {
                RoleId = role.RoleId,
                IsActive = true
            };
        }
    }
}
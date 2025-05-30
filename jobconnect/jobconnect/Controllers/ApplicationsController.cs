using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using jobconnect.Models;
using System.ComponentModel.Design;
using jobconnect.Builders;
using jobconnect.Mediators;
using jobconnect.Commands;
using jobconnect.Handlers;
using jobconnect.Decorators;

namespace jobconnect.Controllers
{
    public class ApplicationsController : Controller
    {
        private readonly RecruitmentManagementContext _context;
        private readonly IApplicationMediator _mediator;

        public ApplicationsController(RecruitmentManagementContext context, IApplicationMediator mediator)
        {
            _context = context;
            _mediator = mediator;
        }

        // GET: Applications
        // GET: Applications
        public async Task<IActionResult> Index()
        {
            var userId = int.Parse(Request.Cookies["UserId"]);
            var applications = await _context.Applications
                .Where(app => app.UserId == userId)
                .Include(app => app.Job)
                .Include(app => app.Status)
                .ToListAsync();

            // Dùng ViewBag để lưu thông tin Job đã trang trí
            ViewBag.JobDisplayInfos = applications.ToDictionary(
                app => app.ApplicationId,
                app =>
                {
                    IJobDisplay jobDisplay = new BasicJobDisplay(app.Job);
                    jobDisplay = new HotJobDecorator(jobDisplay, _context, app.JobId.Value);
                    return jobDisplay.GetDisplayInfo();
                });

            return View(applications);
        }
        public async Task<IActionResult> Index1()
        {
            // Lấy UserId của người đăng nhập
            var userId = int.Parse(Request.Cookies["UserId"]);

            // Lấy CompanyId của người dùng đăng nhập (giả sử bạn đã có thông tin này từ User hoặc từ một dịch vụ nào đó)
            var recruiterCompanyId = _context.Users
                                             .Where(u => u.UserId == userId)
                                             .Select(u => u.CompanyId)
                                             .FirstOrDefault();

            // Lọc các application có job thuộc công ty của người đăng nhập
            var applications = await _context.Applications
                                              .Include(a => a.Job)
                                              .ThenInclude(j => j.Company)
                                              .Include(a => a.User)
                                              .Include(a => a.Status)
                                              .Where(a => a.Job.CompanyId == recruiterCompanyId)
                                              .ToListAsync();

            return View(applications);
        }


        // GET: Applications/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var application = await _context.Applications
                .Include(a => a.Job)
                .Include(a => a.Status)
                .Include(a => a.User)
                .FirstOrDefaultAsync(m => m.ApplicationId == id);
            if (application == null)
            {
                return NotFound();
            }

            return View(application);
        }

        // GET: Applications/Create
        public IActionResult Create(int jobId)
        {
            var job = _context.Jobs.FirstOrDefault(j => j.JobId == jobId);
            if (job == null)
            {
                return NotFound();
            }

            ViewBag.JobTitle = job.Title;
            ViewBag.JobId = jobId;
            ViewBag.DefaultStatusId = 6;
            ViewData["StatusId"] = new SelectList(_context.ApplicationStatuses, "StatusId", "StatusName", 6);

            return View();
        }

        // POST: Applications/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(int jobId, IFormFile Cv, IFormFile CoverLetter)
        {
            var userId = Request.Cookies["UserId"];

            var authHandler = new AuthenticationHandler(_context);
            var formatHandler = new FileFormatHandler();
            var sizeHandler = new FileSizeHandler(_mediator);

            authHandler.SetNext(formatHandler).SetNext(sizeHandler);

            var (success, errorMessage) = await authHandler.HandleAsync(jobId, Cv, CoverLetter, userId);
            if (!success)
            {
                ModelState.AddModelError("", errorMessage);
                ViewBag.JobTitle = _context.Jobs.FirstOrDefault(j => j.JobId == jobId)?.Title;
                ViewBag.JobId = jobId;
                ViewData["StatusId"] = new SelectList(_context.ApplicationStatuses, "StatusId", "StatusName", 6);
                return View();
            }

            return RedirectToAction(nameof(Index));
        }

        // GET: Applications/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var application = await _context.Applications.FindAsync(id);
            if (application == null)
            {
                return NotFound();
            }
            ViewData["JobId"] = new SelectList(_context.Jobs, "JobId", "Title", application.JobId);
            ViewData["StatusId"] = new SelectList(_context.ApplicationStatuses, "StatusId", "StatusName", application.StatusId);
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "FullName", application.UserId);
            return View(application);
        }

        // POST: Applications/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ApplicationId,Cv,CoverLetter,ApplicationDate,JobId,UserId,StatusId")] Application application)
        {
            if (id != application.ApplicationId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    // Dùng Command để thay đổi StatusId
                    var command = new ChangeApplicationStatusCommand(_context, id, application.StatusId.Value);
                    await command.ExecuteAsync();

                    // (Tùy chọn) Cập nhật các thuộc tính khác nếu cần
                    var existingApplication = await _context.Applications.FindAsync(id);
                    if (existingApplication != null)
                    {
                        existingApplication.Cv = application.Cv;
                        existingApplication.CoverLetter = application.CoverLetter;
                        existingApplication.ApplicationDate = application.ApplicationDate;
                        existingApplication.JobId = application.JobId;
                        existingApplication.UserId = application.UserId;
                        await _context.SaveChangesAsync();
                    }

                    return RedirectToAction(nameof(Index1));
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ApplicationExists(application.ApplicationId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", $"Error: {ex.Message}");
                }
            }
            ViewData["JobId"] = new SelectList(_context.Jobs, "JobId", "Title", application.JobId);
            ViewData["StatusId"] = new SelectList(_context.ApplicationStatuses, "StatusId", "StatusName", application.StatusId);
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "FullName", application.UserId);
            return View(application);
        }

        // GET: Applications/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var application = await _context.Applications
                .Include(a => a.Job)
                .Include(a => a.Status)
                .Include(a => a.User)
                .FirstOrDefaultAsync(m => m.ApplicationId == id);
            if (application == null)
            {
                return NotFound();
            }

            return View(application);
        }

        // POST: Applications/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var application = await _context.Applications.FindAsync(id);
            if (application != null)
            {
                _context.Applications.Remove(application);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index1));
        }

        private bool ApplicationExists(int id)
        {
            return _context.Applications.Any(e => e.ApplicationId == id);
        }
    }
}

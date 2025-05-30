using jobconnect.Models;
using System.Linq;

namespace jobconnect.Strategies
{
    public interface IJobFilterStrategy
    {
        IQueryable<Job> Filter(IQueryable<Job> jobs, string value);
    }
}
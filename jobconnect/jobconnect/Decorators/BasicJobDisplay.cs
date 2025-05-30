using jobconnect.Models;

namespace jobconnect.Decorators
{
    public class BasicJobDisplay : IJobDisplay
    {
        private readonly Job _job;

        public BasicJobDisplay(Job job)
        {
            _job = job;
        }

        public string GetDisplayInfo()
        {
            return _job.Title;
        }
    }
}
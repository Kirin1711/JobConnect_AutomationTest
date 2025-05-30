namespace jobconnect.Decorators
{
    public abstract class JobDisplayDecorator : IJobDisplay
    {
        protected IJobDisplay _jobDisplay;

        public JobDisplayDecorator(IJobDisplay jobDisplay)
        {
            _jobDisplay = jobDisplay;
        }

        public virtual string GetDisplayInfo()
        {
            return _jobDisplay.GetDisplayInfo();
        }
    }
}
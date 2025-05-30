namespace jobconnect.Commands
{
    public interface ICommand
    {
        Task ExecuteAsync();
        Task UndoAsync();
    }
}
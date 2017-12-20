using AS.Models.SubModels;

namespace AS.Common.Abstractions
{
    public interface ILogProvider
    {
        void Flush(LogModel logModel);
    }
}
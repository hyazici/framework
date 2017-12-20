using AS.Models.SubModels;

namespace AS.Common.Abstractions
{
    public interface ILogger
    {
        void LogDebug(LogModel message);

        void LogSuccess(LogModel message);

        void LogInformation(LogModel message);

        void LogWarning(LogModel message);

        void LogError(LogModel message);

        void LogCritic(LogModel message);
    }
}
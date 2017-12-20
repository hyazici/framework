using System.Collections.Generic;
using AS.Business;
using AS.Common.Abstractions;
using AS.Common.Log.Providers;
using AS.Models.Enum;
using AS.Models.SubModels;
using AS.Repository.Abstractions;

namespace AS.Common
{
    public class VbtLogger : ILogger
    {
        private readonly IList<ILogProvider> _logProviders;
        private readonly IConfigurationManager _configuration;
        private readonly IGeneralRepository _general;

        public VbtLogger(IConfigurationManager configuration, IGeneralRepository general, ICacheProvider cache)
        {
            _configuration = configuration;
            _general = general;

            _logProviders = new List<ILogProvider>
            {
                 new DatabaseLogProvider(general),
                 new FileSystemLogProvider(_configuration),
                 new MailLogProvider(_configuration),
                 new EventLogProvider(_configuration)
            };
        }

        public void LogError(LogModel message)
        {
            message.IdLogType = (int)LogType.Error;
            message.IsVisible = true;
            message.Message = string.IsNullOrEmpty(message.Message) ? message.ShortMessage : message.Message;

            foreach (var logger in _logProviders)
            {
                logger.Flush(message);
            }
        }

        public void LogWarning(LogModel message)
        {
            message.IdLogType = (int)LogType.Warn;
            message.IsVisible = true;
            message.Message = string.IsNullOrEmpty(message.Message) ? message.ShortMessage : message.Message;

            foreach (var logger in _logProviders)
            {
                logger.Flush(message);
            }
        }

        public void LogInformation(LogModel message)
        {
            message.IdLogType = (int)LogType.Info;
            message.IsVisible = true;
            message.Message = string.IsNullOrEmpty(message.Message) ? message.ShortMessage : message.Message;

            foreach (var logger in _logProviders)
            {
                logger.Flush(message);
            }
        }

        public void LogDebug(LogModel message)
        {
            message.IdLogType = (int)LogType.Debug;
            message.IsVisible = true;
            message.Message = string.IsNullOrEmpty(message.Message) ? message.ShortMessage : message.Message;

            foreach (var logger in _logProviders)
            {
                logger.Flush(message);
            }
        }

        public void LogSuccess(LogModel message)
        {
            message.IdLogType = (int)LogType.Success;
            message.IsVisible = true;
            message.Message = string.IsNullOrEmpty(message.Message) ? message.ShortMessage : message.Message;

            foreach (var logger in _logProviders)
            {
                logger.Flush(message);
            }
        }

        public void LogCritic(LogModel message)
        {
            message.IdLogType = (int)LogType.Fatal;
            message.IsVisible = true;
            message.Message = string.IsNullOrEmpty(message.Message) ? message.ShortMessage : message.Message;

            foreach (var logger in _logProviders)
            {
                logger.Flush(message);
            }
        }
    }
}
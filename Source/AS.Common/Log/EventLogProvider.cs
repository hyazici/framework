using System;
using System.Diagnostics;
using System.Text;
using AS.Common.Abstractions;
using AS.Models.SubModels;

namespace AS.Common.Log.Providers
{
    public class EventLogProvider : IEventLogProvider
    {
        private readonly IConfigurationManager _config;

        public EventLogProvider(IConfigurationManager config)
        {
            _config = config;
        }

        public void Flush(LogModel logModel)
        {
            // Exception harici Log Tipi kontrolü
            if (logModel.IdLogType < 4)
            {
                return;
            }

            #region Log Type

            EventLogEntryType logType = EventLogEntryType.Error;

            if (logModel.IdLogType < 3)
            {
                logType = EventLogEntryType.Information;
            }
            else if (logModel.IdLogType == 3)
            {
                logType = EventLogEntryType.Warning;
            }
            else
            {
                logType = EventLogEntryType.Error;
            }

            //--LogType
            //Debug = 0, 4
            //Success = 1, 4
            //Info = 2, 4
            //Warn = 3, 2
            //Error = 4, 1
            //Fatal = 5 1

            //--EventLogEntryType
            //Error = 1,
            //Warning = 2,
            //Information = 4,
            //SuccessAudit = 8,
            //FailureAudit = 16

            #endregion Log Type

            StringBuilder sb = new StringBuilder();
            sb.AppendLine(logModel.ShortMessage);
            sb.AppendLine(string.Format(@"Message : {0}", logModel.Message));
            sb.AppendLine(string.Format(@"RequestUrl : {0}", logModel.RequestUrl));
            sb.AppendLine(string.Format(@"ControllerName : {0}", logModel.ControllerName));
            sb.AppendLine(string.Format(@"ActionName : {0}", logModel.ActionName));

            try
            {
                EventLog.WriteEntry(_config.Load(Strings.Configuration.General.AppName), sb.ToString(), logType);
            }
            catch (Exception)
            {
            }
        }
    }
}
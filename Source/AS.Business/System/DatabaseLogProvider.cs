using AS.Common.Abstractions;
using AS.Models;
using AS.Models.SubModels;
using AS.Repository.Abstractions;

namespace AS.Business
{
    public class DatabaseLogProvider : IDatabaseLogProvider
    {
        private readonly IGeneralRepository _general;

        public DatabaseLogProvider(IGeneralRepository general)
        {
            _general = general;
        }

        public void Flush(LogModel logModel)
        {
            SC_LOG log = new SC_LOG();
            log.ActionName = logModel.ActionName;
            log.ControllerName = (logModel.ControllerName == null) ? "" : logModel.ControllerName.Replace("WebInterface.Controllers.Partial.", "").Replace("WebInterface.Controllers.", "");
            log.Deleted = false;
            log.Message = logModel.Message;
            log.RequestUrl = logModel.RequestUrl;
            log.ShortMessage = logModel.ShortMessage;
            log.IsVisible = logModel.IsVisible;
            log.IdLogType = logModel.IdLogType;
            _general.Insert(log);
        }
    }
}
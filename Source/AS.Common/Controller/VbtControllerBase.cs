using Newtonsoft.Json;
using System;
using System.Web.Mvc;
using System.Web.Routing;
using AS.Common.Abstractions;
using AS.Common.Exceptions;
using AS.Models.SubModels;

namespace AS.Common
{
    public class VbtControllerBase : Controller
    {
        private readonly ILogger _exceptionLogger;
        private readonly IPerformanceCounter _performanceCounter;
        private RequestContext _context;

        public VbtControllerBase(ILogger exceptionLogger, IPerformanceCounter performanceCounter)
        {
            _exceptionLogger = exceptionLogger;
            _performanceCounter = performanceCounter;
        }

        protected override IAsyncResult BeginExecute(RequestContext requestContext, AsyncCallback callback, object state)
        {
            _context = requestContext;
            _performanceCounter.Start(requestContext);
            return base.BeginExecute(requestContext, callback, state);
        }

        protected override void EndExecute(IAsyncResult asyncResult)
        {
            base.EndExecute(asyncResult);
            _performanceCounter.End(_context);
        }

        protected override void OnException(ExceptionContext filterContext)
        {
            _exceptionLogger.LogError(new LogModel
            {
                RequestUrl = filterContext.HttpContext.Request.Url.ToString(),
                ControllerName = filterContext.Controller.GetType().ToString(),
                ShortMessage = filterContext.Exception.Message,
                Message = JsonConvert.SerializeObject(filterContext.Exception),
                IsVisible = true
            });

            filterContext.HttpContext.Response.StatusCode = (int)System.Net.HttpStatusCode.InternalServerError;
            filterContext.ExceptionHandled = true;

            if (filterContext.Exception is NotificationException)
            {
                filterContext.Result = Json(filterContext.Exception.Message);
            }
            else
            {
                filterContext.Result = Json("Sistemsel bir hata oluştu.");
            }

            base.OnException(filterContext);
        }
    }
}
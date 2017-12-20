using System;
using System.Web.Routing;
using AS.Common.Abstractions;

namespace AS.Common
{
    public abstract class SecureControllerBase : VbtControllerBase
    {
        private readonly IAuthenticationProvider _authenticationProvider;

        protected SecureControllerBase(IAuthenticationProvider authenticationProvider,
            ILogger exceptionLogger,
            IPerformanceCounter performanceCounter)
            : base(exceptionLogger, performanceCounter)
        {
            _authenticationProvider = authenticationProvider;
        }

        protected override IAsyncResult BeginExecute(RequestContext requestContext, AsyncCallback callback, object state)
        {
            _authenticationProvider.CheckUserAuthentication(requestContext);
            _authenticationProvider.IsActionAuthentication(requestContext);
            return base.BeginExecute(requestContext, callback, state);
        }
    }
}
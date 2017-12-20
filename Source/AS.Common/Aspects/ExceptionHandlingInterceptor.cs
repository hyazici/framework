using Castle.DynamicProxy;
using System;
using AS.Common.Abstractions;

namespace AS.Common.Aspects
{
    public class ExceptionHandlingInterceptor : GenericInterceptor
    {
        private readonly ILogger _logger;

        public ExceptionHandlingInterceptor(ILogger logger)
        {
            _logger = logger;
        }

        protected override void OnException(IInvocation invocation, Exception exception)
        {
            // _logger.LogError(new Log { Message = exception.Message });
            throw exception;
        }
    }
}
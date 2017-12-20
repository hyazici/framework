using Castle.DynamicProxy;
using System;

namespace AS.Common.Aspects
{
    public class GenericInterceptor : IInterceptor
    {
        public void Intercept(IInvocation invocation)
        {
            try
            {
                //invocation.Method.GetCustomAttributes()
                BeforeInvocation(invocation);
                OnInvocation(invocation);
                AfterInvocation(invocation);
            }
            catch (Exception e)
            {
                OnException(invocation, e);
            }
        }

        protected virtual void BeforeInvocation(IInvocation invocation)
        {
        }

        protected virtual void OnException(IInvocation invocation, Exception exception)
        {
        }

        protected virtual void AfterInvocation(IInvocation invocation)
        {
        }

        protected virtual void OnInvocation(IInvocation invocation)
        {
            invocation.Proceed();
        }
    }
}
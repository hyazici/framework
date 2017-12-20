using System;
using System.Diagnostics;
using System.Web.Routing;
using AS.Common.Abstractions;

namespace AS.Common.Performance
{
    public class PerformanceCounter : IPerformanceCounter
    {
        public PerformanceResult End(RequestContext context)
        {
            if (context != null)
            {
                Debug.WriteLine("Bitti. " + context.HttpContext.Request.Url + " : " + DateTime.Now.ToString());
            }
            else
            {
                Debug.WriteLine("Bitti.");
            }

            return new PerformanceResult();
        }

        public void Start(RequestContext context)
        {
            if (context != null)
            {
                Debug.WriteLine("Başladı. " + context.HttpContext.Request.Url + " : " + DateTime.Now.ToString());
            }
            else
            {
                Debug.WriteLine("Başladı.");
            }
        }
    }
}
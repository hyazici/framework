using System.Web.Routing;

namespace AS.Common.Abstractions
{
    public interface IPerformanceCounter
    {
        void Start(RequestContext context);

        PerformanceResult End(RequestContext context);
    }

    public class PerformanceResult
    {
    }
}
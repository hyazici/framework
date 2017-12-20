using System.Web.Routing;

namespace AS.Common.Abstractions
{
    public interface IAuthenticationProvider
    {
        void CheckUserAuthentication(RequestContext context);

        bool IsUserAuthentication();

        bool IsActionAuthentication(RequestContext context);

        string ActionCheck(string controllerName);
    }
}
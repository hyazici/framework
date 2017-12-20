using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Routing;
using AS.Business.Abstractions;
using AS.Common.Exceptions;
using AS.Models;
using AS.Common.Abstractions;
using AS.Common;

namespace AS.Business
{
    public class AuthenticationProvider : IAuthenticationProvider
    {
        private readonly IDefinitionBusiness _definitionBusiness;
        private readonly ISessionProvider _sessionProvider;
        private readonly ICacheProvider _cacheProvider;
        private readonly IMenuBusiness _menuBusiness;
        private readonly ICookieProvider _cookieProvider;
        private readonly IActionBusiness _action;

        public AuthenticationProvider(ISessionProvider sessionProvider, IEncrypter encrypter, IDefinitionBusiness definitionBusiness, ICacheProvider cacheProvider, IMenuBusiness menuBusiness, ICookieProvider cookieProvider, IActionBusiness action)
        {
            _definitionBusiness = definitionBusiness;
            _sessionProvider = sessionProvider;
            _cacheProvider = cacheProvider;
            _menuBusiness = menuBusiness;
            _cookieProvider = cookieProvider;
            _action = action;
        }

        public void CheckUserAuthentication(RequestContext context)
        {
            SC_USER user = _sessionProvider.Get<SC_USER>(Strings.Authorization.UserSessionKey);

            if (user == null)
            {
                var idUser = _cookieProvider.GetCookie(Strings.CookieKeys.IdUser);
                if (!string.IsNullOrEmpty(idUser) && idUser != "0")
                {
                    user = _definitionBusiness.Get<SC_USER>(Convert.ToInt32(idUser));

                    _sessionProvider.Set(Strings.Authorization.UserSessionKey, user);
                    _sessionProvider.Set(Strings.Authorization.IsLoginSessionKey, false);
                }
                else
                {
                    throw new AuthorizationException("Bu sayfada işlem yapmaya yetkiniz bulunmamaktadır.");
                }
            }

            IEnumerable<SC_MENU> lstMenu = _menuBusiness.GetAll(user.IdUser);

            string _controllerName = string.Empty;
            string _action = string.Empty;
            string _param = string.Empty;
            string _fullPath = context.HttpContext.Request.FilePath;

            if (context.RouteData.Values.ContainsKey("controller"))
            {
                object value = context.RouteData.Values["controller"];
                _controllerName = value.ToString();
            }

            if (context.RouteData.Values.ContainsKey("action"))
            {
                object value = context.RouteData.Values["action"];
                _action = value.ToString();
            }

            if (context.RouteData.Values.ContainsKey("id"))
            {
                object value = context.RouteData.Values["id"];
                _param = value.ToString();
            }

            for (int i = 0; i < Strings.AuthenticationPages.PageNames().Length; i++)
            {
                string pageName = Strings.AuthenticationPages.PageNames()[i];
                if (_controllerName.ToLower() == pageName.ToLower())
                {
                    return;
                }
            }

            for (int i = 0; i < Strings.AuthenticationPages.ActionPaths().Length; i++)
            {
                string actionPath = Strings.AuthenticationPages.ActionPaths()[i];
                if (_fullPath.ToLower().Contains(actionPath.ToLower()))
                {
                    return;
                }
            }

            SC_MENU objPage = null;

            if (_controllerName.ToLower() == "definition" && (_action.ToLower() == "index" || _action.ToLower() == "ındex"))
            {
                objPage = lstMenu.FirstOrDefault(k => k.Controller.ToLower() == _controllerName.ToLower() && k.Action.ToLower() == _action.ToLower() && k.Parametre.ToLower() == _param.ToLower());
            }
            else
            {
                objPage = lstMenu.FirstOrDefault(k => k.Controller.ToLower() == _controllerName.ToLower());
            }

            if (objPage == null)
            {
                throw new AuthorizationException("Bu sayfada işlem yapmaya yetkiniz bulunmamaktadır.");
            }
        }

        public bool IsUserAuthentication()
        {
            SC_USER user = _sessionProvider.Get<SC_USER>(Strings.Authorization.UserSessionKey);
            if (user == null)
            {
                return false;
            }

            return true;
        }

        public bool IsActionAuthentication(RequestContext context)
        {
            SC_USER user = _sessionProvider.Get<SC_USER>(Strings.Authorization.UserSessionKey);
            //TN_COMPANY company = _sessionProvider.Get<TN_COMPANY>(Strings.Authorization.CompanySessionKey);

            if (user == null)
            {
                return true;
            }

            // Cache Key tanımlanır. Her kullanıcı ve firma için farklı olması gerekiyor.
            string cacheMenuKey = "SC_ACTION_" + "User" + user.IdUser.ToString();

            List<SC_ACTION> _lstAction = _cacheProvider.Get<List<SC_ACTION>>(cacheMenuKey);

            if (_lstAction == null)
            {
                _lstAction = _definitionBusiness.GetAll<SC_ACTION>().ToList();
                _cacheProvider.Set(cacheMenuKey, _lstAction);
            }

            string fullPath = context.HttpContext.Request.FilePath;
            SC_ACTION objAction = _lstAction.FirstOrDefault(k => k.FullPath == fullPath);

            if (objAction != null)
            {
                var lstAction = _action.GetAll(user.IdUser);
                SC_ACTION objActionResult = null;
                if (lstAction != null)
                {
                    objActionResult = lstAction.FirstOrDefault(k => k.IdAction == objAction.IdAction);
                }

                if (objActionResult != null)
                {
                    throw new NotAuthorizationActionException();
                }
            }

            return true;
        }

        public string ActionCheck(string controllerName)
        {
            SC_USER user = _sessionProvider.Get<SC_USER>(Strings.Authorization.UserSessionKey);

            StringBuilder strBuilder = new StringBuilder();
            controllerName = controllerName.ToLower();

            var lst = _action.GetAll(user.IdUser).Where(k => k.FullPath.ToLower().IndexOf(controllerName) != -1).ToList();

            strBuilder.Append("Bu sayfada size özel bazı kısıtlamalar bulunmaktadır :  ");
            for (int i = 0; i < lst.Count; i++)
            {
                SC_ACTION obj = lst[i];
                strBuilder.Append(obj.ActionDesc);
                if (i != lst.Count - 1)
                {
                    strBuilder.Append(", ");
                }
            }
            if (lst.Count == 0)
            {
                return string.Empty;
            }
            throw new NotificationException(strBuilder.ToString());
        }
    }
}
using System;
using System.Diagnostics;
using System.Web;
using AS.Common.Abstractions;

namespace AS.Common.Cookie
{
    public class CookieProvider : ICookieProvider
    {
        public void SetCookie(string key, string value, TimeSpan expires)
        {
            if (HttpContext.Current.Request.Cookies[key] != null)
            {
                var cookieOld = HttpContext.Current.Request.Cookies[key];
                cookieOld.Expires = DateTime.Now.Add(expires);
                cookieOld.Value = value;
                cookieOld.HttpOnly = true;
                HttpContext.Current.Response.Cookies.Add(cookieOld);
                Debug.WriteLine(string.Format("key: {0}, value: {1} sahip bir cookie güncellendi.", key, value));
            }
            else
            {
                HttpCookie cookie = new HttpCookie(key, value);
                cookie.Expires = DateTime.Now.Add(expires);
                cookie.HttpOnly = true;
                HttpContext.Current.Response.Cookies.Add(cookie);
                Debug.WriteLine(string.Format("key: {0}, value: {1} sahip bir cookie eklendi.", key, value));
            }
        }

        public string GetCookie(string key)
        {
            string value = string.Empty;
            HttpCookie cookie = HttpContext.Current.Request.Cookies[key];

            if (cookie != null)
            {
                value = cookie.Value;
            }
            return value;
        }
    }
}
using System;

namespace AS.Common.Abstractions
{
    public interface ICookieProvider
    {
        void SetCookie(string key, string value, TimeSpan expires);

        string GetCookie(string cookiename);
    }
}
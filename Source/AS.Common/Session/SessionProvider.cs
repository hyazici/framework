using System.Collections.Generic;
using System.Web;
using AS.Common.Abstractions;

namespace AS.Common.Session
{
    public class SessionProvider : ISessionProvider
    {
        public bool Check()
        {
            return (HttpContext.Current.Session != null);
        }

        public bool Get(string name)
        {
            return (bool)HttpContext.Current.Session[name];
        }

        public TType Get<TType>(string name) where TType : class
        {
            if (HttpContext.Current.Session[name] == null)
            {
                return null;
            }

            return HttpContext.Current.Session[name] as TType;
        }

        public IEnumerable<TType> GetList<TType>(string name)
        {
            if (HttpContext.Current.Session[name] == null)
            {
                return null;
            }

            return HttpContext.Current.Session[name] as List<TType>;
        }

        public void Set(string name, object value)
        {
            HttpContext.Current.Session[name] = value;
        }

        public void Remove(string name)
        {
            HttpContext.Current.Session.Remove(name);
        }

        public void Clear()
        {
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session.RemoveAll();
            HttpContext.Current.Session.Abandon();
        }
    }
}
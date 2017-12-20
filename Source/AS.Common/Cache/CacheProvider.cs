using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AS.Common.Abstractions;
using AS.Models.SubModels;

namespace AS.Common.Cache
{
    public class CacheProvider : ICacheProvider
    {
        private readonly List<CacheItem> _lstCache = new List<CacheItem>();

        public TType Get<TType>(string key) where TType : class
        {
            return HttpContext.Current.Cache[key] as TType;
        }

        public void Set(string key, object value)
        {
            var lstBybassKey = Strings.CacheKeys.BypassNameList.Split(';');
            for (int i = 0; i < lstBybassKey.Length; i++)
            {
                if (key.Contains(lstBybassKey[i]))
                {
                    return;
                }
            }

            var cache = _lstCache.FirstOrDefault(k => k.Name == key);
            if (cache != null)
            {
                _lstCache.Remove(cache);
            }

            CacheItem item = new CacheItem
            {
                Name = key,
                Date = DateTime.Now
            };
            try
            {
                if (value is IList)
                {
                    item.Count = ((IList)value).Count;
                }
            }
            catch
            {
                // ignored
            }

            _lstCache.Add(item);
            HttpContext.Current.Cache.Insert(key, value);
        }

        //public static void Add<T>(T o, string key) where T : class
        //{
        //    // NOTE: Apply expiration parameters as you see fit.
        //    // In this example, I want an absolute
        //    // timeout so changes will always be reflected
        //    // at that time. Hence, the NoSlidingExpiration.
        //    HttpContext.Current.Cache.Insert(
        //        key,
        //        o,
        //        null,
        //        DateTime.Now.AddMinutes(
        //            ConfigurationHelper.CacheExpirationMinutes),
        //        System.Web.Caching.Cache.NoSlidingExpiration);
        //}

        public void Clear()
        {
            foreach (DictionaryEntry entry in HttpContext.Current.Cache)
            {
                var cache = _lstCache.FirstOrDefault(k => k.Name == entry.Key.ToString());
                if (cache != null)
                {
                    _lstCache.Remove(cache);
                }
                HttpContext.Current.Cache.Remove(entry.Key.ToString());
            }
        }

        public List<CacheItem> List()
        {
            return _lstCache;
        }

        public void ClearInContains(string containText)
        {
            foreach (DictionaryEntry entry in HttpContext.Current.Cache)
            {
                if (entry.Key.ToString().Contains(containText))
                {
                    var cache = _lstCache.FirstOrDefault(k => k.Name == entry.Key.ToString());
                    if (cache != null)
                    {
                        _lstCache.Remove(cache);
                    }

                    HttpContext.Current.Cache.Remove(entry.Key.ToString());
                }
            }
        }

        public void Remove(string key)
        {
            if (string.IsNullOrEmpty(key))
            {
                return;
            }

            if (key.Contains(";"))
            {
                var lst = key.Split(';');
                for (int i = 0; i < lst.Length; i++)
                {
                    if (HttpContext.Current.Cache[lst[i]] != null)
                    {
                        var cache = _lstCache.FirstOrDefault(k => k.Name == lst[i]);
                        if (cache != null)
                        {
                            _lstCache.Remove(cache);
                        }

                        HttpContext.Current.Cache.Remove(lst[i]);
                    }
                }
            }
            else
            {
                if (HttpContext.Current.Cache[key] != null)
                {
                    var cache = _lstCache.FirstOrDefault(k => k.Name == key);
                    if (cache != null)
                    {
                        _lstCache.Remove(cache);
                    }

                    HttpContext.Current.Cache.Remove(key);
                }
            }
        }

        public bool Exists(string key)
        {
            return HttpContext.Current.Cache[key] != null;
        }
    }
}
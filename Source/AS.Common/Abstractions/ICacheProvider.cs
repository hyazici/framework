using System.Collections.Generic;
using AS.Models.SubModels;

namespace AS.Common.Abstractions
{
    public interface ICacheProvider
    {
        TType Get<TType>(string name) where TType : class;

        void Set(string name, object value);

        void Clear();

        void ClearInContains(string containText);

        void Remove(string name);

        List<CacheItem> List();

        bool Exists(string key);
    }
}
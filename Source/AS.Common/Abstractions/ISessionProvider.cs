using System.Collections.Generic;

namespace AS.Common.Abstractions
{
    public interface ISessionProvider
    {
        bool Check();

        TType Get<TType>(string name) where TType : class;

        IEnumerable<TType> GetList<TType>(string name);

        bool Get(string name);

        void Set(string name, object value);

        void Remove(string name);

        void Clear();
    }
}
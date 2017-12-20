using AS.Models;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Reflection;

namespace AS.Business.Helper
{
    public static class TypeHelper
    {
        private static readonly ConcurrentDictionary<RuntimeTypeHandle, IEnumerable<PropertyInfo>> TypeProperties = new ConcurrentDictionary<RuntimeTypeHandle, IEnumerable<PropertyInfo>>();

        private static IDictionary<string, Type> types = new Dictionary<string, Type>
        {
            { "SC_ROLE", typeof(SC_ROLE) },
            { "GN_COLUMN", typeof(GN_COLUMN) },
            { "SC_ACTION", typeof(SC_ACTION) }
        };

        private static IDictionary<string, object> objects = new Dictionary<string, object>
        {
            { "SC_ROLE", new SC_ROLE() },
            { "GN_COLUMN", new GN_COLUMN () },
            { "SC_ACTION", new SC_ACTION() }
        };

        public static Type GetCustomTypes(string typeName)
        {
            return types[typeName];
        }

        public static object GetCustomObjects(string typeName)
        {
            return objects[typeName];
        }

        public static List<PropertyInfo> GetTypeProperties(Type type)
        {
            IEnumerable<PropertyInfo> pis;
            if (TypeProperties.TryGetValue(type.TypeHandle, out pis))
            {
                return pis.ToList();
            }

            var properties = type.GetProperties().ToArray();
            TypeProperties[type.TypeHandle] = properties;
            return properties.ToList();
        }

        public static dynamic RemoveProperties<T>(this T objClass)
        {
            var t = objClass.GetType();
            var returnClass = new ExpandoObject() as IDictionary<string, object>;

            List<string> lstProperties = new List<string> { "CreUser", "CreDate", "ModUser", "ModDate", "Client", "ClientIp", "Deleted" };

            foreach (var pr in t.GetProperties())
            {
                if (lstProperties.Contains(pr.Name))
                {
                    continue;
                }

                var val = pr.GetValue(objClass);
                returnClass.Add(pr.Name, val);
            }
            return returnClass;
        }
    }
}
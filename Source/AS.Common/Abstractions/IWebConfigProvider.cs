using System.Collections.Generic;
using AS.Models.SubModels;

namespace AS.Common.Abstractions
{
    public interface IWebConfigProvider
    {
        List<WebParameter> GetAll();

        bool Save(List<WebParameter> lstObj);

        string GetValue(List<WebParameter> lst, string key);
    }
}
using System.Collections.Generic;
using AS.Models.SubModels;

namespace AS.Repository.Abstractions
{
    public interface IWebConfigRepository
    {
        List<WebParameter> GetAll();

        bool Save(List<WebParameter> lstObj);

        string GetValue(List<WebParameter> lst, string key);
    }
}
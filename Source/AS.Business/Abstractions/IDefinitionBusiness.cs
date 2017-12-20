using System.Collections.Generic;
using AS.Models;
using AS.Models.SubModels;

namespace AS.Business.Abstractions
{
    public interface IDefinitionBusiness
    {
        TModel Get<TModel>(int id) where TModel : class;

        IList<TModel> GetAll<TModel>(bool withDeleted = false) where TModel : BaseViewModel;

        IList<object> GetAll(string tableName);

        TModel Insert<TModel>(TModel obj) where TModel : BaseModel, new();

        TModel Update<TModel>(TModel obj) where TModel : BaseModel;

        bool Delete<TModel>(TModel obj) where TModel : BaseModel;

        void Delete(string tableName, int id);

        void Save(string tableName, int id, List<DefinitionProperty> lstProp);

        IList<VW_FIELD> GetAllFields(string tableName);

        IList<TModel> GetAllCustom<TModel>(string sql);

        TModel GetCustom<TModel>(string sql);
    }
}
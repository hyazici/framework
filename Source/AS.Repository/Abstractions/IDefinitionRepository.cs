using System.Collections.Generic;
using System.Data;
using AS.Models;

namespace AS.Repository.Abstractions
{
    public interface IDefinitionRepository
    {
        TModel Get<TModel>(int id, IDbTransaction trans = null)
          where TModel : class;

        IList<TModel> GetAll<TModel>(bool withDeleted = false, IDbTransaction trans = null)
            where TModel : BaseViewModel;

        IList<object> GetAll(string tableName, IDbTransaction trans = null);

        TModel Insert<TModel>(TModel obj, IDbTransaction trans = null)
            where TModel : BaseModel, new();

        TModel Update<TModel>(TModel obj, IDbTransaction trans = null)
            where TModel : BaseModel;

        void Delete(string tableName, int id);

        // Definition Page

        IList<VW_FIELD> GetAllFields(string tableName);

        IList<TModel> GetAllCustom<TModel>(string sql, object param = null, IDbTransaction trans = null);

        TModel GetCustom<TModel>(string sql, object param = null, IDbTransaction trans = null);
    }
}
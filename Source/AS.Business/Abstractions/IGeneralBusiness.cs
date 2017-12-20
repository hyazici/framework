using System.Collections.Generic;
using System.Data;
using AS.Models;

namespace AS.Business.Abstractions
{
    public interface IGeneralBusiness
    {
        TModel Get<TModel>(int id, IDbTransaction trans = null) where TModel : class;

        IList<TModel> GetAll<TModel>(bool withDeleted = false, IDbTransaction trans = null) where TModel : BaseViewModel;

        TModel Insert<TModel>(TModel obj, IDbTransaction trans = null) where TModel : BaseModel, new();

        TModel Update<TModel>(TModel obj, IDbTransaction trans = null) where TModel : BaseModel;

        TModel Delete<TModel>(TModel obj) where TModel : BaseModel;

        IList<TModel> StoredProcedure<TModel>(string spName, object param = null, IDbTransaction trans = null);
    }
}
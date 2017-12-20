using System;
using System.Collections.Generic;
using System.Data;
using AS.Models;

namespace AS.Repository.Abstractions
{
    public interface IGeneralRepository
    {
        IDbConnection Connection { get; }

        TModel Get<TModel>(decimal id, IDbTransaction trans = null) where TModel : class;

        TModel Get<TModel>(Func<TModel> predicate, IDbTransaction trans = null) where TModel : class;

        IList<TModel> GetAll<TModel>(bool withDeleted = false, IDbTransaction trans = null) where TModel : BaseViewModel;

        TModel Insert<TModel>(TModel obj, IDbTransaction trans = null) where TModel : BaseModel, new();

        TModel Update<TModel>(TModel obj, IDbTransaction trans = null) where TModel : BaseModel;

        TModel Delete<TModel>(TModel obj, IDbTransaction trans = null) where TModel : BaseModel;

        IList<TModel> GetAllCustom<TModel>(string sql, object param = null, IDbTransaction trans = null);

        TModel GetCustom<TModel>(string sql, object param = null, IDbTransaction trans = null);

        IList<TModel> StoredProcedure<TModel>(string spName, object param = null, IDbTransaction trans = null);
    }
}
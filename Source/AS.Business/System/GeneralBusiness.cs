using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AS.Business;
using AS.Business.Abstractions;
using AS.Models;
using AS.Repository.Abstractions;

namespace AS.Business
{
    public class GeneralBusiness : IGeneralBusiness
    {
        private readonly IGeneralRepository _repository;

        public GeneralBusiness(IGeneralRepository repository)
        {
            _repository = repository;
        }
        public TModel Delete<TModel>(TModel obj) where TModel : BaseModel
        {
            return _repository.Delete(obj);
        }

        public TModel Get<TModel>(int id, IDbTransaction trans = null) where TModel : class
        {
            return _repository.Get<TModel>(id, trans);
        }

        public IList<TModel> GetAll<TModel>(bool withDeleted = false, IDbTransaction trans = null) where TModel : BaseViewModel
        {
            return _repository.GetAll<TModel>(withDeleted, trans);
        }

        public TModel Insert<TModel>(TModel obj, IDbTransaction trans = null) where TModel : BaseModel, new()
        {
            return _repository.Insert(obj, trans);
        }

        public IList<TModel> StoredProcedure<TModel>(string spName, object param = null, IDbTransaction trans = null)
        {
            return _repository.StoredProcedure<TModel>(spName, param, trans);
        }

        public TModel Update<TModel>(TModel obj, IDbTransaction trans = null) where TModel : BaseModel
        {
            return _repository.Update(obj, trans);
        }
    }
}

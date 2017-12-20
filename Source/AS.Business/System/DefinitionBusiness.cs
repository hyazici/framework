using AS.Business.Abstractions;
using AS.Business.Helper;
using AS.Common;
using AS.Common.Abstractions;
using AS.Models;
using AS.Models.SubModels;
using AS.Repository.Abstractions;
using System;
using System.Collections.Generic;
using System.Linq;

namespace AS.Business.System
{
    public class DefinitionBusiness : IDefinitionBusiness
    {
        private readonly IDefinitionRepository _repository;
        private readonly ICacheProvider _cache;
        private readonly ISessionProvider _session;

        public DefinitionBusiness(IDefinitionRepository repository, ICacheProvider cache, ISessionProvider session)
        {
            _repository = repository;
            _cache = cache;
            _session = session;
        }

        // Get
        public TModel Get<TModel>(int id) where TModel : class
        {
            return _repository.Get<TModel>(id);
        }

        // GetAll
        public IList<TModel> GetAll<TModel>(bool withDeleted = false)
        where TModel : BaseViewModel
        {
            string cacheName = typeof(TModel).Name;
            List<TModel> lst = null;
            if (withDeleted)
            {
                // Silinmiş Kayıtlar Dahil
                lst = _cache.Get<List<TModel>>(cacheName + "_ALL");

                if (lst == null)
                {
                    lst = _repository.GetAll<TModel>().ToList();
                    _cache.Set(cacheName + "_ALL", lst);
                }
            }
            else
            {
                lst = _cache.Get<List<TModel>>(cacheName);

                if (lst == null)
                {
                    lst = _repository.GetAll<TModel>().Where(k => k.Deleted == false).ToList();

                    _cache.Set(cacheName, lst);
                }
            }

            return lst;
        }

        public IList<object> GetAll(string tableName)
        {
            return _repository.GetAll(tableName);
        }

        public IList<VW_FIELD> GetAllFields(string tableName)
        {
            return _repository.GetAllFields(tableName);
        }

        // Insert
        public TModel Insert<TModel>(TModel obj)
        where TModel : BaseModel, new()
        {
            // Cache Remove.
            _cache.ClearInContains(typeof(TModel).Name);

            if (_session.Check())
            {
                // Audit Infos
                var user = _session.Get<SC_USER>(Strings.Authorization.UserSessionKey);
                if (user != null)
                {
                    obj.ModUser = user.IdUser;
                    obj.CreUser = user.IdUser;
                }
            }

            return _repository.Insert(obj);
        }

        // Update
        public TModel Update<TModel>(TModel obj)
        where TModel : BaseModel
        {
            // Cache Remove.
            _cache.ClearInContains(typeof(TModel).Name);

            if (_session.Check())
            {
                var user = _session.Get<SC_USER>(Strings.Authorization.UserSessionKey);
                if (user != null)
                {
                    obj.ModUser = user.IdUser;
                }
            }

            return _repository.Update(obj);
        }

        // Delete
        public bool Delete<TModel>(TModel obj)
        where TModel : BaseModel
        {
            // Cache Remove.
            _cache.ClearInContains(typeof(TModel).Name);

            obj.Deleted = true;
            _repository.Update(obj);
            return true;
        }

        // Delete 2
        public void Delete(string tableName, int id)
        {
            _cache.ClearInContains(tableName);
            _repository.Delete(tableName, id);
        }

        public void Save(string tableName, int id, List<DefinitionProperty> lstProp)
        {
            SC_USER user = _session.Get<SC_USER>(Strings.Authorization.UserSessionKey);

            Type customType = TypeHelper.GetCustomTypes(tableName);
            dynamic obj = TypeHelper.GetCustomObjects(tableName);
            var lstProperty = TypeHelper.GetTypeProperties(customType);

            foreach (var prop in lstProperty)
            {
                if (prop.Name == "CreUser" || prop.Name == "ModUser")
                {
                    prop.SetValue(obj, Convert.ChangeType(user.IdUser, prop.PropertyType), null);
                    continue;
                }

                if (prop.Name == "Deleted" || prop.Name == "Client" || prop.Name == "ClientIp" || prop.Name == "CreDate" || prop.Name == "ModDate")
                {
                    continue;
                }

                for (int i = 0; i < lstProp.Count; i++)
                {
                    if (lstProp[i].Key == prop.Name)
                    {
                        prop.SetValue(obj, Convert.ChangeType(lstProp[i].Value, prop.PropertyType), null);
                        break;
                    }
                }
            }

            if (id > 0)
            {
                Update(obj);
            }
            else
            {
                Insert(obj);
            }

            //#region Save Log Record

            //var log = new Log()
            //{
            //    ActionName = "Save",
            //    ControllerName = "DefinitionController",
            //    RequestUrl = "/Definition"
            //};

            //if (id > 0)
            //{
            //    log.ShortMessage = Strings.Messages.Definition.Update(tableName, id);
            //}
            //else
            //{
            //    log.ShortMessage = Strings.Messages.Definition.Insert(tableName, id);
            //}

            //// Log Save
            ////_logger.LogSuccess(log);

            //#endregion Save Log Record
        }

        public IList<TModel> GetAllCustom<TModel>(string sql)
        {
            return _repository.GetAllCustom<TModel>(sql);
        }

        public TModel GetCustom<TModel>(string sql)
        {
            return _repository.GetCustom<TModel>(sql);
        }
    }
}
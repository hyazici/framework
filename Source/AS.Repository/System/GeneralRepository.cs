using Dapper;
using Dapper.Contrib.Extensions;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using AS.Common;
using AS.Repository.Abstractions;
using AS.Models;
using AS.Common.Abstractions;

namespace AS.Repository
{
    public class GeneralRepository : IGeneralRepository
    {
        private readonly ISessionProvider _session;

        public GeneralRepository(ISessionProvider session)
        {
            _session = session;
        }

        public IDbConnection Connection
        {
            get
            {
                return Bootstrapper.Data.Connection;
            }
        }

        public TModel Delete<TModel>(TModel obj, IDbTransaction trans = null) where TModel : BaseModel
        {
            var user = _session.Get<SC_USER>(Strings.Authorization.UserSessionKey);

            if (user != null)
                obj.ModUser = user.IdUser;

            obj.Deleted = true;
            Connection.Update(obj, trans);
            return obj;
        }

        public TModel Get<TModel>(decimal id, IDbTransaction trans = null) where TModel : class
        {
            return Connection.Get<TModel>(id, trans);
        }

        public TModel Get<TModel>(object param, IDbTransaction trans = null) where TModel : class
        {
            if (param == null)
            {
                return null;
            }

            string sql = "SELECT * FROM " + typeof(TModel).Name + " (NOLOCK) ";
            var properties = param.GetType().GetProperties();

            //foreach (var p in properties)
            //{
            //    sql += p.Name + " " + p.GetValue
            //    string name = p.Name;
            //    var value = p.GetValue(some_object, null);
            //}

            return null;
        }

        public IList<TModel> GetAll<TModel>(bool withDeleted = false, IDbTransaction trans = null) where TModel : BaseViewModel
        {
            List<TModel> lst = null;
            if (withDeleted)
            {
                lst = Connection.GetAll<TModel>(trans).ToList();
            }
            else
            {
                lst = Connection.GetAll<TModel>(trans).Where(k => k.Deleted == false).ToList();
            }
            return lst;
        }

        public TModel Insert<TModel>(TModel obj, IDbTransaction trans = null) where TModel : BaseModel, new()
        {
            var user = _session.Get<SC_USER>(Strings.Authorization.UserSessionKey);
            if (user != null)
            {
                obj.CreUser = user.IdUser;
                obj.ModUser = user.IdUser;
            }

            var id = Connection.Insert(obj, trans);

            return Connection.Get<TModel>(id, trans);
        }

        public TModel Update<TModel>(TModel obj, IDbTransaction trans = null) where TModel : BaseModel
        {
            var user = _session.Get<SC_USER>(Strings.Authorization.UserSessionKey);
            if (user != null)
                obj.ModUser = user.IdUser;

            var result = Connection.Update(obj, trans);
            return obj;
        }

        public IList<TModel> GetAllCustom<TModel>(string sql, object param = null, IDbTransaction trans = null)
        {
            return Connection.Query<TModel>(sql, param, trans).ToList();
        }

        public TModel GetCustom<TModel>(string sql, object param = null, IDbTransaction trans = null)
        {
            return Connection.Query<TModel>(sql, param, trans).FirstOrDefault();
        }

        public IList<TModel> StoredProcedure<TModel>(string spName, object param = null, IDbTransaction trans = null)
        {
            var result = Connection.Query<TModel>(spName, param, trans, commandType: CommandType.StoredProcedure).ToList();
            if (result == null || result.Count == 0)
            {
                return null;
            }
            return result;
        }

        public TModel Get<TModel>(Func<TModel> predicate, IDbTransaction trans = null) where TModel : class
        {
            //ferhat TODO
            //string sql = string.Format(@"SELECT * FROM {0} (NOLOCK)", typeof(TModel).Name);
            //return Connection.Get<TModel>(id, trans);
            return null;
        }
    }
}
using Dapper;
using Dapper.Contrib.Extensions;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using AS.Common;
using AS.Repository.Abstractions;
using AS.Models;
using AS.Common.Abstractions;

namespace AS.Repository.System
{
    public class DefinitionRepository : IDefinitionRepository
    {
        private readonly ISessionProvider _session;

        public DefinitionRepository(ISessionProvider session)
        {
            _session = session;
        }

        public IDbConnection _connection
        {
            get
            {
                return Bootstrapper.Data.Connection;
            }
        }

        public TModel Get<TModel>(int id, IDbTransaction trans = null)
            where TModel : class
        {
            return _connection.Get<TModel>(id);
        }

        public IList<TModel> GetAll<TModel>(bool withDeleted = false, IDbTransaction trans = null)
            where TModel : BaseViewModel
        {
            return _connection.GetAll<TModel>(trans).ToList();
        }

        public TModel Insert<TModel>(TModel obj, IDbTransaction trans = null)
            where TModel : BaseModel, new()
        {
            if (_session.Check())
            {
                var user = _session.Get<SC_USER>(Strings.Authorization.UserSessionKey);

                if (user != null)
                {
                    obj.CreUser = user.IdUser;
                    obj.ModUser = user.IdUser;
                }
            }

            var id = _connection.Insert(obj, trans);
            obj = _connection.Get<TModel>(id, trans);
            return obj;
        }

        public TModel Update<TModel>(TModel obj, IDbTransaction trans = null)
            where TModel : BaseModel
        {
            if (_session.Check())
            {
                var user = _session.Get<SC_USER>(Strings.Authorization.UserSessionKey);

                if (user != null)
                {
                    obj.ModUser = user.IdUser;
                }
            }

            _connection.Update(obj, trans);
            return obj;
        }

        public void Delete(string tableName, int id)
        {
            string sql = $@" SELECT ColumnName FROM VW_FIELD(NOLOCK) WHERE TableName='{tableName}' AND IsIdentity = 1";
            string primaryKey = _connection.Query<string>(sql).FirstOrDefault();
            sql = $@"UPDATE {tableName} SET Deleted = 1 WHERE {primaryKey} = {id} ";
            var result = _connection.Execute(sql);
        }

        public IList<VW_FIELD> GetAllFields(string tableName)
        {
            string sql = @"SELECT * FROM VW_FIELD WHERE TableName = @prmTableName ORDER BY TabIndex";
            return _connection.Query<VW_FIELD>(sql, new { prmTableName = tableName }).ToList();
        }

        public IList<object> GetAll(string tableName, IDbTransaction trans = null)
        {
            string sql = $@"SELECT * FROM {tableName} WHERE Deleted = 0";
            return _connection.Query<object>(sql).ToList();
        }

        public IList<TModel> GetAllCustom<TModel>(string sql, object param = null, IDbTransaction trans = null)
        {
            return _connection.Query<TModel>(sql, param, trans).ToList();
        }

        public TModel GetCustom<TModel>(string sql, object param = null, IDbTransaction trans = null)
        {
            return _connection.Query<TModel>(sql).FirstOrDefault();
        }
    }
}
using System.Collections.Generic;
using System.Data;
using System.Linq;
using Dapper;
using Dapper.Contrib.Extensions;
using AS.Repository.Abstractions;
using AS.Models;
using AS.Common;

namespace AS.Repository.System
{
    public class MenuRepository : IMenuRepository
    {
        public IDbConnection _connection
        {
            get
            {
                return Bootstrapper.Data.Connection;
            }
        }


        public SC_MENU Get(int id)
        {
            return _connection.Get<SC_MENU>(id);
        }

        public IList<SC_MENU> GetAll()
        {
            var result = _connection.GetAll<SC_MENU>().Where(k => k.Deleted == false && k.isActive == true);
            return result.ToList();
        }

        public IList<SC_MENU> GetAll(int idUser)
        {
            var menu = _connection.Query<SC_MENU>("SELECT * FROM dbo.fn_Menu (@prmIdUser) ORDER BY OrderNumber", new { prmIdUser = idUser }).ToList();
            return menu;
        }
    }
}
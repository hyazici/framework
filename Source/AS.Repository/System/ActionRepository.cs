using System.Collections.Generic;
using System.Data;
using System.Linq;
using Dapper;
using AS.Common;
using AS.Repository.Abstractions;
using AS.Models;

namespace AS.Repository.System
{
    public class ActionRepository : IActionRepository
    {
        public IDbConnection _connection
        {
            get
            {
                return Bootstrapper.Data.Connection;
            }
        }

        public IList<SC_ACTION> GetAll(int idUser)
        {
            string sql = "SELECT * FROM dbo.fn_Action (@prmIdUser)";
            return _connection.Query<SC_ACTION>(sql, new { prmIdUser = idUser }).ToList();
        }
    }
}
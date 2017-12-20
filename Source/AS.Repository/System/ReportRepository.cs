using AS.Common;
using AS.Models;
using AS.Models.SubModels;
using AS.Repository.Abstractions;
using Dapper;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace AS.Repository.System
{
    public class ReportRepository : IReportRepository
    {
        public IDbConnection _connection
        {
            get
            {
                return Bootstrapper.Data.Connection;
            }
        }

        public List<RP_REPORT> GetListReportNames()
        {
            string sql = @" SELECT o.[object_id] AS IdReport
	                            ,SUBSTRING(o.NAME, 7, LEN(o.NAME)) AS ReportName
	                            ,o.NAME AS SourceName
	                            ,o.create_date AS CreDate
                            FROM sys.objects o WITH (NOLOCK)
                            WHERE o.NAME LIKE 'VW_RP_%'
                            ORDER BY o.Name";

            var lst = _connection.Query<RP_REPORT>(sql).ToList();

            return lst;
        }

        public List<Column> GetListColumnNames(string tableName)
        {
            string sql = $@"   SELECT C.COLUMN_NAME AS ColumnName, G.ColumnNewName
                                            FROM INFORMATION_SCHEMA.COLUMNS C(NOLOCK)
                                            LEFT JOIN GN_COLUMN G ON G.ColumnName = C.COLUMN_NAME
                                            WHERE C.TABLE_NAME = '{tableName}'
                                            ORDER BY C.ORDINAL_POSITION";

            var lst = _connection.Query<Column>(sql).ToList();

            return lst;
        }
    }
}
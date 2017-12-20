using System.Collections.Generic;
using AS.Models;
using AS.Models.SubModels;

namespace AS.Repository.Abstractions
{
    public interface IReportRepository
    {
        List<RP_REPORT> GetListReportNames();

        List<Column> GetListColumnNames(string tableName);
    }
}
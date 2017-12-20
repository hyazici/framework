using System.Collections.Generic;
using AS.Models;
using AS.Models.SubModels;

namespace AS.Business.Abstractions
{
    public interface IReportBusiness
    {
        List<RP_REPORT> GetListReportNames();

        List<Column> GetListColumnNames(string tableName);

        IList<object> Get(int id);
    }
}
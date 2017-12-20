using System.Collections.Generic;
using AS.Business.Abstractions;
using AS.Models;
using AS.Models.SubModels;
using AS.Repository.Abstractions;

namespace AS.Business.System
{
    public class ReportBusiness : IReportBusiness
    {
        private readonly IReportRepository _repository;
        private readonly IDefinitionBusiness _definition;

        public ReportBusiness(IReportRepository repository, IDefinitionBusiness definition)
        {
            _repository = repository;
            _definition = definition;
        }

        public IList<object> Get(int id)
        {
            var obj = _definition.Get<RP_REPORT>(id);
            if (obj != null)
            {
                string sql = obj.SQLString;
                var lst = _definition.GetAllCustom<object>(sql);
                return lst;
            }
            return null;
        }

        public List<Column> GetListColumnNames(string tableName)
        {
            return _repository.GetListColumnNames(tableName);
        }

        public List<RP_REPORT> GetListReportNames()
        {
            return _repository.GetListReportNames();
        }
    }
}
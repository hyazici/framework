using Dapper.Contrib.Extensions;

namespace AS.Models
{
    [Table("RP_REPORT")]
    public class RP_REPORT : BaseModel
    {
        [Key]
        public int IdReport { get; set; }

        public string ReportName { get; set; }
        public string SourceName { get; set; }
        public bool IsPublic { get; set; }
        public bool IsActive { get; set; }
        public string ColumnLists { get; set; }
        public string GroupByList { get; set; }
        public string OrderByList { get; set; }
        public string SQLString { get; set; }
    }
}
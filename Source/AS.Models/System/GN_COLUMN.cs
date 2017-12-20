using Dapper.Contrib.Extensions;

namespace AS.Models
{
    [Table("GN_COLUMN")]
    public class GN_COLUMN : BaseModel
    {
        [Key]
        public int IdColumn { get; set; }

        public string ColumnName { get; set; }
        public string ColumnNewName { get; set; }
    }

    [Table("GN_COLUMN")]
    public class GN_COLUMN_VM : BaseViewModel
    {
        [Key]
        public int IdColumn { get; set; }

        public string ColumnName { get; set; }
        public string ColumnNewName { get; set; }
    }
}
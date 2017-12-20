using Dapper.Contrib.Extensions;

namespace AS.Models
{
    [Table("GN_TABLE")]
    public class GN_TABLE : BaseModel
    {
        [Key]
        public int IdTable { get; set; }

        public string TableName { get; set; }
        public string TableShortName { get; set; }
        public string TableTRName { get; set; }
    }
}
using Dapper.Contrib.Extensions;

namespace AS.Models
{
    [Table("SC_ACTION")]
    public class SC_ACTION : BaseModel
    {
        [Key]
        public int IdAction { get; set; }

        public string ActionName { get; set; }

        public string FullPath { get; set; }

        public string ActionDesc { get; set; }
    }

    [Table("SC_ACTION")]
    public class SC_ACTION_VM : BaseViewModel
    {
        [Key]
        public int IdAction { get; set; }

        public string ActionName { get; set; }
        public string FullPath { get; set; }
        public string ActionDesc { get; set; }
    }
}
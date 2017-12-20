using Dapper.Contrib.Extensions;

namespace AS.Models
{
    [Table("CR_USER_ACTION")]
    public class CR_USER_ACTION : BaseModel
    {
        [Key]
        public int IdCrUserAction { get; set; }

        public int IdUser { get; set; }
        public int IdAction { get; set; }
    }


    [Table("CR_USER_ACTION")]
    public class CR_USER_ACTION_VM : BaseViewModel
    {
        [Key]
        public int IdCrUserAction { get; set; }

        public int IdUser { get; set; }
        public int IdAction { get; set; }
    }
}
using Dapper.Contrib.Extensions;

namespace AS.Models
{
    [Table("CR_USER_MENU")]
    public class CR_USER_MENU : BaseModel
    {
        [Key]
        public int IdCrUserMenu { get; set; }

        public int IdUser { get; set; }
        public int IdMenu { get; set; }
    }

    [Table("CR_USER_MENU")]
    public class CR_USER_MENU_VM : BaseViewModel
    {
        [Key]
        public int IdCrUserMenu { get; set; }

        public int IdUser { get; set; }
        public int IdMenu { get; set; }
    }
}
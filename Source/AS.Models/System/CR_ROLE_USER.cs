using Dapper.Contrib.Extensions;

namespace AS.Models
{
    [Table("CR_ROLE_USER")]
    public class CR_ROLE_USER : BaseModel
    {
        [Key]
        public int IdCrRoleUser { get; set; }

        public int IdRole { get; set; }
        public int IdUser { get; set; }
    }

    [Table("CR_ROLE_USER")]
    public class CR_ROLE_USER_VM : BaseViewModel
    {
        [Key]
        public int IdCrRoleUser { get; set; }

        public int IdRole { get; set; }
        public int IdUser { get; set; }
    }
}
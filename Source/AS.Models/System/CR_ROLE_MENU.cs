using Dapper.Contrib.Extensions;

namespace AS.Models
{
    [Table("CR_ROLE_MENU")]
    public class CR_ROLE_MENU : BaseModel
    {
        [Key]
        public int IdCrRoleMenu { get; set; }

        public int IdRole { get; set; }
        public int IdMenu { get; set; }
    }
}
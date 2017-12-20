using Dapper.Contrib.Extensions;

namespace AS.Models
{
    [Table("CR_ROLE_ACTION")]
    public class CR_ROLE_ACTION : BaseModel
    {
        [Key]
        public int IdCrRoleAction { get; set; }

        public int IdRole { get; set; }
        public int IdAction { get; set; }
    }
}
using Dapper.Contrib.Extensions;

namespace AS.Models
{
    [Table("SC_ROLE")]
    public class SC_ROLE : BaseModel
    {
        [Key]
        public int IdRole { get; set; }

        public string RoleName { get; set; }
        public string MainPage { get; set; }
    }

    [Table("SC_ROLE")]
    public class SC_ROLE_VM : BaseViewModel
    {
        [Key]
        public int IdRole { get; set; }

        public string RoleName { get; set; }
        public string MainPage { get; set; }
    }
}
using Dapper.Contrib.Extensions;

namespace AS.Models
{
    [Table("SC_MENU")]
    public class SC_MENU : BaseModel
    {
        [Key]
        public int IdMenu { get; set; }

        public int OrderNumber { get; set; }
        public string MenuName { get; set; }
        public string Area { get; set; }
        public string Controller { get; set; }
        public string Action { get; set; }
        public string Parametre { get; set; }
        public string imageClass { get; set; }
        public int ParentId { get; set; }
        public bool isParent { get; set; }
        public bool hasChild { get; set; }
        public bool isActive { get; set; }
    }


    [Table("SC_MENU")]
    public class SC_MENU_VM : BaseViewModel
    {
        [Key]
        public int IdMenu { get; set; }

        public int OrderNumber { get; set; }
        public string MenuName { get; set; }
        public string Area { get; set; }
        public string Controller { get; set; }
        public string Action { get; set; }
        public string Parametre { get; set; }
        public string imageClass { get; set; }
        public int ParentId { get; set; }
        public bool isParent { get; set; }
        public bool hasChild { get; set; }
        public bool isActive { get; set; }
    }
}
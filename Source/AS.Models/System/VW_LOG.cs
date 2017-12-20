using Dapper.Contrib.Extensions;

namespace AS.Models
{
    [Table("VW_LOG")]
    public class VW_LOG : BaseModel
    {
        [Key]
        public int IdLog { get; set; }

        public string ShortMessage { get; set; }
        public string Message { get; set; }
        public string RequestUrl { get; set; }
        public string ControllerName { get; set; }
        public string ActionName { get; set; }
        public int IdLogType { get; set; }
        public string LogType { get; set; }
        public bool IsVisible { get; set; }
    }
}
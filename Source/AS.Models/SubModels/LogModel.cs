
namespace AS.Models.SubModels
{
    public class LogModel 
    {
        public string ShortMessage { get; set; }
        public string Message { get; set; }
        public string RequestUrl { get; set; }
        public string ControllerName { get; set; }
        public string ActionName { get; set; }
        public int IdLogType { get; set; }
        public bool IsVisible { get; set; }
    }
}
namespace AS.Models.SubModels
{
    public class LoginModel
    {
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Captcha { get; set; }
        public bool RememberMe { get; set; }
    }
}
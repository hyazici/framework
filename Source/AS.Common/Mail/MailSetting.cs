namespace AS.Common.Mail
{
    public class MailSetting
    {
        public string From { get; set; }
        public string PassWord { get; set; }
        public string IsBodyHtml { get; set; }
        public string Port { get; set; }
        public string Host { get; set; }
        public string EnableSsl { get; set; }
        public string To { get; set; }
        public string FromFullName { get; set; }
    }
}
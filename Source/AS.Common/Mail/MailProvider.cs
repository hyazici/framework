using System;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using AS.Common.Abstractions;

namespace AS.Common.Mail
{
    public class MailProvider : IMailProvider
    {
        private readonly IConfigurationManager _config;
        private MailSetting setting = null;
        private string mailTemplate = string.Empty;
        private string MailTemplatePathOrj = string.Empty;

        public MailProvider(IConfigurationManager config)
        {
            _config = config;
            GetMailTemplate();
        }

        private MailSetting GetSetting()
        {
            if (setting == null)
            {
                setting = new MailSetting();
                setting.FromFullName = _config.Load(Strings.MailKeys.FromFullName);
                setting.From = _config.Load(Strings.MailKeys.From);
                setting.EnableSsl = _config.Load(Strings.MailKeys.EnableSsl);
                setting.Host = _config.Load(Strings.MailKeys.Host);
                setting.IsBodyHtml = _config.Load(Strings.MailKeys.IsBodyHtml);
                setting.PassWord = _config.Load(Strings.MailKeys.PassWord);
                setting.Port = _config.Load(Strings.MailKeys.Port);
            }
            return setting;
        }

        public void Send(string subject, string to, string body)
        {
            MailSetting setting = GetSetting();

            MailMessage Mail = new MailMessage();
            Mail.From = new MailAddress(setting.From, setting.FromFullName);
            Mail.To.Add(to);

            Mail.Subject = subject;
            Mail.IsBodyHtml = Convert.ToBoolean(setting.IsBodyHtml);
            Mail.Body = mailTemplate.Replace("#BODY#", body);

            SmtpClient smpt = new SmtpClient();
            smpt.Port = Convert.ToInt32(setting.Port);
            smpt.Host = setting.Host;
            smpt.EnableSsl = Convert.ToBoolean(setting.EnableSsl);
            smpt.DeliveryMethod = SmtpDeliveryMethod.Network;
            smpt.UseDefaultCredentials = false;
            smpt.Credentials = new NetworkCredential(setting.From, setting.PassWord);

            ServicePointManager.ServerCertificateValidationCallback = delegate (object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };

            smpt.Send(Mail);
        }

        private void GetMailTemplate()
        {
            if (string.IsNullOrEmpty(mailTemplate))
            {
                string mailTemplatePath = _config.Load(Strings.Configuration.Mail.MailTemplatePath);

                if (MailTemplatePathOrj != mailTemplatePath)
                {
                    MailTemplatePathOrj = mailTemplatePath;
                    if (File.Exists(mailTemplatePath))
                    {
                        using (StreamReader reader = new StreamReader(mailTemplatePath))
                        {
                            mailTemplate = reader.ReadToEnd();
                            mailTemplate = mailTemplate.Replace("#IMAGE#", _config.Load(Strings.Configuration.Mail.Images));
                        }
                    }
                }
            }
        }
    }
}
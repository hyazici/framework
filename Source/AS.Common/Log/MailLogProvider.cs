using System;
using System.Net;
using System.Net.Mail;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using AS.Common.Abstractions;
using AS.Models.Enum;
using AS.Models.SubModels;

namespace AS.Common.Log.Providers
{
    public class MailLogProvider : IMailLogProvider
    {
        private readonly IConfigurationManager _configurationManager;

        public MailLogProvider(IConfigurationManager configuration)
        {
            _configurationManager = configuration;
        }

        public void Flush(LogModel logModel)
        {
            if (logModel.IdLogType != (int)LogType.Error && logModel.IdLogType != (int)LogType.Fatal)
            {
                return;
            }

            string from = _configurationManager.Load(Strings.Configuration.Mail.From);
            string to = _configurationManager.Load(Strings.Configuration.Mail.To);
            string password = _configurationManager.Load(Strings.Configuration.Mail.Password);
            string port = _configurationManager.Load(Strings.Configuration.Mail.Port);
            string host = _configurationManager.Load(Strings.Configuration.Mail.Host);
            string enableSSL = _configurationManager.Load(Strings.Configuration.Mail.EnableSSL);
            if (enableSSL != "True" && enableSSL != "False")
            {
                enableSSL = "False";
            }

            try
            {
                string body = "<p style='padding:10px;margin:10px;text-align:left; width:90%;'>";
                /* */
                body += "<b>Firma Adı :</b> " + _configurationManager.Load("company") + "<br />";
                body += "<b>Açıklama :</b> " + logModel.ShortMessage + "<br />";
                body += "<b>Detay :</b> " + logModel.Message + "<br />";
                body += "<b>Action :</b> " + logModel.ActionName + "<br />";
                body += "<b>Controller :</b> " + logModel.ControllerName + "<br />";
                body += "<b>Adres :</b> " + logModel.RequestUrl + "<br />";
                body += "<b>İşlem Tarihi :</b> " + DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString() + "<br />";
                body += "<br />";
                body += "<br />";
                body += "<b>Ip Adresi :</b> " + HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"] + "<br />";
                body += "<b>PC Adı :</b> " + Dns.GetHostName() + "<br />";
                body += "</p>";

                string body2 = @"<html>
                                <head>
                                <title></title>
                                <meta http-equiv='Content-Type'content='text/html; charset=utf-8'/>
                                <style type='text/css'>body{background-color:#e6e5c6;text-align:center;font-family:Century Gothic, Arial, Tahoma; font-size:10px;} p{font-family:Century Gothic, Arial, Tahoma; font-size:12px;} td img {display: block;} td{background-color:#F8F9E2;}</style>
                                </head>
                                <body>
                                <table style='display: inline-table;' border='0' cellpadding='0' cellspacing='0' width='800' >
                                  <tr>
                                   <td colspan='2'><a href='" + _configurationManager.Load("mailLink") + @"'target='_blank'><img name='logo'src='" + _configurationManager.Load("images") + @"budget-logo.jpg'width='800'height='113'id='logo'alt=''/></a></td>
                                  </tr>
                                  <tr>
                                   <td colspan='2'><a href='" + _configurationManager.Load("mailLink") + @"'target='_blank'><img name='baslik'src='" + _configurationManager.Load("images") + @"budget-baslik.jpg'width='800'height='57'id='baslik'alt=''/></a></td>
                                  </tr>
                                  <tr>
                                   <td valign='top'bgcolor='#F8F9E2'>" + body + @"</td>
                                   <td valign='top'bgcolor='#F8F9E2'width='267'style='text-align:right; background-color:#F8F9E2;'><img name='budget'src='" + _configurationManager.Load("images") + @"budget-img.jpg'width='267'height='391'id='budget'alt=''/></td>
                                  </tr>
                                  <tr>
                                   <td colspan='2'bgcolor='#F8F9E2' style='text-align:center; background-color:#353A33;padding:5px;color:white;font-size:12px' >Copyright © " + DateTime.Now.Year.ToString() + " " + _configurationManager.Load("company") + @" Tüm hakları saklıdır.</td>
                                  </tr>
                                </table>
                                </body>
                                </html>";

                MailMessage Mail = new MailMessage();
                Mail.From = new MailAddress(from, Strings.Configuration.General.AppName);

                var lstMail = to.Split(';');

                for (int i = 0; i < lstMail.Length; i++)
                {
                    Mail.To.Add(lstMail[i]);
                }

                Mail.Subject = Strings.Configuration.General.AppName + " Log Kaydı";
                Mail.IsBodyHtml = true;
                Mail.Body = body2;
                SmtpClient smpt = new SmtpClient();
                smpt.Port = Convert.ToInt32(port);
                smpt.Host = host;
                smpt.EnableSsl = Convert.ToBoolean(enableSSL);
                smpt.DeliveryMethod = SmtpDeliveryMethod.Network;
                smpt.UseDefaultCredentials = false;
                smpt.Credentials = new NetworkCredential(from, password);

                ServicePointManager.ServerCertificateValidationCallback = delegate (object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };

                smpt.Send(Mail);
            }
            catch (Exception)
            {
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AS.Business.Abstractions;
using AS.Common;
using AS.Common.Abstractions;
using AS.Common.Exceptions;
using AS.Models;
using AS.Models.SubModels;
using AS.Repository.Abstractions;

namespace AS.Business.System
{
    public class LoginBusiness : ILoginBusiness
    {
        private readonly ILoginRepository _repository;
        private readonly IGeneralBusiness _general;
        private readonly ISessionProvider _sessionProvider;
        private readonly ICookieProvider _cookieProvider;
        private readonly IEncrypter _encrypter;
        private readonly ILogger _logger;
        private readonly IMailProvider _mail;
        private readonly ISessionProvider _session;

        public LoginBusiness(ILoginRepository repository, ISessionProvider sessionProvider, IEncrypter encrypter, ICookieProvider cookieProvider, ILogger logger, IGeneralBusiness general, IMailProvider mail, ISessionProvider session)
        {
            _repository = repository;
            _sessionProvider = sessionProvider;
            _encrypter = encrypter;
            _cookieProvider = cookieProvider;
            _logger = logger;
            _general = general;
            _mail = mail;
            _session = session;
        }

        public bool LoginByUsernameAndPassword(string username, string password)
        {
            var encryptedPassword = _encrypter.Encrypt(password);
            var lstUser = _general.GetAll<SC_USER>();
            var userModel = lstUser.Where(r => r.UserName == username && r.Password == encryptedPassword && r.Active && r.Deleted == false && r.FailedLoginCount < 4).FirstOrDefault();

            if (userModel != null)
            {
                _sessionProvider.Set(Strings.Authorization.UserSessionKey, userModel);

                _sessionProvider.Set(Strings.Authorization.IsLoginSessionKey, false);

                userModel.FailedLoginCount = 0;
                _repository.Update(userModel);
                //_repository.SetContext(userModel.IdUser);
                _logger.LogInformation(new LogModel
                {
                    ActionName = "Login",
                    ControllerName = "LoginController",
                    RequestUrl = "/Login",
                    ShortMessage = Strings.Messages.LoginPage.Login(userModel)
                });
            }
            else
            {
                var user2 = lstUser.Where(r => r.UserName == username && r.Deleted == false).FirstOrDefault();

                if (user2 != null)
                {
                    _logger.LogInformation(new LogModel
                    {
                        ActionName = "Login",
                        ControllerName = "LoginController",
                        RequestUrl = "/Login",
                        ShortMessage = Strings.Messages.LoginPage.FailedLogin(user2)
                    });

                    if (user2.FailedLoginCount < 4)
                    {
                        user2.FailedLoginCount++;
                        _repository.Update(user2);
                        return false;
                    }
                    else
                    {
                        user2.Active = false;
                        _repository.Update(user2);
                        return false;
                    }
                }
                else
                {
                    return false;
                }
            }

            _cookieProvider.SetCookie(Strings.CookieKeys.UserName, userModel.UserName, TimeSpan.FromDays(1));
            _cookieProvider.SetCookie(Strings.CookieKeys.IdUser, userModel.IdUser.ToString(), TimeSpan.FromDays(1));

            return true;
        }

        public bool GetUserByMailList(IEnumerable<string> lstMail)
        {
            return _repository.GetUserByMailList(lstMail);
        }

        public void SendRememberMail(string email)
        {
            DateTime duaDate = DateTime.Now.AddMinutes(15);
            // email;gecerliSonTarih
            string link = email + ";" + duaDate.ToString();
            string encryptedString = "/Login/Remember/" + _encrypter.UrlEncode(link);

            // Mail İçeriği
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("<p>");
            sb.AppendLine("Aşağıdaki bağlantıdan şifrenizi değiştirebilirsiniz. <br><br> ");
            sb.AppendFormat("<a href='{0}'", encryptedString);
            sb.Append("' target='_blank'>Şifre Değiştir</a>");
            sb.AppendLine("</p>");

            _mail.Send("Şifre Hatırlatma", email, sb.ToString());
        }

        public void SendLog(string body)
        {
            if (string.IsNullOrEmpty(body))
            {
                return;
            }

            var user = _session.Get<SC_USER>(Strings.Authorization.UserSessionKey);
            if (user == null)
            {
                return;
            }

            StringBuilder sb = new StringBuilder();
            sb.AppendLine("<p>");
            sb.AppendLine("ABYS de bir hata oluştu. Detayı : <br> <br> ");
            sb.AppendLine("<pre>" + body);
            sb.AppendLine("</pre>");
            sb.AppendLine("</p>");
            _mail.Send("ABYS Log Kaydı", "soner.acar@vbt.com.tr", body);
        }

        public SC_USER SendUserSession(SC_USER user)
        {
            SC_USER kullanici = new SC_USER();
            var encryptedPassword = _encrypter.Encrypt(user.Password);
            var lstUser = _general.GetAll<SC_USER>();
            var userModel = lstUser.Where(r => r.UserName == user.UserName && r.Password == encryptedPassword && r.Active && r.Deleted == false && r.FailedLoginCount < 5).FirstOrDefault();

            if (userModel != null)
            {
                userModel.FailedLoginCount = 0;
                _general.Update(userModel);

                _logger.LogSuccess(new LogModel
                {
                    ActionName = "Login",
                    ControllerName = "LoginController",
                    RequestUrl = "/Login",
                    ShortMessage = Strings.Messages.LoginPage.Login(userModel)
                });
            }
            else
            {
                var user2 = lstUser.Where(r => r.UserName == user.UserName && r.Deleted == false).FirstOrDefault();

                if (user2 != null)
                {
                    _logger.LogInformation(new LogModel
                    {
                        ActionName = "Login",
                        ControllerName = "LoginController",
                        RequestUrl = "/Login",
                        ShortMessage = Strings.Messages.LoginPage.FailedLogin(user2)
                    });

                    if (user2.FailedLoginCount < 5)
                    {
                        user2.FailedLoginCount++;
                        _general.Update(user2);
                        throw new NotificationException("Yazdığınız şifre hatalı. " + user2.FailedLoginCount + " kez hatalı girdiniz.");
                    }
                    else
                    {
                        user2.Active = false;
                        _general.Update(user2);
                        throw new NotificationException("Hesabınız bloke olmuştur. Lütfen sistem yöneticiyle iletişime geçiniz.");
                    }

                }
                else
                {
                    throw new NotificationException("Kullanıcı bulunamadı.");
                }
            }

            _sessionProvider
                .Set(Strings.Authorization.UserSessionKey, userModel);

            _sessionProvider
              .Set(Strings.Authorization.IsLoginSessionKey, false);

            _cookieProvider.SetCookie(Strings.CookieKeys.UserName, userModel.UserName, TimeSpan.FromDays(1));
            _cookieProvider.SetCookie(Strings.CookieKeys.IdUser, userModel.IdUser.ToString(), TimeSpan.FromDays(1));

            kullanici = userModel;
            kullanici.Password = "";
            return kullanici;
        }
    }
}
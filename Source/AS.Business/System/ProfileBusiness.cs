using System.Web;
using AS.Models;
using AS.Business.Abstractions;
using AS.Repository.Abstractions;
using AS.Common.Abstractions;
using AS.Common;
using AS.Utilities;

namespace AS.Business
{
    public class ProfileBusiness : IProfileBusiness
    {
        private readonly IGeneralRepository _general;
        private readonly ISessionProvider _session;
        private readonly IEncrypter _encrypter;
        private readonly IConfigurationManager _config;

        public ProfileBusiness(IGeneralRepository general, ISessionProvider session, IEncrypter encrypter, IConfigurationManager config)
        {
            _general = general;
            _session = session;
            _encrypter = encrypter;
            _config = config;
        }

        public SC_USER Save(SC_USER obj)
        {
            var currentUser = _general.Get<SC_USER>(obj.IdUser);
            currentUser.Soyadi = obj.Soyadi;
            currentUser.Adi = obj.Adi;
            currentUser.CepTelefonu = obj.CepTelefonu;
            currentUser.Aciklama = obj.Aciklama;
            currentUser.ModUser = currentUser.IdUser;
            currentUser = _general.Update(currentUser);

            _session.Set(Strings.Authorization.UserSessionKey, currentUser);

            return currentUser;



            //if (obj.IdUser > 0)
            //{
            //    obj = _general.Update(obj);
            //    _logger.LogSuccess(new Log()
            //    {
            //        ActionName = "Save",
            //        ControllerName = "ProfileController",
            //        RequestUrl = "/Profile",
            //        ShortMessage = Strings.Messages.User.Update(obj)
            //    });
            //    _sessionProvider.Set(Strings.Authorization.UserSessionKey, obj);
            //    return Json(obj);
            //}
            //else
            //{
            //    return Json(false);
            //}
        }

        public SC_USER SaveFotograf(string foto)
        {
            var user = _session.Get<SC_USER>(Strings.Authorization.UserSessionKey);
            var currentUser = _general.Get<SC_USER>(user.IdUser);
            string appPath = _config.Load(Strings.Configuration.General.AppPath);
            currentUser.Fotograf = FileHelper.UploadProfile(appPath, currentUser.UserName, foto);
            currentUser = _general.Update(currentUser);
            _session.Set(Strings.Authorization.UserSessionKey, currentUser);
            return currentUser;
        }

        public SC_USER SavePassword(SC_USER obj)
        {
            var currentUser = _general.Get<SC_USER>(obj.IdUser);
            currentUser.Password = _encrypter.Encrypt(obj.Password);
            currentUser = _general.Update(currentUser);
            _session.Set(Strings.Authorization.UserSessionKey, currentUser);
            return currentUser;
        }

        public void Upload(HttpRequestBase request, string appPath)
        {
            var user = _session.Get<SC_USER>(Strings.Authorization.UserSessionKey);
            foreach (string fileName in request.Files)
            {
                HttpPostedFileBase file = request.Files[fileName];

                if (file != null && file.ContentLength > 0)
                {
                    string dosyaYolu = FileHelper.UploadProfile(appPath, user.UserName, file);

                    var currentUser = _general.Get<SC_USER>(user.IdUser);
                    currentUser.Fotograf = dosyaYolu;
                    currentUser = _general.Update(currentUser);
                    _session.Set(Strings.Authorization.UserSessionKey, currentUser);
                }
            }
        }
    }
}
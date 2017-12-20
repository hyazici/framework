using Dapper;
using Dapper.Contrib.Extensions;
using System;
using System.Collections.Generic;
using System.Data;
using AS.Common;
using AS.Repository.Abstractions;
using AS.Models;

namespace AS.Repository.System
{
    public class LoginRepository : ILoginRepository
    {
        public IDbConnection _connection
        {
            get
            {
                return Bootstrapper.Data.Connection;
            }
        }

        public bool GetUserByMailList(IEnumerable<string> lstMail)
        {
            throw new NotImplementedException();
        }

        public SC_USER Update(SC_USER obj, IDbTransaction trans = null)
        {
            _connection.Update(obj, trans);
            return obj;
        }

        public void SetContext(int idUser, IDbTransaction trans = null)
        {
            _connection.Query("sp_SetContext",
                new { prmIdUser = idUser }, trans,
                commandType: CommandType.StoredProcedure);
        }

        //public LoginRepository(ILogger logger, ISessionProvider sessionProvider, IEncrypter encrypter)
        //{
        //    _logger = logger;
        //    _sessionProvider = sessionProvider;
        //    _encrypter = encrypter;
        //}
        //public bool GetUserByMailList(IEnumerable<string> lstMail)
        //{
        //    bool result = false;
        //    SC_USER user = Bootstrapper
        //       .Data
        //       .Connection
        //       .GetAll<SC_USER>()
        //       .FirstOrDefault(r => lstMail.Contains(r.Email) && r.Active && r.Deleted == false);

        //    if (user != null)
        //    {
        //        result = true;

        //        _sessionProvider
        //            .Set(Strings.Authorization.UserSessionKey, user);

        //        _sessionProvider
        //          .Set(Strings.Authorization.IsLoginSessionKey, false);

        //        _logger.LogSuccess(new ABYS.Models.SubModels.Log()
        //        {
        //            ActionName = "Login",
        //            ControllerName = "LoginController",
        //            RequestUrl = "/Login",
        //            ShortMessage = Strings.Messages.LoginPage.Login(user)
        //        });
        //    }

        //    return result;
        //}
    }
}
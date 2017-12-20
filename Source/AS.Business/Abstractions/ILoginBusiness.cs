using System.Collections.Generic;
using AS.Models;

namespace AS.Business.Abstractions
{
    public interface ILoginBusiness
    {
        bool LoginByUsernameAndPassword(string username, string password);

        bool GetUserByMailList(IEnumerable<string> lstMail);

        SC_USER SendUserSession(SC_USER user);

        void SendRememberMail(string email);

        void SendLog(string body);
    }
}
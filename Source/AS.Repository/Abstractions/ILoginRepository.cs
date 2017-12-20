using System.Collections.Generic;
using System.Data;
using AS.Models;

namespace AS.Repository.Abstractions
{
    public interface ILoginRepository
    {
        bool GetUserByMailList(IEnumerable<string> lstMail);

        SC_USER Update(SC_USER obj, IDbTransaction trans = null);

        void SetContext(int idUser, IDbTransaction trans = null);
    }
}
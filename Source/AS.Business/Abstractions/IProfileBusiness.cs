using AS.Models;
using System.Web;

namespace AS.Business.Abstractions
{
    public interface IProfileBusiness
    {
        SC_USER Save(SC_USER obj);

        SC_USER SavePassword(SC_USER obj);

        SC_USER SaveFotograf(string foto);

        void Upload(HttpRequestBase request, string appPath);
    }
}
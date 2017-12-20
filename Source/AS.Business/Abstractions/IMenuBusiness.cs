using System.Collections.Generic;
using AS.Models;

namespace AS.Business.Abstractions
{
    public interface IMenuBusiness
    {
        SC_MENU Get(int id);

        IEnumerable<SC_MENU> GetAll();

        IEnumerable<SC_MENU> GetAll(int idUser);
    }
}
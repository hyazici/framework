using System.Collections.Generic;
using AS.Models;

namespace AS.Repository.Abstractions
{
    public interface IMenuRepository
    {
        SC_MENU Get(int id);

        IList<SC_MENU> GetAll();

        IList<SC_MENU> GetAll(int idUser);
    }
}
using System.Collections.Generic;
using AS.Models;

namespace AS.Business.Abstractions
{
    public interface IActionBusiness
    {
        IList<SC_ACTION> GetAll(int idUser);
    }
}
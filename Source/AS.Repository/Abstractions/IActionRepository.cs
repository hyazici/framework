using System.Collections.Generic;
using AS.Models;

namespace AS.Repository.Abstractions
{
    public interface IActionRepository
    {
        IList<SC_ACTION> GetAll(int idUser);
    }
}
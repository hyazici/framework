using AS.Business.Abstractions;
using AS.Common.Abstractions;
using AS.Models;
using AS.Repository.Abstractions;
using System.Collections.Generic;

namespace AS.Business
{
    public class ActionBusiness : IActionBusiness
    {
        private readonly IActionRepository _repository;

        public ActionBusiness(IActionRepository repository, ICacheProvider cache)
        {
            _repository = repository;
        }

        public IList<SC_ACTION> GetAll(int idUser)
        {
            return _repository.GetAll(idUser);
        }
    }
}
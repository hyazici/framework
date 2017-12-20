using System.Collections.Generic;
using System.Linq;
using AS.Business.Abstractions;
using AS.Common;
using AS.Common.Abstractions;
using AS.Models;
using AS.Repository.Abstractions;

namespace AS.Business
{
    public class MenuBusiness : IMenuBusiness
    {
        private readonly IMenuRepository _repository;
        private readonly ISessionProvider _session;
        private readonly ICacheProvider _cache;

        public MenuBusiness(IMenuRepository repository, ISessionProvider session, ICacheProvider cache)
        {
            _repository = repository;
            _session = session;
            _cache = cache;
        }

        // Get
        public SC_MENU Get(int id)
        {
            return _repository.Get(id);
        }

        // GetAll
        public IEnumerable<SC_MENU> GetAll()
        {
            return _repository.GetAll();
        }

        // GetAll with IdUser
        public IEnumerable<SC_MENU> GetAll(int idUser)
        {
            // Cache olayı
            IEnumerable<SC_MENU> _menu = null;

            // Cache Key tanımlanır. Her kullanıcı ve firma için farklı olması gerekiyor.
            string cacheMenuKey = "SC_MENU_Comp" + "_User" + idUser.ToString();

            // Kullanıcı ilk giriş yaptığını kontrol ediyoruz.
            if (_session.Get(Strings.Authorization.IsLoginSessionKey))
            {
                _menu = _cache.Get<IEnumerable<SC_MENU>>(cacheMenuKey);
            }

            if (_menu != null)
            {
                if (_menu.ToList().Count > 0)
                {
                    return _menu.ToList();
                }
            }

            // Menü objesi veritabanından sorgulanıyor ve getiriliyor.
            _menu = _repository.GetAll(idUser);
            // Menü obkesi cache atanıyor.
            _cache.Set(cacheMenuKey, _menu);

            // IsLoginSessionKey değeri true yapıyoruz. Cacheden okuyabilmek için.
            _session.Set(Strings.Authorization.IsLoginSessionKey, true);
            return _menu;
        }
    }
}
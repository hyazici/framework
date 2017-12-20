using Dapper.Contrib.Extensions;
using System;
using System.Web;
using AS.Utilities;

namespace AS.Models
{
    public class BaseModel : BaseViewModel
    {
        public int CreUser { get; set; }
        public int ModUser { get; set; }

        private string _client;

        public string Client
        {
            get
            {
                if (HttpContext.Current != null)
                {
                    _client = HttpContext.Current.GetCurrentClientName();
                    return _client;
                }
                return _client;
            }
            set { _client = value; }
        }

        private string _clientIp;

        public string ClientIp
        {
            get
            {
                if (HttpContext.Current != null)
                {
                    _clientIp = HttpContext.Current.GetCurrentIP();
                    return _clientIp;
                }
                return _clientIp;
            }
            set { _clientIp = value; }
        }

        private DateTime _credate;

        [Write(false)]
        public DateTime CreDate
        {
            get
            {
                if (_credate.Year < 1911)
                {
                    _credate = DateTime.Now;
                    return _credate;
                }
                return _credate;
            }
            set { _credate = value; }
        }

        private DateTime _modDate;

        public DateTime ModDate
        {
            get
            {
                if (_modDate.Year < 1911)
                {
                    _modDate = DateTime.Now;
                    return _modDate;
                }
                return _modDate;
            }
            set { _modDate = value; }
        }
    }
}
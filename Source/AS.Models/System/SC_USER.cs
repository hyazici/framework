using Dapper.Contrib.Extensions;
using System;

namespace AS.Models
{
    [Table("SC_USER")]
    public class SC_USER : BaseModel
    {
        [Key]
        public int IdUser { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string RealName { get; set; }
        public int FailedLoginCount { get; set; }
        public string Email { get; set; }
        public bool Active { get; set; }
        public string Fotograf { get; set; }
        public string Adi { get; set; }
        public string Soyadi { get; set; }
        public string CepTelefonu { get; set; }
        public string Aciklama { get; set; }
    }

    [Table("SC_USER")]
    public class SC_USER_VM : BaseViewModel
    {
        [Key]
        public int IdUser { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string RealName { get; set; }
        public int FailedLoginCount { get; set; }
        public string Email { get; set; }
        public bool Active { get; set; }
        public string Fotograf { get; set; }
        public string Adi { get; set; }
        public string Soyadi { get; set; }
        public string CepTelefonu { get; set; }
        public string Aciklama { get; set; }
    }
}
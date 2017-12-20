using Dapper.Contrib.Extensions;
using System;

namespace AS.Models
{
    [Table("GN_CALISMA_TAKVIMI")]
    public class GN_CALISMA_TAKVIMI : BaseModel
    {
        [Key]
        public int IdCalismaTakvimi { get; set; }

        public DateTime TatilGunu { get; set; }
        public int IdTatilTipi { get; set; }
        public string Color { get; set; }
    }

    [Table("GN_CALISMA_TAKVIMI")]
    public class GN_CALISMA_TAKVIMI_VM
    {
        [Key]
        public int IdCalismaTakvimi { get; set; }

        public DateTime TatilGunu { get; set; }
        public int IdTatilTipi { get; set; }
        public string Color { get; set; }
    }
}
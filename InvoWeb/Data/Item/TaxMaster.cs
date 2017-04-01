using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Data.Item
{
    public class TaxMaster
    {
        public int TaxId { get; set; }
        public string TaxName { get; set; }
        public string TaxDesc { get; set; }
        public double TaxRate { get; set; }
        public int TaxStatus { get; set; }
        public int CompanyId { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }

    }

}
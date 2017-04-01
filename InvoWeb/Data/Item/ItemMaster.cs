using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Data.Item
{
    public class ItemMaster
    {
        public int ItemId { get; set; }
        public string ItemName { get; set; }
        public string ItemDesc { get; set; }
        public double UnitPrice { get; set; }
        public double ProfitMargin { get; set; }
        public double FinalPrice { get; set; }
        public int IsTaxable { get; set; }
        public int CompanyId { get; set; }
        public int ItemStatus { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
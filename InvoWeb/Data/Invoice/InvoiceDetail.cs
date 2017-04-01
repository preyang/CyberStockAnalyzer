using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Data.Invoice
{
    public class InvoiceDetail
    {
        public int InvoiceDetailId { get; set; }
        public int InvoiceId { get; set; }
        public string  ItemName { get; set; }
        public string  ItemDesc { get; set; }
        public double  UnitRate { get; set; }
        public int  Quantity { get; set; }
        public int  IsTaxable { get; set; }
        public double Amount { get; set; }
    }
}
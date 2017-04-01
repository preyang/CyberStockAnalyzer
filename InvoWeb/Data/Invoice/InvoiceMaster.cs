using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Data.Invoice
{
    public class InvoiceMaster
    {
        public int InvoiceId { get; set; }
        public string InvoiceNo { get; set; }
        public int CompanyId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string CustomerName { get; set; }
        public string Address { get; set; }
        public double PhoneNo { get; set; }
        public string EmailId { get; set; }
        public double SubTotalAmount { get; set; }
        public string TaxName1 { get; set; }
        public double TaxRate1 { get; set; }
        public string TaxName2 { get; set; }
        public double TaxRate2 { get; set; }
        public double DiscountRate { get; set; }
        public double AdditionCharge { get; set; }
        public double NetAmount { get; set; }
        public string Comment { get; set; }
        public string SalePersonName { get; set; }
        public int  PaymentStatus { get; set; }
        public DateTime LastUpdateDate { get; set; }
        
    }
}
  
      
     
      
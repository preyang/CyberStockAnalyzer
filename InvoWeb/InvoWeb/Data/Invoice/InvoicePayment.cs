using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Data.Invoice
{
    public class InvoicePayment
    {
        public int InvoicePaymentId { get; set; }
        public int InvoiceId { get; set; }
        public double PaidAmount { get; set; }
        public DateTime PaymentDate { get; set; }
        public string  PaymentMethod { get; set; }
        public string  CardNo { get; set; }
        public string Comment { get; set; }
    }
}
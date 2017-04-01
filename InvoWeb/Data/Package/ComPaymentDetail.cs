using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Data.Package
{
    public class ComPaymentDetail
    {
        public int CompPaymentId { get; set; }
        public int CompanyId { get; set; }
        public int PackageId { get; set; }
        public string PaymentMethod { get; set; }
        public double Amount { get; set; }
        public double CardNo { get; set; }
        public string CardName { get; set; }
        public double CVNo { get; set; }
        public DateTime ExpiryDate { get; set; }
        public DateTime PaymentDate { get; set; }
    }
}
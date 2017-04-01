using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Data.Package
{
    public class CompPackageDetail
    {
        public int CompPackId { get; set; }
        public int CompanyId { get; set; }
        public int PackageId { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public DateTime CreatedDate { get; set; }
        public int CompPaymentId { get; set; }
    }
}
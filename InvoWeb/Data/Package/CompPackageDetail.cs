using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Data.Package
{
    public class CompPackageDetail
    {
        public int PackageId { get; set; }
        public int CompanyId { get; set; }
        public int PackageDetailId { get; set; }
        public int NoOfProduct { get; set; }
        public int NoOfInvoice { get; set; }
    }
}
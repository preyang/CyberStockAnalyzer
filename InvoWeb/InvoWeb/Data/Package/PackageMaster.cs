using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Data.Package
{
    public class PackageMaster
    {
        public int PackageId { get; set; }
        public string PackageName { get; set; }
        public string PackageDesc { get; set; }
        public int PackageDuration { get; set; }
        public int NoOfInvoice { get; set; }
        public int NoOfItem { get; set; }
        public double Price { get; set; }
        public string Term { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
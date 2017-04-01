using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Data.User
{
    public class CompanyMaster
    {
        public int CompanyId { get; set; }
        public string CompanyName { get; set; }
        public string InvoiceNoPrefix { get; set; }
        public string CompAddress { get; set; }
        public string CompanyLogo { get; set; }
        public string ContactPersonName { get; set; }
        public double ContactNo { get; set; }
        public string ContactEmail { get; set; }
        public string WebSite { get; set; }
        public int CompanyStatus { get; set; }
        public int UserId { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
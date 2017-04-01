using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Data.User
{
    public class UserMaster
    {
        public int UserId { get; set; }
        public string UserName { get; set; }
        public string EmailId { get; set; }
        public string Password { get; set; }
        public string ConfirmPassword { get; set; }
        public string Question { get; set; }
        public string Answer { get; set; }
        public int UserTypeId { get; set; }
        public int UserStatus { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }
        public DateTime LastLoginDate { get; set; }
    }
}
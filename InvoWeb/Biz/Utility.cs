using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace Biz.Utility
{
    public class Utility
    {
        public bool Param(string UserEmail)
        {
            SelectSP.SelectSP _obj = new SelectSP.SelectSP ();
            IDataReader dr = _obj.checkEmail(UserEmail);
          
            bool Op = true;
            while (dr.Read())
            {
                if (dr["UserId"] != DBNull.Value)
                {
                    Op = false;
                }
            }

            dr.Close();

            return Op;
        }

        public bool ParamNo(string InvoiceNo)
        {
            SelectSP.SelectSP _obj = new SelectSP.SelectSP();
            IDataReader dr = _obj.checkInvoiceNo(InvoiceNo);

            bool Op = true;
            while (dr.Read())
            {
                if (dr["InvoiceId"] != DBNull.Value)
                {
                    Op = false;
                }
            }

            dr.Close();

            return Op;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.User;
using Data.Item;
using Data.Connection;
using Data.Package;
using System.Data.SqlClient;

namespace Biz.ActionStoredProcedure
{
    public class ActionStoredProcedure
    {
        DataAccess _da = new DataAccess();

        #region Add_UserMaster..

        public int Add_UserMaster(UserMaster _user)
        {
            SqlParameter[] param = { new SqlParameter("@UserName", _user.UserName),
                                     new SqlParameter("@EmailId", _user.EmailId),
                                     new SqlParameter("@Password", _user.Password),
                                     new SqlParameter("@Question", _user.Question),
                                     new SqlParameter("@Answer", _user.Answer),
                                     new SqlParameter("@UserTypeId", _user.UserTypeId),
                                     new SqlParameter("@UserStatus", _user.UserStatus),
                                     new SqlParameter("@CreatedDate", _user.CreatedDate),
                                     new SqlParameter("@modifiedDate", _user.ModifiedDate),
                                     new SqlParameter("@LastLoginDate", _user.LastLoginDate)
                                   };

            return _da.Execute("Insert_UserMaster", param);
        }
       #endregion

        #region Add_UserTypeMaster..

        public int Add_UserTypeMaster(UserTypeMaster _user)
        {
            SqlParameter[] param = { new SqlParameter("@UserType", _user.UserType) 
                                   };
            return _da.Execute("Insert_UserTypeMaster", param);
        }
        #endregion

        #region Add_CompanyMaster..

        public int Add_CompanyMaster(CompanyMaster _user)
        {
            SqlParameter[] param = { new SqlParameter("@CompanyName", _user.CompanyName),
                                     new SqlParameter("@InvoiceNoPrefix", _user.InvoiceNoPrefix),
                                     new SqlParameter("@CompAddress", _user.CompAddress),
                                     new SqlParameter("@CompanyLogo", _user.CompanyLogo),
                                     new SqlParameter("@ContactPersonName", _user.ContactPersonName),
                                     new SqlParameter("@ContactNo", _user.ContactNo),
                                     new SqlParameter("@ContactEmail", _user.ContactEmail),
                                     new SqlParameter("@WebSite", _user.WebSite),
                                     new SqlParameter("@CompanyStatus", _user.CompanyStatus),
                                     new SqlParameter("@UserId", _user.UserId),
                                     new SqlParameter("@CreatedDate", _user.CreatedDate),
                                     new SqlParameter("@modifiedDate", _user.ModifiedDate) 
                                   };
            return _da.Execute("Insert_CompanyMaster", param);
        }
        #endregion

        #region Add_TaxMaster..

        public int Add_TaxMaster(TaxMaster _user)
        {
            SqlParameter[] param = { new SqlParameter("@taxname", _user.TaxName),
                                     new SqlParameter("@taxdesc", _user.TaxDesc),
                                     new SqlParameter("@taxrate", _user. TaxRate),
                                     new SqlParameter("@taxstatus", _user.TaxStatus),
                                     new SqlParameter("@companyid", _user.CompanyId),
                                     new SqlParameter("@createddate", _user.CreatedDate),
                                     new SqlParameter("@modifieddate", _user.ModifiedDate) 
                                   };
            return _da.Execute("Insert_TaxMaster", param);
        }
        #endregion

        #region Add_ItemMaster..

        public int Add_ItemMaster(ItemMaster _user)
        {
            SqlParameter[] param = { new SqlParameter("@ItemName", _user.ItemName),
                                     new SqlParameter("@ItemDesc", _user.ItemDesc),
                                     new SqlParameter("@UnitPrice", _user.UnitPrice),
                                     new SqlParameter("@ProfitMargin", _user.ProfitMargin),
                                     new SqlParameter("@FinalPrice", _user.FinalPrice),
                                     new SqlParameter("@IsTaxable", _user.IsTaxable),
                                     new SqlParameter("@CompanyId", _user.CompanyId),
                                     new SqlParameter("@ItemStatus", _user.ItemStatus),
                                     new SqlParameter("@CreateDate", _user.CreatedDate),
                                     new SqlParameter("@ModifiedDate", _user.ModifiedDate) 
                                   };
            return _da.Execute("Insert_ItemMaster", param);
        }
        #endregion

        #region Add_PaymentMaster..

        public int Add_PaymentMaster(InvoicePayment _user)
        {
            SqlParameter[] param = { new SqlParameter("@InvoiceId", _user.InvoiceId),
                                     new SqlParameter("@PaidAmount", _user.PaidAmount),
                                     new SqlParameter("@PaymentDate", _user.PaymentDate),
                                     new SqlParameter("@PaymentMethod", _user.PaymentMethod),
                                     new SqlParameter("@CardNo", _user.CardNo),
                                     new SqlParameter("@Comment", _user.Comment),
                                     };
            return _da.Execute("Insert_InvoicePayment", param);
        }
        #endregion

        #region Add_PackageMaster..

        public int Add_PackageMaster(PackageMaster _user)
        {
            SqlParameter[] param = { new SqlParameter("@packagename", _user.PackageName),
                                     new SqlParameter("@packagedesc", _user.PackageDesc),
                                     new SqlParameter("@packageduration", _user.PackageDuration ),
                                     new SqlParameter("@no_ofInvoice", _user.NoOfInvoice),
                                     new SqlParameter("@no_ofItem", _user.NoOfItem),
                                     new SqlParameter("@price", _user.Price),
                                     new SqlParameter("@term", _user.Term),
                                     new SqlParameter("@createdDate", _user.CreatedDate),
                                     new SqlParameter("@modifiedDate", _user.ModifiedDate) 
                                   };
            return _da.Execute("Insert_PackageMaster", param);
        }
        #endregion

        #region Edit_UserMaster..

        public int Edit_UserMaster(UserMaster _user)
        {
            SqlParameter[] param = { new SqlParameter("UserId", _user.UserId),
                                     new SqlParameter("@UserName", _user.UserName),
                                     new SqlParameter("@EmailId", _user.EmailId),
                                     new SqlParameter("@Password", _user.Password),
                                     new SqlParameter("@Question", _user.Question),
                                     new SqlParameter("@Answer", _user.Answer),
                                     new SqlParameter("@UserTypeId", _user.UserTypeId),
                                     new SqlParameter("@UserStatus", _user.UserStatus),
                                     new SqlParameter("@modifiedDate", _user.ModifiedDate),
                                     new SqlParameter("@LastLoginDate", _user.LastLoginDate)
                                   };

            return _da.Execute("Update_UserMaster", param);
        }
        #endregion

        #region Edit_UserTypeMaster..

        public int Edit_UserTypeMaster(UserTypeMaster _user)
        {
            SqlParameter[] param = { new SqlParameter("@UserTypeId", _user.UserTypeId),
                                     new SqlParameter("@UserType", _user.UserType) 
                                   };
            return _da.Execute("Update_UserTypeMaster", param);
        }
        #endregion

        #region Edit_CompanyMaster..

        public int Edit_CompanyMaster(CompanyMaster _user)
        {
            SqlParameter[] param = { new SqlParameter("@CompanyId", _user.CompanyId),
                                     new SqlParameter("@CompanyName", _user.CompanyName),
                                     new SqlParameter("@InvoiceNoPrefix", _user.InvoiceNoPrefix),
                                     new SqlParameter("@CompAddress", _user.CompAddress),
                                     new SqlParameter("@CompanyLogo", _user.CompanyLogo),
                                     new SqlParameter("@ContactPersonName", _user.ContactPersonName),
                                     new SqlParameter("@ContactNo", _user.ContactNo),
                                     new SqlParameter("@ContactEmail", _user.ContactEmail),
                                     new SqlParameter("@WebSite", _user.WebSite),
                                     new SqlParameter("@CompanyStatus", _user.CompanyStatus),
                                     new SqlParameter("@UserId", _user.UserId),
                                     new SqlParameter("@modifiedDate", _user.ModifiedDate) 
                                   };
            return _da.Execute("Update_CompanyMaster", param);
        }
        #endregion

        #region Edit_ActiveCompanyMaster..

        public int Edit_ActiveCompanyMaster(CompanyMaster _user)
        {
            SqlParameter[] param = { new SqlParameter("@CompanyId", _user.CompanyId),
                                     new SqlParameter("@CompanyStatus", _user.CompanyStatus),
                                     new SqlParameter("@modifiedDate", _user.ModifiedDate) 
                                   };
            return _da.Execute("Update_ActiveCompanyMaster", param);
        }
        #endregion

        #region Edit_TaxMaster..

        public int Edit_TaxMaster(TaxMaster _user)
        {
            SqlParameter[] param = {  
                                     new SqlParameter("@taxid", _user.TaxId),
                                     new SqlParameter("@taxname", _user.TaxName),
                                     new SqlParameter("@taxdesc", _user.TaxDesc),
                                     new SqlParameter("@taxrate", _user. TaxRate),
                                     new SqlParameter("@taxstatus", _user.TaxStatus),
                                     new SqlParameter("@companyid", _user.CompanyId),
                                     new SqlParameter("@modifieddate", _user.ModifiedDate) 
                                   };
            return _da.Execute("Update_TaxMaster", param);
        }
        #endregion

        #region Edit_ItemMaster..

        public int Edit_ItemMaster(ItemMaster _user)
        {
            SqlParameter[] param = { new SqlParameter("@ItemId", _user.ItemId),
                                     new SqlParameter("@ItemName", _user.ItemName),
                                     new SqlParameter("@ItemDesc", _user.ItemDesc),
                                     new SqlParameter("@UnitPrice", _user.UnitPrice),
                                     new SqlParameter("@ProfitMargin", _user.ProfitMargin),
                                     new SqlParameter("@FinalPrice", _user.FinalPrice),
                                     new SqlParameter("@IsTaxable", _user.IsTaxable),
                                     new SqlParameter("@CompanyId", _user.CompanyId),
                                     new SqlParameter("@ItemStatus", _user.ItemStatus),
                                     new SqlParameter("@ModifiedDate", _user.ModifiedDate) 
                                   };
            return _da.Execute("Update_ItemMaster", param);
        }
        #endregion

        #region Edit_PackageMaster..

        public int Edit_PackageMaster(PackageMaster _user)
        {
            SqlParameter[] param = { new SqlParameter("@packageid ", _user.PackageId),
                                     new SqlParameter("@packagename", _user.PackageName),
                                     new SqlParameter("@packagedesc", _user.PackageDesc),
                                     new SqlParameter("@packageduration", _user.PackageDuration ),
                                     new SqlParameter("@no_ofInvoice", _user.NoOfInvoice),
                                     new SqlParameter("@no_ofItem", _user.NoOfItem),
                                     new SqlParameter("@price", _user.Price),
                                     new SqlParameter("@term", _user.Term),
                                     new SqlParameter("@modifiedDate", _user.ModifiedDate) 
                                   };
            return _da.Execute("Update_PackageMaster", param);
        }
        #endregion

        #region Remove_TaxMaster..

        public int Remove_TaxMaster(TaxMaster _user)
        {
            SqlParameter[] param = { new SqlParameter("@TaxId", _user.TaxId) 
                                   };
            return _da.Execute("Delete_TaxMaster", param);
        }
        #endregion

        #region Remove_ItemMaster..

        public int Remove_ItemMaster(ItemMaster _user)
        {
            SqlParameter[] param = { new SqlParameter("@ItemId", _user.ItemId)
                                   };
            return _da.Execute("Delete_ItemMaster", param);
        }
        #endregion

        #region Remove_PackageMaster..

        public int Remove_PackageMaster(PackageMaster _user)
        {
            SqlParameter[] param = { new SqlParameter("@PackageId ", _user.PackageId),
                                   };
            return _da.Execute("Delete_PackageMaster", param);
        }
        #endregion
    }
}

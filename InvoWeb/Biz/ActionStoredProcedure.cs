using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.User;
using Data.Item;
using Data.Connection;
using Data.Package;
using Data.Invoice;
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
        public int Add_PaackageDetail(CompPackageDetail _user)
        {
            SqlParameter[] param = { new SqlParameter("@CompanyId",_user.CompanyId),
                                       new SqlParameter("@PackageId",_user.PackageId)

                                   };
            return _da.Execute("AddCompany_Detail", param);
        
        }
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

        #region Add_InvoiceMaster..

        public int Add_InvoiceMaster(InvoiceMaster _user)
        {
            SqlParameter[] param = { new SqlParameter("@InvoiceNo", _user.InvoiceNo),
                                     new SqlParameter("@CompanyId", _user.CompanyId),
                                     new SqlParameter("@CreatedDate", _user.CreatedDate),
                                     new SqlParameter("@CustomerName", _user.CustomerName),
                                     new SqlParameter("@Address", _user.Address),
                                     new SqlParameter("@PhoneNo", _user.PhoneNo),
                                     new SqlParameter("@EmailId", _user.EmailId),
                                     new SqlParameter("@SubTotalAmount", _user.SubTotalAmount),
                                     new SqlParameter("@TaxName1", _user.TaxName1),
                                     new SqlParameter("@TaxRate1", _user.TaxRate1),
                                     new SqlParameter("@TaxName2", _user.TaxName2),
                                     new SqlParameter("@TaxRate2", _user.TaxRate2),
                                     new SqlParameter("@DiscountRate", _user.DiscountRate),
                                     new SqlParameter("@AdditionCharge", _user.AdditionCharge),
                                     new SqlParameter("@NetAmount", _user.NetAmount),
                                     new SqlParameter("@Comment", _user.Comment),
                                     new SqlParameter("@SalePersonName", _user.SalePersonName),
                                     new SqlParameter("@PaymentStatus", _user.PaymentStatus),
                                     new SqlParameter("@LastUpdateDate", _user.LastUpdateDate),
                                   };
            return _da.Execute("Insert_InvoiceMaster", param);
        }
        #endregion

        #region Add_InvoiceDetail..

        public int Add_InvoiceDetail(InvoiceDetail _user)
        {
            SqlParameter[] param = { new SqlParameter("@InvoiceId", _user.InvoiceId),
                                     new SqlParameter("@ItemName", _user.ItemName),
                                     new SqlParameter("@ItemDesc", _user.ItemDesc),
                                     new SqlParameter("@UnitRate", _user.UnitRate),
                                     new SqlParameter("@Quantity", _user.Quantity),
                                     new SqlParameter("@IsTaxable", _user.IsTaxable),
                                     new SqlParameter("@Amount", _user.Amount)
                                   };
            return _da.Execute("Insert_InvoiceDetail", param);
        }
        #endregion

        #region Add_InvoicePayment..

        public int Add_InvoicePayment(InvoicePayment _user)
        {
            SqlParameter[] param = { new SqlParameter("@InvoiceId", _user.InvoiceId),
                                     new SqlParameter("@PaidAmount", _user.PaidAmount),
                                     new SqlParameter("@PaymentDate", _user.PaymentDate),
                                     new SqlParameter("@PaymentMethod", _user.PaymentMethod), 
                                     new SqlParameter("@CardNo", _user.CardNo),
                                     new SqlParameter("@Comment", _user.Comment)
                                   };
            return _da.Execute("Insert_InvoicePayment", param);
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

        #region Edit_InvoiceMaster..

        public int Edit_InvoiceMaster(InvoiceMaster _user)
        {
            SqlParameter[] param = { new SqlParameter("@InvoiceId", _user.InvoiceId),
                                   /*  new SqlParameter("@InvoiceNo", _user.InvoiceNo),
                                     new SqlParameter("@CompanyId", _user.CompanyId),
                                     new SqlParameter("@CreatedDate", _user.CreatedDate),
                                     new SqlParameter("@CustomerName", _user.CustomerName),
                                     new SqlParameter("@Address", _user.Address),
                                     new SqlParameter("@PhoneNo", _user.PhoneNo),
                                     new SqlParameter("@EmailId", _user.EmailId),
                                     new SqlParameter("@SubTotalAmount", _user.SubTotalAmount),
                                     new SqlParameter("@TaxName1", _user.TaxName1),
                                     new SqlParameter("@TaxRate1", _user.TaxRate1),
                                     new SqlParameter("@TaxName2", _user.TaxName2),
                                     new SqlParameter("@TaxRate2", _user.TaxRate2),
                                     new SqlParameter("@DiscountRate", _user.DiscountRate),
                                     new SqlParameter("@AdditionCharge", _user.AdditionCharge),
                                     new SqlParameter("@NetAmount", _user.NetAmount),
                                     new SqlParameter("@Comment", _user.Comment),
                                     new SqlParameter("@SalePersonName", _user.SalePersonName), */
                                     new SqlParameter("@PaymentStatus", _user.PaymentStatus)/*,
                                     new SqlParameter("@LastUpdateDate", _user.LastUpdateDate), */
                                   };
            return _da.Execute("Update_InvoiceMaster", param);
        }
        #endregion

        #region Edit_InvoiceMasterFull..

        public int Edit_InvoiceMasterFull(InvoiceMaster _user)
        {
            SqlParameter[] param = { new SqlParameter("@InvoiceId", _user.InvoiceId),
                                     new SqlParameter("@InvoiceNo", _user.InvoiceNo),
                                     new SqlParameter("@CompanyId", _user.CompanyId),
                                     new SqlParameter("@CreatedDate", _user.CreatedDate),
                                     new SqlParameter("@CustomerName", _user.CustomerName),
                                     new SqlParameter("@Address", _user.Address),
                                     new SqlParameter("@PhoneNo", _user.PhoneNo),
                                     new SqlParameter("@EmailId", _user.EmailId),
                                     new SqlParameter("@SubTotalAmount", _user.SubTotalAmount),
                                     new SqlParameter("@TaxName1", _user.TaxName1),
                                     new SqlParameter("@TaxRate1", _user.TaxRate1),
                                     new SqlParameter("@TaxName2", _user.TaxName2),
                                     new SqlParameter("@TaxRate2", _user.TaxRate2),
                                     new SqlParameter("@DiscountRate", _user.DiscountRate),
                                     new SqlParameter("@AdditionCharge", _user.AdditionCharge),
                                     new SqlParameter("@NetAmount", _user.NetAmount),
                                     new SqlParameter("@Comment", _user.Comment),
                                     new SqlParameter("@SalePersonName", _user.SalePersonName), 
                                     new SqlParameter("@PaymentStatus", _user.PaymentStatus),
                                     new SqlParameter("@LastUpdateDate", _user.LastUpdateDate)                                   };
            return _da.Execute("Update_InvoiceMasterFull", param);
        }
        #endregion

        #region Edit_InvoiceDetail..

        public int Edit_InvoiceDetail(InvoiceDetail _user)
        {
            SqlParameter[] param = { new SqlParameter("@InvoiceDetailId", _user.InvoiceDetailId),
                                     new SqlParameter("@InvoiceId", _user.InvoiceId),
                                     new SqlParameter("@ItemName", _user.ItemName),
                                     new SqlParameter("@ItemDesc", _user.ItemDesc),
                                     new SqlParameter("@UnitRate", _user.UnitRate),
                                     new SqlParameter("@Quantity", _user.Quantity),
                                     new SqlParameter("@IsTaxable", _user.IsTaxable),
                                     new SqlParameter("@Amount", _user.Amount)
                                   };
            return _da.Execute("Update_InvoiceDetail", param);
        }
        #endregion

        #region Edit_InvoicePayment..

        public int Edit_InvoicePayment(InvoicePayment _user)
        {
            SqlParameter[] param = { new SqlParameter("@InvoicePaymentId", _user.InvoicePaymentId),
                                     new SqlParameter("@InvoiceId", _user.InvoiceId),
                                     new SqlParameter("@PaidAmount", _user.PaidAmount),
                                     new SqlParameter("@PaymentDate", _user.PaymentDate),
                                     new SqlParameter("@PaymentMethod", _user.PaymentMethod), 
                                     new SqlParameter("@CardNo", _user.CardNo),
                                     new SqlParameter("@Comment", _user.Comment)
                                   };
            return _da.Execute("Update_InvoicePayment", param);
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

         #region Remove_InvoiceMaster..

        public int Remove_InvoiceMaster(InvoiceMaster _user)
        {
            SqlParameter[] param = { new SqlParameter("@InvoiceId", _user.InvoiceId)  
                                   };
            return _da.Execute("Delete_InvoiceMaster", param);
        }
        #endregion

    }
}

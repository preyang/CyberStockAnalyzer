using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.User;
using Data.Connection;
using System.Data.SqlClient;
using System.Data;
using Data.Item;
using Data.Invoice;
using Data.Package;


namespace Biz.SelectSP
{
   public class SelectSP
    {
       DataAccess _da = new DataAccess();

       #region login..

       public DataTable checklogin(UserMaster _user)
       {
           SqlParameter[] param ={   new SqlParameter("@EmailId", _user.EmailId),
                                    new SqlParameter("@Password", _user.Password),
                                    new SqlParameter("@UserStatus", Data.Constants.Active)
                                };
           return _da.GetFromDataTable("Select_CheckUserLogin", param);
       }
       #endregion

       #region LastUserId..

       public int LastUserId()
       {
           SqlParameter[] param = { new SqlParameter("@UserStatus", Data.Constants.Active) };
           return _da.GetInt32("LastUserId", param);
       }
       #endregion

       #region LastUserId..

       public int LastInvoiceId()
       {
           SqlParameter[] param = { };
           return _da.GetInt32("LastInvoiceId", param);
       }
       #endregion

       #region EmailCheck..
       public IDataReader checkEmail(string email)
       {
           SqlParameter[] param ={   new SqlParameter("@EmailId", email),
                                     new SqlParameter("@UserStatus",Data.Constants.Active)
                                };
           return _da.GetFromReader("Select_CheckEmail", param);
       }
       #endregion

       #region InvoiceNoCheck..
       public IDataReader checkInvoiceNo(string No)
       {
           SqlParameter[] param ={   new SqlParameter("@InvoiceNo", No),
                                };
           return _da.GetFromReader("Select_CheckInvoiceNo", param);
       }
       #endregion

       #region Company..

       public DataTable Selectcompany(CompanyMaster  _user)
       {
           SqlParameter[] param ={   new SqlParameter("@CompanyStatus", Data.Constants.Active),
                                     new SqlParameter("@UserId", _user.UserId)
                                   
                                };
           return _da.GetFromDataTable("Select_Company", param);
       }
       #endregion

       #region AllCompany..

       public DataTable SelectAllcompany()
       {
           SqlParameter[] param ={  };
           return _da.GetFromDataTable("Select_AllCompany", param);
       }
       #endregion

       #region SearchCompany..

       public DataTable SearchAllcompany(string search)
       {
           SqlParameter[] param = { 
                                  new SqlParameter("@Search", search)
                                  };
           return _da.GetFromDataTable("Search_AllCompany", param);
       }
       #endregion

       #region Taxbycompany..

       public DataTable SelectTax(TaxMaster _user)
       {
           SqlParameter[] param ={  
                                     new SqlParameter("@companyid", _user.CompanyId) 
                                };
           return _da.GetFromDataTable("Select_Tax", param);
       }
       #endregion

       #region TaxbyTax..

       public DataTable SelectTaxByTaxID(TaxMaster _user)
       {
           SqlParameter[] param ={  
                                     new SqlParameter("@taxid", _user.TaxId)
                                };
           return _da.GetFromDataTable("Select_TaxByTaxID", param);
       }
       #endregion

       #region ItembyCompany..

       public DataTable SelectItem(ItemMaster _user)
       {
           SqlParameter[] param ={  
                                     new SqlParameter("@CompanyId", _user.CompanyId)
                                };
           return _da.GetFromDataTable("Select_Item", param);
       }

        #endregion

       #region ItembyItem..

       public DataTable SelectItemByItemID(ItemMaster _user)
       {
           SqlParameter[] param ={  
                                     new SqlParameter("@ItemId", _user.ItemId)
                                };
           return _da.GetFromDataTable("Select_ItemByItemID", param);
       }

       #endregion

       #region InvoicebyCompany..

       public DataTable SelectInvoice(InvoiceMaster _user)
       {
           SqlParameter[] param ={  
                                     new SqlParameter("@CompanyId", _user.CompanyId)
                                };
           return _da.GetFromDataTable("Select_Invoice", param);
       }

       #endregion

       #region InvoicebyStatus..

       public DataTable SelectInvoiceStatus(InvoiceMaster _user)
       {
           SqlParameter[] param ={  
                                     new SqlParameter("@CompanyId", _user.CompanyId),
                                     new SqlParameter("@PaymentStatus", _user.PaymentStatus)
                                };
           return _da.GetFromDataTable("Select_InvoiceStatus", param);
       }

       #endregion

       #region InvoicebyDate..

       public DataTable SelectInvoiceDate(InvoiceMaster _user, DateTime StartDate, DateTime EndDate)
       {
           SqlParameter[] param ={  
                                     new SqlParameter("@CompanyId", _user.CompanyId),
                                     new SqlParameter("@PaymentStatus", _user.PaymentStatus),
                                     new SqlParameter("@StartDate", StartDate),
                                     new SqlParameter("@EndDate", EndDate)
                                };
           return _da.GetFromDataTable("Select_InvoiceDate", param);
       }

       #endregion

       #region InvoiceById..

       public DataTable SelectInvoiceById(InvoiceMaster _user)
       {
           SqlParameter[] param ={  
                                     new SqlParameter("@InvoiceId", _user.InvoiceId)
                                };
           return _da.GetFromDataTable("Select_InvoiceById", param);
       }

       #endregion

       #region InvoiceDetailById..

       public DataTable SelectInvoiceDetailById(InvoiceDetail _user)
       {
           SqlParameter[] param ={  
                                     new SqlParameter("@InvoiceId", _user.InvoiceId)
                                };
           return _da.GetFromDataTable("Select_InvoiceDetailById", param);
       }

       #endregion

       #region InvoicePaymentById..

       public DataTable SelectInvoicePaymentById(InvoicePayment _user)
       {
           SqlParameter[] param ={  
                                     new SqlParameter("@InvoiceId", _user.InvoiceId)
                                };
           return _da.GetFromDataTable("Select_InvoicePaymentById", param);
       }

       #endregion

       #region Package..
       public DataTable SelectPackage()
       {
           SqlParameter[] param ={ };
           return _da.GetFromDataTable("Select_Package", param);
       }
        #endregion

       #region Select_PackageByID..
       public DataTable Select_PackageByID(PackageMaster _user)
       {
           SqlParameter[] param = { new SqlParameter("@PackageId", _user.PackageId) };
           return _da.GetFromDataTable("Select_PackageByID", param);
       }
       #endregion
    }
}

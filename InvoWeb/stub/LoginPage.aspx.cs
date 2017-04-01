using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Authentication;
using System.Security.Principal;
using System.Data;
using Biz.SelectSP;
using Data.User;
using System.Web.Security;


public partial class LoginPage : System.Web.UI.Page
{
    DataTable _dt = new DataTable();
    UserMaster _um = new UserMaster();
    SelectSP _obj = new SelectSP();
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((string)Session["Status"] == "SignOut")
        {
            if ((string)Session["UserTypeId"] == Convert.ToString(Data.Constants.SuperAdmin))
            {
                Response.Redirect("superadmin/Dashboard.aspx");
            }
            else 
            {
                Response.Redirect("companyadmin/Dashboard.aspx");
            }
        }

    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        _um.EmailId = Login1.UserName.Trim();
        _um.Password = Login1.Password.Trim(); 
        _dt=_obj.checklogin(_um);
        foreach(DataRow row in _dt.Rows)
        {
            FormsAuthentication.RedirectFromLoginPage(row["UserName"].ToString(), false);
            Session.Add("Status", "SignOut");
            Session["UserId"] = row["UserId"].ToString();
            Session["UserName"] = row["UserName"].ToString();
            Session["UserTypeId"] = row["UserTypeId"].ToString();
            Session["CompanyId"] = row["CompanyId"].ToString();
            if (Convert.ToInt16(row["UserTypeId"]) == Data.Constants.SuperAdmin)
            {

                Response.Redirect("superadmin/Dashboard.aspx");
            }
            else
            {
                Response.Redirect("companyadmin/Dashboard.aspx");
            }
        }
       
    }
}
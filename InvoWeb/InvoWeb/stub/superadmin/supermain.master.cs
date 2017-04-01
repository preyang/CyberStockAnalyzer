using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class superadmin_supermain : System.Web.UI.MasterPage
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Session["UserId"] == null && Session["CompanyId"] == null)
        {
            FormsAuthentication.SignOut();
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoginView lv = (LoginView)FindControl("HeadLoginView");
            if (lv != null)
            {
                LoginName ln = (LoginName)lv.FindControl("HeadLoginName");
                if (ln != null)
                {
                    ln.FormatString = (string)Session["UserName"];
                }
            }
        }
        if (Session["UserId"] == null && Session["CompanyId"] == null)
        {
            Response.Write("~/LoginPage.aspx");
        }

    }
    protected void HeadLoginStatus_LoggingOut(object sender, LoginCancelEventArgs e)
    {
        Session.Clear();
        Session.Add("Status", "SignIn");
        FormsAuthentication.SignOut();
    }

}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using Data.Package;
using Biz.ActionStoredProcedure;
using Biz.SelectSP;
public partial class superadmin_packages : System.Web.UI.Page
{
    PackageMaster _pm = new PackageMaster();
    ActionStoredProcedure _obj = new ActionStoredProcedure();
    SelectSP _sobj = new SelectSP();
    DataSet _ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridView();
        }
    }
    private void BindGridView()
    {
        _ds.Tables.Add(_sobj.SelectPackage());
        gvPackage.DataSource = _ds;
        gvPackage.DataBind();
    }
    protected void gvPack_ItemCommmand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument.ToString());
        if (e.CommandName == "Edit")
        {
            Response.Redirect("~/superadmin/package.aspx?index=" + index + "&Chk=0");
        }
        else if (e.CommandName == "Delete")
        {
            _pm.PackageId = index;
            int flag = _obj.Remove_PackageMaster(_pm);
            if (flag == 0)
            {
                Response.Redirect("~/superadmin/packages.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Not Delete Successfully Package..')</script>");
            }
        }

    }
    protected void btnAddPack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/superadmin/package.aspx?Chk=1");
    }
}
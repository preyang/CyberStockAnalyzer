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
public partial class superadmin_package : System.Web.UI.Page
{
    PackageMaster _pm = new PackageMaster();
    ActionStoredProcedure _obj = new ActionStoredProcedure();
    SelectSP _sobj = new SelectSP();
    DataTable _dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request["Chk"] == "1")
            {
                btnSavePack.Visible = false;
            }
            else if (Request["Chk"] == "0")
            {
                if (!IsPostBack)
                {
                    BindGridView(Request["index"]);
                    btnAddPack.Visible = false;
                }
            }
            else
            {
                Response.Redirect("~/superadmin/packages.aspx");
            }
        }
    }
    private void BindGridView(string index)
    {
        _pm.PackageId = Convert.ToInt16(index);
        _dt = _sobj.Select_PackageByID(_pm);
        foreach (DataRow row in _dt.Rows)
        {
            hfPackId.Value = row["PackageId"].ToString();
            txtPackageName.Text = row["PackageName"].ToString();
            txtPackageDesc.Text = row["PackageDesc"].ToString();
            txtPackageDuration.Text = row["PackageDuration"].ToString();
            txtNoOfInvoice.Text = row["NoOfInvoice"].ToString();
            txtNoOfItem.Text = row["NoOfItem"].ToString();
            txtPrice.Text = row["Price"].ToString();
            txtTerm.Text = row["Term"].ToString();
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/superadmin/packages.aspx");
    }
    protected void btnSavePack_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            _pm.PackageId = Convert.ToInt16(hfPackId.Value);
            _pm.PackageName = txtPackageName.Text.Trim();
            _pm.PackageDesc = txtPackageDesc.Text.Trim();
            _pm.PackageDuration = Convert.ToInt16(txtPackageDuration.Text);
            _pm.NoOfInvoice = Convert.ToInt16(txtNoOfInvoice.Text);
            _pm.NoOfItem = Convert.ToInt16(txtNoOfItem.Text);
            _pm.Price = Convert.ToDouble(txtPrice.Text);
            _pm.Term = txtTerm.Text.Trim();
            _pm.ModifiedDate = Convert.ToDateTime(DateTime.Now);
            int flag = _obj.Edit_PackageMaster(_pm);
            if (flag == 0)
            {
                Response.Redirect("~/superadmin/packages.aspx");
            }
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Not Save Successfully Package..')</script>");
            }
        }
    }
    protected void btnAddPack_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            _pm.PackageName = txtPackageName.Text.Trim();
            _pm.PackageDesc = txtPackageDesc.Text.Trim();
            _pm.PackageDuration = Convert.ToInt16(txtPackageDuration.Text);
            _pm.NoOfInvoice = Convert.ToInt16(txtNoOfInvoice.Text);
            _pm.NoOfItem = Convert.ToInt16(txtNoOfItem.Text);
            _pm.Price = Convert.ToDouble(txtPrice.Text);
            _pm.Term = txtTerm.Text.Trim();
            _pm.CreatedDate = Convert.ToDateTime(DateTime.Now);
            _pm.ModifiedDate = Convert.ToDateTime(DateTime.Now);
            int flag = _obj.Add_PackageMaster(_pm);
            if (flag == 0)
            {
                Response.Redirect("~/superadmin/packages.aspx");
            }
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Not Save Successfully Package..')</script>");
            }
        }
    }
}
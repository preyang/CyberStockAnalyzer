using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using Data.User;
using Biz.ActionStoredProcedure;
using Biz.SelectSP;
public partial class superadmin_companies : System.Web.UI.Page
{
    CompanyMaster _cm = new CompanyMaster();
    ActionStoredProcedure _obj = new ActionStoredProcedure();
    SelectSP _sobj = new SelectSP();
    DataSet _ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        txtSearch.Attributes.Add("onblur", "if (this.value=='') { this.value='Search Text..'; }");
        txtSearch.Attributes.Add("onfocus", "if (this.value=='Search Text..') { this.value=''; }");
        if (!IsPostBack)
        {
            BindGridView();
        }
    }

    private void BindGridView()
    {
        _ds.Tables.Add(_sobj.SelectAllcompany());
        gvCompany.DataSource = _ds;
        gvCompany.DataBind();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        _ds.Tables.Add(_sobj.SearchAllcompany(txtSearch.Text.Trim()));
        gvCompany.DataSource = null;
        gvCompany.DataBind();
        gvCompany.DataSource = _ds;
        gvCompany.DataBind();
    }

    protected void gvCompany_ItemCommmand(object sender, GridViewCommandEventArgs e)
    {
       
        switch(e.CommandName)
        {
            case ("Active"):
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            GridViewRow row = gvCompany.Rows[index];
            _cm.CompanyId = Convert.ToInt32(((HiddenField)row.FindControl("hfindex")).Value);
            HiddenField hf = (HiddenField)row.FindControl("hfstatus");
            if (hf.Value == "True")
            {
                _cm.CompanyStatus = Data.Constants.Deactive; 
            }
            else if (hf.Value == "False")
            {
                _cm.CompanyStatus = Data.Constants.Active;
            }
            _cm.ModifiedDate = Convert.ToDateTime(DateTime.Now);
            int flag = _obj.Edit_ActiveCompanyMaster(_cm);
            if (flag == 0)
            {
                Response.Redirect("~/superadmin/companies.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Not Active/Deactive Successfully Company..')</script>");
            }
            break;
            case ("Delete"):
            int index1 = Convert.ToInt32(e.CommandArgument.ToString());
            Response.Redirect("~/superadmin/companies.aspx");
            break;
        }
    }
}
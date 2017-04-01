using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using Data.Item;
using Biz.ActionStoredProcedure;
using Biz.SelectSP;

public partial class companyadmin_tax : System.Web.UI.Page
{
    TaxMaster _tm = new TaxMaster();
    ActionStoredProcedure _obj = new ActionStoredProcedure();
    SelectSP _sobj = new SelectSP();
    DataTable _dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request["Chk"] == "1")
            {
                ddlTaxStatus.Enabled = false;
                ddlTaxStatus.DataValueField = "Active";
                btnSaveTax.Visible = false;
            }
            else if (Request["Chk"] == "0")
            {
                if (!IsPostBack)
                {
                    BindGridView(Request["index"]);
                    btnAddTaxM.Visible = false;
                }
            }
            else
            {
                Response.Redirect("~/companyadmin/taxes.aspx");
            }
        }
    }
    private void BindGridView(string index)
    {
        _tm.TaxId = Convert.ToInt16(index);
        _dt = _sobj.SelectTaxByTaxID(_tm);
        foreach (DataRow row in _dt.Rows)
        {
            hfTaxId.Value = row["TaxId"].ToString();
            txtTaxname.Text = row["TaxName"].ToString();
            txtTaxDesc.Text = row["TaxDesc"].ToString();
            txtTaxrate.Text = row["TaxRate"].ToString();
            if (row["TaxStatus"].ToString() == "True")
            {
                ddlTaxStatus.SelectedValue = "1";
            }
            else
            {
                ddlTaxStatus.SelectedValue = "0";
            }

        }
     }
  
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/companyadmin/taxes.aspx");
    }
    protected void btnSaveTax_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            _tm.TaxId = Convert.ToInt16(hfTaxId.Value);
            _tm.TaxName = txtTaxname.Text.Trim();
            _tm.TaxDesc = txtTaxDesc.Text.Trim();
            _tm.TaxRate = Convert.ToDouble(txtTaxrate.Text);
            _tm.TaxStatus = Convert.ToInt16(ddlTaxStatus.SelectedItem.Value);
            _tm.CompanyId = Convert.ToInt16(Session["CompanyId"]);
            _tm.ModifiedDate = Convert.ToDateTime(DateTime.Now);
            int flag = _obj.Edit_TaxMaster(_tm);
            if (flag == 0)
            {
                Response.Redirect("~/companyadmin/taxes.aspx");
            }
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Not Save Successfully Tax..')</script>");
            }
        }
    }
    protected void btnAddTaxM_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            _tm.TaxName = txtTaxname.Text.Trim();
            _tm.TaxDesc = txtTaxDesc.Text.Trim();
            _tm.TaxRate = Convert.ToDouble(txtTaxrate.Text);
            _tm.TaxStatus = Data.Constants.Active;
            _tm.CompanyId = Convert.ToInt16(Session["CompanyId"]);
            _tm.CreatedDate = Convert.ToDateTime(DateTime.Now);
            _tm.ModifiedDate = Convert.ToDateTime(DateTime.Now);
            int flag = _obj.Add_TaxMaster(_tm);
            if (flag == 0)
            {
                Response.Redirect("~/companyadmin/taxes.aspx");
            }
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Not Save Successfully Tax..')</script>");
            }
        }
    }
  
}
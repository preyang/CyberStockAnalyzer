using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Data.Item;
using Data.User;
using Biz.ActionStoredProcedure;
using Biz.SelectSP;
public partial class companyadmin_invoice : System.Web.UI.Page
{
    CompanyMaster _cm = new CompanyMaster();
    ItemMaster _itm = new ItemMaster();
    TaxMaster _tm = new TaxMaster();
    ActionStoredProcedure _obj = new ActionStoredProcedure();
    SelectSP _sobj = new SelectSP();
    DataTable _dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        txtInvoiceNo.Attributes.Add("onblur", "if (this.value=='') { this.value='00000000'; }");
        txtInvoiceNo.Attributes.Add("onfocus", "if (this.value=='00000000') { this.value=''; }");
        if (!IsPostBack)
        {
            Session["Tax_dt"] = null;
            Session["Item_dt"] = null;
            Session["Temp_dt"] = null;
            BindComp();
            BindTax();
            BindItem();
        }
    }
    private void BindComp()
    {
        _cm.UserId = Convert.ToInt16(Session["UserId"]);
        _dt=_sobj.Selectcompany(_cm);
        foreach (DataRow row in _dt.Rows)
        {
            lblCompName.Text = row["CompanyName"].ToString();
            lblAddress.Text = row["CompAddress"].ToString();
            lblMobileNo.Text = row["ContactNo"].ToString();
            lblEmailID.Text = row["ContactEmail"].ToString();
            lblPrefix.Text = row["InvoiceNoPrefix"].ToString();
            imgLogo.ImageUrl = row["CompanyLogo"].ToString();
        }

    }

    private void BindTax()
    {
        _tm.CompanyId = Convert.ToInt16(Session["CompanyId"]);
        _dt = _sobj.SelectTax(_tm);
        foreach (DataRow row in _dt.Rows)
        {
            if(row["TaxStatus"].ToString() == "True")
            {
                ddlTax1.DataSource = _dt;
                ddlTax1.DataTextField = "TaxName";
                ddlTax1.DataValueField = "TaxId";
                ddlTax2.DataSource = _dt;
                ddlTax2.DataTextField = "TaxName";
                ddlTax2.DataValueField = "TaxId";
            }
        }
        ddlTax1.DataBind();
        ddlTax2.DataBind();
        ddlTax1.Items.Insert(0, new ListItem("Select"));
        ddlTax2.Items.Insert(0, new ListItem("Select"));
        Session["Tax_dt"] = _dt;
    }
    
    private void BindItem()
    {
        _itm.CompanyId = Convert.ToInt16(Session["CompanyId"]);
        _dt = _sobj.SelectItem(_itm);
        foreach (DataRow row in _dt.Rows)
        {
            if (row["ItemStatus"].ToString() == "True")
            {
                ddlItemName.DataSource = _dt;
                ddlItemName.DataTextField = "ItemName";
                ddlItemName.DataValueField = "ItemId";
            }
        }
        ddlItemName.DataBind();
        ddlItemName.Items.Insert(0, new ListItem("----SELECT----"));
        Session["Item_dt"] = _dt;
    }

    protected void ddlPaymentStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlPaymentStatus.SelectedItem.Text == "Paid")
        {
            ddlPaymentMethod.Enabled = true;
        }
        else
        {
            ddlPaymentMethod.Enabled = false;
        }
    }

    protected void ddlPaymentMethod_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlPaymentMethod.SelectedItem.Text == "Credit/Debit Card")
        {
            txtCardNo.Enabled = true; 
        }
        else
        {
            txtCardNo.Enabled = false;
        }
    }

    protected void ddlItemName_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Session["Item_dt"] != null)
        {
            _dt = (DataTable)Session["Item_dt"];
            foreach (DataRow row in _dt.Rows)
            {
                if (ddlPaymentStatus.SelectedItem.Text == row["ItemName"].ToString() && row["ItemStatus"].ToString() == "True")
                {
                    txtItemDesc.Text = row["ItemDesc"].ToString();
                    txtUnitPrice.Text = row["UnitPrice"].ToString();
                    txtAmount.Text = Convert.ToString(Convert.ToInt16(txtUnitPrice.Text) + Convert.ToInt16(txtQuantity.Text));
                }
            }
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Data.Invoice;
using Biz.ActionStoredProcedure;
using Biz.SelectSP;


public partial class companyadmin_Payment : System.Web.UI.Page
{
    InvoiceMaster _invMstr = new InvoiceMaster();
    InvoicePayment _invpay = new InvoicePayment();
    ActionStoredProcedure _obj = new ActionStoredProcedure();
    SelectSP _sobj = new SelectSP();
    DataTable _dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindInvoiceNo();
        }
        if (Request["Chk"] == "1")
        {
            ddlInvoiceNo.Enabled = true;
        }
        else if (Request["Chk"] == "0")
        {
                BindGridView(Request["index"]);
                ddlInvoiceNo.Enabled = false;   
        }
        else
        {
            Response.Redirect("~/companyadmin/invoices.aspx");
        }
    }
    private void BindGridView(string index)
    {
        if (ViewState["Invoice_dt"] != null)
        {
            _dt = (DataTable)ViewState["Invoice_dt"];
            foreach (DataRow row in _dt.Rows)
            {
                if (row["InvoiceId"].ToString() == index)
                {
                    ddlInvoiceNo.SelectedValue = row["InvoiceId"].ToString();
                    lblCustName.Text = row["CustomerName"].ToString();
                    lblCreatedDate.Text = Convert.ToDateTime(row["CreatedDate"]).ToString("d MMMM, yyyy");
                    lblPaidAmt.Text = row["NetAmount"].ToString();
                }
            }
        }
    }
    private void BindInvoiceNo()
    {
        _invMstr.CompanyId = Convert.ToInt16(Session["CompanyId"]);
        _invMstr.PaymentStatus = Data.Constants.UnPaid;
        _dt = _sobj.SelectInvoiceStatus(_invMstr);
        foreach (DataRow row in _dt.Rows)
        {
            ddlInvoiceNo.DataSource = _dt;
            ddlInvoiceNo.DataTextField = "InvoiceNo";
            ddlInvoiceNo.DataValueField = "InvoiceId";
        }
        ddlInvoiceNo.DataBind();
        ddlInvoiceNo.Items.Insert(0, new ListItem("----------Select----------"));
        ViewState["Invoice_dt"] = _dt;
    }
    protected void radiobtnCreditcard_CheckedChanged(object sender, EventArgs e)
    {
        lblCardno.Visible = true;
        txtCardno.Visible = true;
    }

    protected void radiobtnCash_CheckedChanged(object sender, EventArgs e)
    {
        lblCardno.Visible = false;
        txtCardno.Visible = false;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            _invpay.InvoiceId = Convert.ToInt16(ddlInvoiceNo.SelectedItem.Value);
            _invpay.PaidAmount = Convert.ToDouble(lblPaidAmt.Text);
            _invpay.PaymentDate = Convert.ToDateTime(txtPaymentDate.Text);
            if (radiobtnCash.Checked == true)
            {
                _invpay.PaymentMethod = radiobtnCash.Text;
            }
            else if (radiobtnCreditcard.Checked == true)
            {
                _invpay.PaymentMethod = radiobtnCreditcard.Text;
            }
            _invpay.CardNo = txtCardno.Text.Trim();
            _invpay.Comment = txtComment.Text.Trim();
            int flag3 = _obj.Add_InvoicePayment(_invpay);
            if (flag3 == 0)
            {
                _invMstr.InvoiceId = Convert.ToInt16(ddlInvoiceNo.SelectedItem.Value);
                _invMstr.PaymentStatus = Data.Constants.Paid;
                int flag2 = _obj.Edit_InvoiceMaster(_invMstr);
                if (flag2 == 0)
                {
                    Response.Redirect("~/companyadmin/invoices.aspx");
                }
                else { ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('You have not Successfully..')</script>"); }
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('You have not Successfully InvoicePayment..')</script>");
                return;
            }
        }

    }
    protected void btnCancell_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/companyadmin/invoices.aspx");
    }
    protected void ddlInvoiceNo_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGridView(ddlInvoiceNo.SelectedItem.Value);
    }
}
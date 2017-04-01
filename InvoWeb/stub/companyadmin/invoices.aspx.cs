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

public partial class companyadmin_invoices : System.Web.UI.Page
{
    InvoiceMaster _invMstr = new InvoiceMaster();
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
        _invMstr.CompanyId = Convert.ToInt16(Session["CompanyId"]);
        _ds.Tables.Add(_sobj.SelectInvoice(_invMstr));
        gvInvoice.DataSource = _ds;
        gvInvoice.DataBind();
    }
    protected void btnAddInvoice_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/companyadmin/invoice.aspx");
    }
    protected void gvInvoice_InvoiceCommmand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument.ToString());
        if (e.CommandName == "View")
        {
            Response.Redirect("~/companyadmin/InvoiceView.aspx?index=" + index + "&Chk=0");
        }
        else if (e.CommandName == "Delete")
        {
            _invMstr.InvoiceId = index;
            int flag = _obj.Remove_InvoiceMaster(_invMstr);
            if (flag == 0)
            {
                Response.Redirect("~/companyadmin/invoices.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Not Delete Successfully Invoice..')</script>");
            }
        }
        else if (e.CommandName == "Payment")
        {
            Response.Redirect("~/companyadmin/Payment.aspx?index=" + index + "&chk=0");
        }
    }
    protected void gvInvoice_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hf = (HiddenField)e.Row.FindControl("hfstatus");
            Button btn = (Button)e.Row.FindControl("btnPayment");
            if (hf.Value == "False")
            {
                btn.Enabled = true;
            }
        }
    }
    protected void ddlPayment_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlPayment.SelectedItem.Text == "All")
        {
            BindGridView();
            txtEndDate.Enabled = false;
            txtStartDate.Enabled = false;
            btnFilter.Enabled = false;
            txtStartDate.Text = "";
            txtEndDate.Text = "";
        }
        else
        {
            _invMstr.CompanyId = Convert.ToInt16(Session["CompanyId"]);
            _invMstr.PaymentStatus = Convert.ToInt16(ddlPayment.SelectedItem.Value);
            _ds.Tables.Add(_sobj.SelectInvoiceStatus(_invMstr));
            gvInvoice.DataSource = _ds;
            gvInvoice.DataBind();
            txtEndDate.Enabled = true;
            txtStartDate.Enabled = true;
            btnFilter.Enabled = true;
        }
    }
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        if (ddlPayment.SelectedItem.Text == "All")
        {
            BindGridView();
            txtEndDate.Enabled = false;
            txtStartDate.Enabled = false;
            btnFilter.Enabled = false;
        }
        else
        {
            _invMstr.CompanyId = Convert.ToInt16(Session["CompanyId"]);
            _invMstr.PaymentStatus = Convert.ToInt16(ddlPayment.SelectedItem.Value);
            DateTime StartDate = Convert.ToDateTime(txtStartDate.Text);
            DateTime EndDate = Convert.ToDateTime(txtEndDate.Text);
            _ds.Tables.Add(_sobj.SelectInvoiceDate(_invMstr, StartDate, EndDate));
            gvInvoice.DataSource = _ds;
            gvInvoice.DataBind();
            txtEndDate.Enabled = true;
            txtStartDate.Enabled = true;
            btnFilter.Enabled = true;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using System.Data;
using Data.User;
using Data.Invoice;
using Biz.ActionStoredProcedure;
using Biz.SelectSP;
using Biz.SendMail;

public partial class companyadmin_InvoiceView : System.Web.UI.Page
{
    CompanyMaster _cm = new CompanyMaster();
    InvoiceMaster _invmstr = new InvoiceMaster();
    InvoiceDetail _invdtl = new InvoiceDetail();
    InvoicePayment _invpay = new InvoicePayment();
    ActionStoredProcedure _obj = new ActionStoredProcedure();
    SelectSP _sobj = new SelectSP();
    DataTable _dt = new DataTable();
    SendMail _sm = new SendMail();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindComp();
        }
        if (Request["Chk"] == "0")
        {
            BindGridView(Request["index"]);
        }
        else
        {
            Response.Redirect("~/companyadmin/invoices.aspx");
        }
    }

    #region ViewInvoice....
    private void BindGridView(string index)
    {
        _invmstr.InvoiceId = Convert.ToInt16(index);
        _dt = _sobj.SelectInvoiceById(_invmstr);
        foreach (DataRow row in _dt.Rows)
        {
            lblInvoiceNo.Text = row["InvoiceNo"].ToString();
            lblCustName.Text = row["CustomerName"].ToString();
            lblCustAddress.Text = row["Address"].ToString();
            lblCustMobileNo.Text = row["PhoneNo"].ToString();
            lblInvoiceDate.Text = Convert.ToDateTime(row["CreatedDate"]).ToString("d MMMM, yyyy");
            lblCustEmail.Text = row["EmailId"].ToString();
            lblSubTotal.Text = row["SubTotalAmount"].ToString();
            if (row["TaxName1"].ToString() == "")
            {
                lblTaxName1.Visible = false;
                lblTaxRate1.Visible = false;
            }
            else
            {
                lblTaxName1.Text = "Tax (" + row["TaxName1"].ToString() + " %):";
                lblTaxRate1.Text = row["TaxRate1"].ToString();
            }
            if (row["TaxName2"].ToString() == "")
            {
                lblTaxName2.Visible = false;
                lblTaxRate2.Visible = false;
            }
            else
            {
                lblTaxName2.Text = "Tax (" + row["TaxName2"].ToString() + " %):";
                lblTaxRate2.Text = row["TaxRate2"].ToString();
            }
            lblDiscount.Text = row["DiscountRate"].ToString();
            lblAdditionCharge.Text = row["AdditionCharge"].ToString();
            lblTotalAmount.Text = row["NetAmount"].ToString();
            lblComment.Text = row["Comment"].ToString();
            lblSalePersonName.Text = row["SalePersonName"].ToString();
            if (row["PaymentStatus"].ToString() == "True")
            {
                lblPaymentStatus.Text= "Paid";
            }
            else
            {
                lblPaymentStatus.Text = "UnPaid";
            }
        }

        _invdtl.InvoiceId = Convert.ToInt16(index);
        _dt = _sobj.SelectInvoiceDetailById(_invdtl);
        gvItem.DataSource = _dt;
        gvItem.DataBind();
        gvItem.Enabled = false;
       
        _invpay.InvoiceId = Convert.ToInt16(index);
        _dt = _sobj.SelectInvoicePaymentById(_invpay);
        foreach (DataRow row in _dt.Rows)
        {
            lblPaymentMethod.Text = row["PaymentMethod"].ToString();
            lblPaymentMethod.Visible = true;
            lblPaymentMethodName.Visible = true;
            lblPayDate.Text = Convert.ToDateTime(row["PaymentDate"]).ToString("d MMMM, yyyy");
            lblPayDateName.Visible = true;
            lblPayDate.Visible = true;
            if (row["CardNo"].ToString() == "")
            {
                lblCardName.Visible = false;
                lblCardNo.Visible = false;
            }
            else
            {
                lblCardName.Visible = true;
                lblCardNo.Visible = true;
                lblCardNo.Text = row["CardNo"].ToString();
            } 
       }
    }
    #endregion


    private void BindComp()
    {
        _cm.UserId = Convert.ToInt16(Session["UserId"]);
        _dt = _sobj.Selectcompany(_cm);
        foreach (DataRow row in _dt.Rows)
        {
            lblCompName.Text = row["CompanyName"].ToString();
            lblAddress.Text = row["CompAddress"].ToString();
            lblMobileNo.Text = row["ContactNo"].ToString();
            lblEmailID.Text = row["ContactEmail"].ToString();
            imgLogo.ImageUrl =row["CompanyLogo"].ToString();
        }

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/companyadmin/invoices.aspx");
    }
    protected void btnEmail_Click(object sender, EventArgs e)
    {
        string Mail_body = "<h3> Company Name: " + lblCompName.Text + "</h3><br /> Invoice No: " + lblInvoiceNo.Text
            + "<br /> <h4>Invoice Date: " + lblInvoiceDate.Text + "</h4><br /><br />" + GridViewToHtml(gvItem) + "<br /> SubTotalAmount(Rs.): "
            + lblSubTotal.Text + "<br /> Discount(%): " + lblDiscount.Text + "<br /> Addition Charge(Rs.): " + lblAdditionCharge.Text + "<br />" + lblTaxName1.Text + lblTaxRate1.Text + "<br />" + lblTaxName2.Text + lblTaxRate2.Text
            + "<br /><br /><h3>Grand Total Amount: " + lblTotalAmount.Text + "</h3><br /><hr />Notice: The information contained in this e-mail message and/or attachments to it may contain confidential or privileged information. If you are not the intended recipient, any dissemination, use, review, distribution, printing or copying of the information contained in this e-mail message and/or attachments to it are strictly prohibited. If you have received this communication in error, please notify us by reply e-mail or telephone and immediately and permanently delete the message and any attachments. Thank you<br />";
       if (_sm.sendMail(lblCustEmail.Text, Mail_body, "Invoices By InvoWebStub"))
       {
             ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Email Sending Successfully..')</script>");
       }
       else
       {
             ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Email Sending Not Successfully..')</script>");
       }
    }

    #region PDF..
  /*
    protected void btnPdf_Click(object sender, EventArgs e)
    {
        PDF_Export();
    }
 
    private void PDF_Export()
    {
        try
        {
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=Invoice.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        PnlInvoice.RenderControl(hw);
    
        StringReader sr = new StringReader(sw.ToString());
        Document pdfDoc = new Document(PageSize.A4, 20f, 20f, 20f, 20f);
        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        htmlparser.StartDocument();
        htmlparser.Parse(sr);
        htmlparser.EndDocument();
        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();
        }   
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('An error ocurred, the PDF-document could not be created Exception:" + ex.Message + "')</script>"); 
        }
    }
    protected string GetUrl(string imagepath)
    {
        string[] splits = Request.Url.AbsoluteUri.Split('/');
        if (splits.Length >= 2)
        {
            string url = splits[0] + "//";
            for (int i = 2; i < splits.Length - 1; i++)
            {
                url += splits[i];
                url += "/";
            }
            imagepath = imagepath.Remove(0,2);
            url = url.Remove(url.Length-13, 13);
            return url + imagepath;
        }
        return imagepath;
    }
    
   */
    private string GridViewToHtml(GridView grid)
    {
        StringBuilder sTringBuilder = new StringBuilder();
        StringWriter sTringWriter = new StringWriter(sTringBuilder);
        HtmlTextWriter hTmlTextWriter = new HtmlTextWriter(sTringWriter);
        grid.RenderControl(hTmlTextWriter);
        return sTringBuilder.ToString();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    } 

    #endregion


   
}
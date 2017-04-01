using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Data.Item;
using Data.User;
using Data.Invoice;
using Biz.ActionStoredProcedure;
using Biz.SelectSP;
using Biz.Utility;

public partial class companyadmin_invoice : System.Web.UI.Page
{
    CompanyMaster _cm = new CompanyMaster();
    ItemMaster _itm = new ItemMaster();
    TaxMaster _tm = new TaxMaster();
    InvoiceMaster _invmstr = new InvoiceMaster();
    InvoiceDetail _invdtl = new InvoiceDetail();
    InvoicePayment _invpay = new InvoicePayment();
    ActionStoredProcedure _obj = new ActionStoredProcedure();
    SelectSP _sobj = new SelectSP();
    DataTable _dt, _dtTemp = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        
        txtInvoiceNo.Attributes.Add("onblur", "if (this.value=='') { this.value='00000000'; }");
        txtInvoiceNo.Attributes.Add("onfocus", "if (this.value=='00000000') { this.value=''; }");

        if (!IsPostBack)
        {
            ViewState["Tax_dt"] = null;
            ViewState["Item_dt"] = null;
            ViewState["Temp_dt"] = null;
            BindComp();
            BindTax();
            BindItem();
        }

        #region TempItem...
        if (ViewState["Temp_dt"] == null)
        {
            _dtTemp = new DataTable();
            _dtTemp.Columns.Add("ItemName");
            _dtTemp.Columns.Add("ItemDesc");
            _dtTemp.Columns.Add("UnitRate");
            _dtTemp.Columns.Add("Quantity");
            _dtTemp.Columns.Add("IsTaxable");
            _dtTemp.Columns.Add("Amount");
            ViewState["Temp_dt"] = _dtTemp;
        }
        else
        {
            _dtTemp = (DataTable)ViewState["Temp_dt"];

        } 

        if (_dtTemp.Rows.Count > 0)
        {
            btnSave.Enabled = true;
        }
        #endregion

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
            if(row["TaxStatus"].ToString() == "False")
            {
                row.Delete();
            }
        }
        _dt.AcceptChanges();
        ddlTax1.DataSource = _dt;
        ddlTax1.DataTextField = "TaxName";
        ddlTax1.DataValueField = "TaxId";
        ddlTax2.DataSource = _dt;
        ddlTax2.DataTextField = "TaxName";
        ddlTax2.DataValueField = "TaxId";
        ddlTax1.DataBind();
        ddlTax2.DataBind();
        ddlTax1.Items.Insert(0, new ListItem("Select"));
        ddlTax2.Items.Insert(0, new ListItem("Select"));
        ViewState["Tax_dt"] = _dt;
    }
    
    private void BindItem()
    {
        _itm.CompanyId = Convert.ToInt16(Session["CompanyId"]);
        _dt = _sobj.SelectItem(_itm);
        foreach (DataRow row in _dt.Rows)
        {
            if (row["ItemStatus"].ToString() == "False")
            {
                row.Delete(); 
            }
        }
        _dt.AcceptChanges();
        ddlItemName.DataSource = _dt;
        ddlItemName.DataTextField = "ItemName";
        ddlItemName.DataValueField = "ItemId";
        ddlItemName.DataBind();
        ddlItemName.Items.Insert(0, new ListItem("----SELECT----"));
        ViewState["Item_dt"] = _dt;
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
        if (ViewState["Item_dt"] != null)
        {
            _dt = (DataTable)ViewState["Item_dt"];
            foreach (DataRow row in _dt.Rows)
            {
                if (row["ItemName"].ToString() == ddlItemName.SelectedItem.Text && row["ItemStatus"].ToString() == "True")
                {
                    txtItemDesc.Text = row["ItemDesc"].ToString();
                    txtUnitPrice.Text = row["FinalPrice"].ToString();
                    hItemTax.Value = row["IsTaxable"].ToString();
                    txtAmount.Text = Convert.ToString(Convert.ToDouble(txtUnitPrice.Text) * Convert.ToInt16(txtQuantity.Text));
                }
            }
        }
    }


    protected void gvItem_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        _dtTemp.Rows[e.RowIndex].Delete();
        ViewState["Temp_dt"] = _dtTemp;
        gvItem.DataSource = _dtTemp;
        gvItem.DataBind();
        cal();

    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (_dtTemp == null)
        {
            _dtTemp.Rows.Add(ddlItemName.SelectedItem.Text, txtItemDesc.Text, txtUnitPrice.Text, txtQuantity.Text, hItemTax.Value, txtAmount.Text);
        }
        else
        {
            int flag = 0;
            foreach (DataRow row in _dtTemp.Rows)
            {
                if (row["ItemName"].ToString() == ddlItemName.SelectedItem.Text)
                {
                    flag = 1;
                    row["Quantity"] = Convert.ToString(Convert.ToInt16(row["Quantity"]) + Convert.ToInt16(txtQuantity.Text));
                    row["Amount"] = Convert.ToString(Convert.ToDouble(row["Quantity"]) * Convert.ToDouble(txtUnitPrice.Text));
                }
            }
            if (flag == 0)
            {
                _dtTemp.Rows.Add(ddlItemName.SelectedItem.Text, txtItemDesc.Text, txtUnitPrice.Text, txtQuantity.Text, hItemTax.Value, txtAmount.Text);
            }
        }

        gvItem.DataSource = _dtTemp;
        gvItem.DataBind();
        btnSave.Enabled = true;
        cal();
        clr();
    }

    protected void cal()
    {
        double sum = 0, tax = 0, FinalTax = 0;
        foreach (DataRow row in _dtTemp.Rows)
        {
            sum = sum + Convert.ToDouble(row["Amount"]);
            if (row["IsTaxable"].ToString() == "True")
            {
                tax = Convert.ToDouble(lblTax1.Text) + Convert.ToDouble(lblTax2.Text);
                FinalTax = FinalTax + ((sum * tax) / 100);
            }
        }
        lblSubTotal.Text = Convert.ToString(sum);
        lblTotalPrice.Text =Convert.ToString(sum + Convert.ToDouble(txtAddCharge.Text) + FinalTax - ((sum * Convert.ToDouble(txtDiscount.Text)) / 100));
    }

    protected void clr()
    {
        ddlItemName.Text = "----SELECT----";
        txtItemDesc.Text = "";
        txtUnitPrice.Text = "";
        txtQuantity.Text = "1";
        txtAmount.Text = "";
        hItemTax.Value = "";
    }
  

    protected void txtQuantity_TextChanged(object sender, EventArgs e)
    {
        txtAmount.Text = Convert.ToString(Convert.ToDouble(txtUnitPrice.Text) * Convert.ToInt16(txtQuantity.Text));
    }

    protected void txtUnitPrice_TextChanged(object sender, EventArgs e)
    {
        txtAmount.Text = Convert.ToString(Convert.ToDouble(txtUnitPrice.Text) * Convert.ToInt16(txtQuantity.Text));
    }

    protected void txtDiscount_TextChanged(object sender, EventArgs e)
    {
        cal();
    }
    protected void txtAddCharge_TextChanged(object sender, EventArgs e)
    {
        cal();
    }

    protected void ddlTax1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlTax1.SelectedItem.Text == "Select")
        {
            lblTax1.Text = "00.00";
        }
        else
        {

            if (ViewState["Tax_dt"] != null)
            {
                _dt = (DataTable)ViewState["Tax_dt"];
                foreach (DataRow row in _dt.Rows)
                {
                    if (row["TaxName"].ToString() == ddlTax1.SelectedItem.Text && row["TaxStatus"].ToString() == "True")
                    {
                        lblTax1.Text = row["TaxRate"].ToString();
                    }
                }
            }
        }
        cal();
    }
    protected void ddlTax2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlTax2.SelectedItem.Text == "Select")
        {
            lblTax2.Text = "00.00";
        }
        else
        {
            if (ViewState["Tax_dt"] != null)
            {
                _dt = (DataTable)ViewState["Tax_dt"];
                foreach (DataRow row in _dt.Rows)
                {
                    if (row["TaxName"].ToString() == ddlTax2.SelectedItem.Text && row["TaxStatus"].ToString() == "True")
                    {
                        lblTax2.Text = row["TaxRate"].ToString();
                    }
                }
            }
        }
        cal();
    }

    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        #region InvoiceNOValidation
        Utility _ut = new Utility();
        if (!_ut.ParamNo((lblPrefix.Text + txtInvoiceNo.Text.Trim())))
        {
            args.IsValid = false;
            return;
        }
        else
        {
            args.IsValid = true;
        }
        #endregion
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        
        if (Page.IsValid)
        {
           
          #region InvoiceMaster..
        _invmstr.InvoiceNo=(lblPrefix.Text + txtInvoiceNo.Text.Trim());
        _invmstr.CompanyId = Convert.ToInt16(Session["CompanyId"]); 
        _invmstr.CreatedDate = Convert.ToDateTime(txtDate.Text);
        _invmstr.CustomerName = txtCustName.Text.Trim();
        _invmstr.Address = txtCustAddress.Text.Trim();
        _invmstr.PhoneNo = Convert.ToDouble(txtCustMobile.Text.Trim());
        _invmstr.EmailId = txtCustEmail.Text.Trim(); 
        _invmstr.SubTotalAmount = Convert.ToDouble(lblSubTotal.Text);
         if(ddlTax1.SelectedItem.Text=="Select")
         {
            _invmstr.TaxName1 = "";
         }
         else
         {
            _invmstr.TaxName1 = ddlTax1.SelectedItem.Text;
         }
        _invmstr.TaxRate1 = Convert.ToDouble(lblTax1.Text);
        if (ddlTax2.SelectedItem.Text == "Select")
        {
            _invmstr.TaxName2 = "";
        }
        else
        {
            _invmstr.TaxName2 = ddlTax2.SelectedItem.Text;
        }
        _invmstr.TaxRate2 = Convert.ToDouble(lblTax2.Text);
        _invmstr.DiscountRate=Convert.ToDouble(txtDiscount.Text);
        _invmstr.AdditionCharge=Convert.ToDouble(txtAddCharge.Text);
        _invmstr.NetAmount=Convert.ToDouble(lblTotalPrice.Text);
        _invmstr.Comment=txtComment.Text.Trim();
        _invmstr.SalePersonName=txtSalePerson.Text.Trim();
        _invmstr.PaymentStatus=Convert.ToInt16(ddlPaymentStatus.SelectedItem.Value);
        _invmstr.LastUpdateDate = Convert.ToDateTime(DateTime.Now); 
        #endregion

            int flag1= _obj.Add_InvoiceMaster(_invmstr);
            if (flag1 == 0)
            {
                ViewState["InvoiceId"] = Convert.ToString(_sobj.LastInvoiceId());
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('You have not Successfully InvoiceMaster..')</script>");
                return;
            }

           #region InvoiceDetails..
            int r = 0, l = _dtTemp.Rows.Count;
            for (r = 0; r < l; r++)
            {
                _invdtl.InvoiceId = Convert.ToInt16(ViewState["InvoiceId"]);
                _invdtl.ItemName = _dtTemp.Rows[r][0].ToString();
                _invdtl.ItemDesc = _dtTemp.Rows[r][1].ToString();
                _invdtl.UnitRate = Convert.ToDouble(_dtTemp.Rows[r][2]);
                _invdtl.Quantity = Convert.ToInt16(_dtTemp.Rows[r][3]);
                if (Convert.ToString(_dtTemp.Rows[r][4]) == "True")
                {    
                     _invdtl.IsTaxable = 1;
                }
                else
                {
                    _invdtl.IsTaxable = 0;
                }
                _invdtl.Amount = Convert.ToDouble(_dtTemp.Rows[r][5]);

                int flag2 = _obj.Add_InvoiceDetail(_invdtl);
                if (flag2 == 1)
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('You have not Successfully InvoiceDetail..')</script>");
                    return;
                }
            }
            
            #endregion

           #region InvoicePayment..

            if (ddlPaymentStatus.SelectedItem.Text == "Paid")
            {
                _invpay.InvoiceId = Convert.ToInt16(ViewState["InvoiceId"]);
                _invpay.PaidAmount = Convert.ToDouble(lblTotalPrice.Text);
                _invpay.PaymentDate = Convert.ToDateTime(txtDate.Text);
                _invpay.PaymentMethod = ddlPaymentMethod.SelectedItem.Text;
                _invpay.CardNo = txtCardNo.Text.Trim();
                _invpay.Comment = txtComment.Text.Trim();

                int flag3 = _obj.Add_InvoicePayment(_invpay);
                if (flag3 == 0)
                {
                    Response.Redirect("~/companyadmin/InvoiceView.aspx?index=" + ViewState["InvoiceId"] + "&Chk=0");
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('You have not Successfully InvoicePayment..')</script>");
                    return;
                }
            }
            else
            {
                Response.Redirect("~/companyadmin/InvoiceView.aspx?index=" + ViewState["InvoiceId"] + "&Chk=0");
            }
            #endregion
            
            
         }
        
    }
}

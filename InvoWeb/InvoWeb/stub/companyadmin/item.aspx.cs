using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Data.Item;
using Biz.ActionStoredProcedure;
using Biz.SelectSP;

public partial class companyadmin_item : System.Web.UI.Page
{
    ItemMaster _itm = new ItemMaster();
    ActionStoredProcedure _obj = new ActionStoredProcedure();
    SelectSP _sobj = new SelectSP();
    DataTable _dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
 
        if (Request["Chk"] == "1")
        {
            ddlItemStatus.Enabled = false;
            ddlItemStatus.DataValueField = "Active";
            btnSaveItem.Visible = false;
        }
        else if (Request["Chk"] == "0")
        {
            if (!IsPostBack)
            {
                BindGridView(Request["index"]);
                btnAddItem.Visible = false;
            }
        }
        else
        {
            Response.Redirect("~/companyadmin/items.aspx");
        }
    }
    private void BindGridView(string index)
    {
        _itm.ItemId = Convert.ToInt16(index);
        _dt = _sobj.SelectItemByItemID(_itm);
        foreach (DataRow row in _dt.Rows)
        {
            hfItemId.Value = row["ItemId"].ToString();
            txtItemName.Text = row["ItemName"].ToString();
            txtItemDesc.Text = row["ItemDesc"].ToString();
            txtUnitPrice.Text = row["UnitPrice"].ToString();
            txtProfitMargin.Text = row["ProfitMargin"].ToString();
            txtFinalPrice.Text = row["FinalPrice"].ToString();
            if (row["IsTaxable"].ToString() == "True")
            {
                chckbxisTaxable.Checked = true;
            }
            else
            {
                chckbxisTaxable.Checked = false;
            }
            if (row["ItemStatus"].ToString() == "True")
            {
                ddlItemStatus.SelectedValue = "1";
            }
            else
            {
                ddlItemStatus.SelectedValue = "0";
            }
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/companyadmin/items.aspx");
    }

    protected void btnAddItem_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            _itm.ItemName = txtItemName.Text.Trim();
            _itm.ItemDesc = txtItemDesc.Text.Trim();
            _itm.UnitPrice = Convert.ToDouble(txtUnitPrice.Text);
            _itm.ProfitMargin = Convert.ToDouble(txtProfitMargin.Text);
            _itm.FinalPrice = Convert.ToDouble(txtFinalPrice.Text);
            if (chckbxisTaxable.Checked == true)
            {
                _itm.IsTaxable = Data.Constants.Active;
            }
            else if (chckbxisTaxable.Checked == false)
            {
                _itm.IsTaxable = Data.Constants.Deactive;
            }
            _itm.ItemStatus = Data.Constants.Active;
            _itm.CompanyId = Convert.ToInt16(Session["CompanyId"]);
            _itm.CreatedDate = Convert.ToDateTime(DateTime.Now);
            _itm.ModifiedDate = Convert.ToDateTime(DateTime.Now);
            int flag = _obj.Add_ItemMaster(_itm);
            if (flag == 0)
            {
                Response.Redirect("~/companyadmin/items.aspx");
            }
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Not Save Successfully Item..')</script>");
            }
        }
    }

    protected void btnSaveItem_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            _itm.ItemId = Convert.ToInt16(hfItemId.Value);
            _itm.ItemName = txtItemName.Text.Trim();
            _itm.ItemDesc = txtItemDesc.Text.Trim();
            _itm.UnitPrice = Convert.ToDouble(txtUnitPrice.Text);
            _itm.ProfitMargin = Convert.ToDouble(txtProfitMargin.Text);
            _itm.FinalPrice = Convert.ToDouble(txtFinalPrice.Text);
            if (chckbxisTaxable.Checked == true)
            {
                _itm.IsTaxable = Data.Constants.Active;
            }
            else if (chckbxisTaxable.Checked == false)
            {
                _itm.IsTaxable = Data.Constants.Deactive;
            }
            _itm.ItemStatus = Convert.ToInt16(ddlItemStatus.SelectedItem.Value);
            _itm.CompanyId = Convert.ToInt16(Session["CompanyId"]);
            _itm.ModifiedDate = Convert.ToDateTime(DateTime.Now);
            int flag = _obj.Edit_ItemMaster(_itm);
            if (flag == 0)
            {
                Response.Redirect("~/companyadmin/items.aspx");
            }
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Not Save Successfully Item..')</script>");
            }
        }
    }

    protected void txtProfitMargin_TextChanged(object sender, EventArgs e)
    {
        getFinalprice();
    }
    void getFinalprice()
    {
        if (txtUnitPrice.Text == null || txtProfitMargin.Text == null)
        {
            return;
        }
        else
        {
            if (Page.IsValid)
            {
                double finalprice, unitprice, promargin;
                unitprice = Convert.ToDouble(txtUnitPrice.Text);
                promargin = Convert.ToDouble(txtProfitMargin.Text);
                finalprice = unitprice + ((unitprice * promargin) / 100);
                txtFinalPrice.Text = Convert.ToString(finalprice);
            }
        }
    }
    protected void txtUnitPrice_TextChanged(object sender, EventArgs e)
    {
        getFinalprice();
    }
}
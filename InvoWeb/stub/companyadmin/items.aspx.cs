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

public partial class companyadmin_items : System.Web.UI.Page
{
    ItemMaster _itm = new ItemMaster();
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
        _itm.CompanyId = Convert.ToInt16(Session["CompanyId"]);
        _ds.Tables.Add(_sobj.SelectItem(_itm));
        gvItem.DataSource = _ds;
        gvItem.DataBind();
    }
    protected void gvItem_ItemCommmand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument.ToString());
        if (e.CommandName == "Edit")
        {
            Response.Redirect("~/companyadmin/item.aspx?index=" + index + "&Chk=0");
        }
        else if (e.CommandName == "Delete")
        {
            _itm.ItemId = index;
            int flag = _obj.Remove_ItemMaster(_itm);
            if (flag == 0)
            {
                Response.Redirect("~/companyadmin/items.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Not Delete Successfully Item..')</script>");
            }
        }

    }
    protected void btnAdditem_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/companyadmin/item.aspx?Chk=1");
    }
}
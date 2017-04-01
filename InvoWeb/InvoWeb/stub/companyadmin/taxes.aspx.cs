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
public partial class companyadmin_taxes : System.Web.UI.Page
{
    TaxMaster _tm = new TaxMaster();
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
        _tm.CompanyId = Convert.ToInt16(Session["CompanyId"]);
        _ds.Tables.Add(_sobj.SelectTax(_tm));
        gvTax.DataSource = _ds;
        gvTax.DataBind();

    }
    protected void gvTax_ItemCommmand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument.ToString());
        if (e.CommandName == "Edit")
        {
            Response.Redirect("~/companyadmin/tax.aspx?index=" + index +"&Chk=0");
        }
        else if (e.CommandName == "Delete")
        {
            _tm.TaxId = index;
            int flag = _obj.Remove_TaxMaster(_tm);
            if (flag == 0)
            {
                Response.Redirect("~/companyadmin/taxes.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Not Delete Successfully Tax..')</script>");
            }
        }

    }
   
    protected void btnAddTax_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/companyadmin/tax.aspx?Chk=1");
    }
}
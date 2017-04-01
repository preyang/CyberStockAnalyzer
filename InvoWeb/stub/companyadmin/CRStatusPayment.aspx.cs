using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using System.Data;


public partial class companyadmin_CRStatusPayment : System.Web.UI.Page
{
    CRStatusPaymentOfCustomer.StatusPaymentDataTable DT = new CRStatusPaymentOfCustomer.StatusPaymentDataTable();
    CRStatusPaymentOfCustomerTableAdapters.StatusPaymentTableAdapter Radapter = new CRStatusPaymentOfCustomerTableAdapters.StatusPaymentTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        int compid = Convert.ToInt16(Session["CompanyId"]);
        DT = Radapter.GetData(compid);
        ReportDocument rpt = new ReportDocument();
        string path = Server.MapPath("CRPaymentStatus.rpt");
        rpt.Load(path);
        rpt.SetDataSource((DataTable)DT);
        CrystalReportViewer1.ReportSource = rpt;

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        bool a;
        if (DropDownList1.SelectedIndex == 0)
        {
            a = true;
        }
        else
        {
            a = false;
        }
        int compid = Convert.ToInt16(Session["CompanyId"]);
        DT = Radapter.GetDataByStatus(compid,a);
        ReportDocument rpt = new ReportDocument();
        string path = Server.MapPath("CRPaymentStatus.rpt");
        rpt.Load(path);
        rpt.SetDataSource((DataTable)DT);
        CrystalReportViewer1.ReportSource = rpt;

    }
}
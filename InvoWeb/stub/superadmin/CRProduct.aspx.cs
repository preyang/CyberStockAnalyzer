using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CrystalDecisions.CrystalReports.Engine;

public partial class superadmin_CRProduct : System.Web.UI.Page
{
    CRSuperAdminProduct.SuperAdminProductDataTable DT = new CRSuperAdminProduct.SuperAdminProductDataTable();
    CRSuperAdminProductTableAdapters.SuperAdminProductTableAdapter Radapter = new CRSuperAdminProductTableAdapters.SuperAdminProductTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        DT = Radapter.GetDataBynone();
        ReportDocument rpt = new ReportDocument();
        string path = Server.MapPath("CRCompanyProduct.rpt");
        rpt.Load(path);
        rpt.SetDataSource((DataTable)DT);
        CrystalReportViewer1.ReportSource = rpt;

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DT = Radapter.GetData(TextBox1.Text);
        ReportDocument rpt = new ReportDocument();
        string path = Server.MapPath("CRCompanyProduct.rpt");
        rpt.Load(path);
        rpt.SetDataSource((DataTable)DT);
        CrystalReportViewer1.ReportSource = rpt;

    }
}
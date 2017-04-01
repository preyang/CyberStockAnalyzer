using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using System.Data;


public partial class superadmin_CRCompDetail : System.Web.UI.Page
{
    CompanyDetail.CompanyMasterDataTable DT = new CompanyDetail.CompanyMasterDataTable();
    CompanyDetailTableAdapters.CompanyMasterTableAdapter RAdapter = new CompanyDetailTableAdapters.CompanyMasterTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        FillDetail();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DT = RAdapter.GetDataByName(TextBox1.Text);
        ReportDocument rpt = new ReportDocument();
        string path = Server.MapPath("CRCompDetail.rpt");
        rpt.Load(path);
        rpt.SetDataSource((DataTable)DT);
        CrystalReportViewer1.ReportSource = rpt;

    }
    public void FillDetail()
    {
        DT = RAdapter.GetData();
        ReportDocument rpt = new ReportDocument();
        string path = Server.MapPath("CRCompDetail.rpt");
        rpt.Load(path);
        rpt.SetDataSource((DataTable)DT);
        CrystalReportViewer1.ReportSource = rpt;

    }
}
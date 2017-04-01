using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using System.Data;

public partial class companyadmin_Default : System.Web.UI.Page
{
    DataSet1.CompanyMasterDataTable DT = new DataSet1.CompanyMasterDataTable();
    DataSet1TableAdapters.CompanyMasterTableAdapter Radpater = new DataSet1TableAdapters.CompanyMasterTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DT = Radpater.GetData();
        ReportDocument rpt = new ReportDocument();
        string path = Server.MapPath("CrystalReport.rpt");
        rpt.Load(path);
        rpt.SetDataSource((DataTable)DT);
        CrystalReportViewer1.ReportSource = rpt;

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CrystalDecisions.CrystalReports.Engine;

public partial class superadmin_CRCompStatus : System.Web.UI.Page
{
    CRSuperAdminCompStatus.CompanyStatusDataTable DT = new CRSuperAdminCompStatus.CompanyStatusDataTable();
    CRSuperAdminCompStatusTableAdapters.CompanyStatusTableAdapter Radapter = new CRSuperAdminCompStatusTableAdapters.CompanyStatusTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        bool a;
        if(DropDownList1.SelectedItem.Value=="True")
        {
            a = true;
        }
        else
        {
            a = false;

        }

        DT = Radapter.GetDataByStatus(a);
        ReportDocument rpt = new ReportDocument();
        string path = Server.MapPath("CRCompStatus.rpt");
        rpt.Load(path);
        rpt.SetDataSource((DataTable)DT);
        CrystalReportViewer1.ReportSource = rpt;

    }
}
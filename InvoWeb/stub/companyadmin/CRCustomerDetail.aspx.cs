﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using System.Data;

public partial class companyadmin_CRCustomerDetail : System.Web.UI.Page
{
    CustomerDetail.CustomerMasterDataTable DT = new CustomerDetail.CustomerMasterDataTable();
    CustomerDetailTableAdapters.CustomerMasterTableAdapter Radapter = new CustomerDetailTableAdapters.CustomerMasterTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        FillDetail();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int compid = Convert.ToInt16(Session["CompanyId"]);
        DT = Radapter.GetDataByName(compid, TextBox1.Text);
        ReportDocument rpt = new ReportDocument();
        string path = Server.MapPath("CRCustomerDetail.rpt");
        rpt.Load(path);
        rpt.SetDataSource((DataTable)DT);
        CrystalReportViewer1.ReportSource = rpt;

    }
    public void FillDetail()
    {
        int compid = Convert.ToInt16(Session["CompanyId"]);
        DT = Radapter.GetData(compid);
        ReportDocument rpt = new ReportDocument();
        string path = Server.MapPath("CRCustomerDetail.rpt");
        rpt.Load(path);
        rpt.SetDataSource((DataTable)DT);
        CrystalReportViewer1.ReportSource = rpt;

    }
}
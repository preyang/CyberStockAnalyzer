using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class companyadmin_Package : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ConnectionString);
    SqlDataAdapter da;
    SqlCommand cmd;
    DataTable dt;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        }
    protected void Submit_Click(object sender, EventArgs e)
    {
        
        int compid = Convert.ToInt16(Session["CompanyId"]);
        int packageid =Convert.ToInt16(ddlPackage.SelectedValue.ToString());
        cmd = new SqlCommand("Insert into Package_Detail (CompanyId,PackageId) values(@compid,@packageid)", con);
        cmd.Parameters.AddWithValue("@compid", compid);
        cmd.Parameters.AddWithValue("@packageid", packageid);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        int n = FindNoOfInvoices();
        Label1.Text = Convert.ToString(n);
        ViewState["noinvoice"] = n;
        

    }
    public int FindNoOfInvoices()
    {
        int packageid = Convert.ToInt16(ddlPackage.SelectedValue.ToString());
        cmd = new SqlCommand("SELECT NoOfInvoice FROM PackageMaster WHERE PackageId=@packageid", con);
         cmd.Parameters.AddWithValue("@packageid", packageid);
         da = new SqlDataAdapter(cmd);
         dt = new DataTable();
         da.Fill(dt);
         return Convert.ToInt16(dt.Rows[0]["NoOfInvoice"].ToString());
    
    }
    
}
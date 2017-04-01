using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class companyadmin_Payment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void radiobtnCreditcard_CheckedChanged(object sender, EventArgs e)
    {
        lblCardno.Visible = true;
        txtCardno.Visible = true;
    }

    protected void radiobtnDebitcard_CheckedChanged(object sender, EventArgs e)
    {
        lblCardno.Visible = true;
        txtCardno.Visible = true;
    
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class superadmin_Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (dlCust.Items.Count == 0)
        {
            dlCust.Visible = false;
            lblcompany.Visible = true;
        }
        if (dlInvoice.Items.Count == 0)
        {
            dlInvoice.Visible = false;
            lblInvoice.Visible = true;
        }
    }
}
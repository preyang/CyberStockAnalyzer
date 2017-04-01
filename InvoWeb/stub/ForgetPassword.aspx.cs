using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;


public partial class companyadmin_ForgetPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Email();

    }
    public void Email()
    {
        MailMessage Msg = new MailMessage();
        // Sender e-mail address.
        Msg.From = new MailAddress("shah.preyang@gmail.com");
        // Recipient e-mail address.
        Msg.To.Add(txtemailid.Text);
        Msg.Subject = "Your Password Details";
        Msg.Body = "Hi, <br/>Please check your Login Detailss<br/><br/>Your Username: " + ViewState["EmailId"] + "<br/><br/>Your Password: " + ViewState["Password"] + "<br/><br/>";
        Msg.IsBodyHtml = true;
        // your remote SMTP server IP.
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com"; //Or Your SMTP Server Address
        smtp.Credentials = new System.Net.NetworkCredential
               ("shah.preyang@gmail.com", "preyang12");


        smtp.EnableSsl = true;
        smtp.Send(Msg);
        //Msg = null;
            txtemailid.Text = "";
    }
}
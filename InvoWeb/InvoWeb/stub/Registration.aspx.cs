using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Biz.ActionStoredProcedure;
using Data.User;
using Biz.Utility;
using Biz.SelectSP;

public partial class Registration : System.Web.UI.Page
{
    UserMaster _um = new UserMaster();
    CompanyMaster _cm = new CompanyMaster();
    ActionStoredProcedure _obj = new ActionStoredProcedure();
    SelectSP _sobj = new SelectSP();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
                ViewState["UserName"] = Convert.ToString(txtUserName.Text.Trim());
                ViewState["EmailId"] = Convert.ToString(txtEmailId.Text.Trim());
                ViewState["Password"] = Convert.ToString(txtPassword.Text.Trim());
                ViewState["SecurityQuestion"] = Convert.ToString(ddlSecurityQuestion.Text.Trim());
                ViewState["Answer"] = Convert.ToString(txtAnswer.Text.Trim());
                lblAcctStatus.Text = " (Step-2) ";
                mvRegister.ActiveViewIndex = 1;
        }
    }
    protected void SavecompMaster_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            #region Registration..
            _um.UserName = Convert.ToString(ViewState["UserName"]);
            _um.EmailId = Convert.ToString(ViewState["EmailId"]);
            _um.Password = Convert.ToString(ViewState["Password"]);
            _um.Question = Convert.ToString(ViewState["SecurityQuestion"]);
            _um.Answer = Convert.ToString(ViewState["Answer"]);
            _um.UserTypeId = Data.Constants.CompanyAdmin;
            _um.UserStatus = Data.Constants.Active;
            _um.CreatedDate = Convert.ToDateTime(DateTime.Now);
            _um.ModifiedDate = Convert.ToDateTime(DateTime.Now);
            _um.LastLoginDate = Convert.ToDateTime(DateTime.Now);
            #endregion

            int flag1 = _obj.Add_UserMaster(_um);
            if (flag1 == 0)
            {
                ViewState["UserId"] = Convert.ToString(_sobj.LastUserId());
            }

            #region Company..
            _cm.CompanyName = txtCompanyName.Text.Trim();
            _cm.InvoiceNoPrefix = txtInvoiceNoPrefix.Text.ToUpper();
            _cm.CompAddress = txtCompAddress.Text.Trim();

            #region ImageValidation
            string filename;
            if (logoUpload.HasFile)
            {
                lbvalenght.Visible = true;
                try
                {
                    if (logoUpload.PostedFile.ContentType == "image/jpg" || logoUpload.PostedFile.ContentType == "image/jpeg")
                    {
                        if (logoUpload.PostedFile.ContentLength < 102400)
                        {
                            filename = Path.GetFileName(logoUpload.FileName);
                            logoUpload.SaveAs(Server.MapPath("~/Img/ComImage/") + filename);
                            _cm.CompanyLogo = "~/Img/ComImage/" + logoUpload.FileName;
                            lbvalenght.Text = "Upload status: File uploaded!";
                        }
                        else
                        { lbvalenght.Text = "Upload status: The file has to be less than 100 kb!"; return; }
                    }
                    else
                    { lbvalenght.Text = "Upload status: Only JPEG files are accepted!"; return; }
                }
                catch (Exception ex)
                {
                    lbvalenght.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message; return;
                }
            }
            #endregion
           
            _cm.ContactPersonName = txtContactPerson.Text.Trim();
            _cm.ContactNo = Convert.ToDouble(txtContactNo.Text.Trim());
            _cm.ContactEmail = txtContactEmail.Text.Trim();
            _cm.WebSite = txtWebsite.Text.Trim();
            _cm.CompanyStatus = Data.Constants.Active;
            _cm.UserId = Convert.ToInt16(ViewState["UserId"]);
            _cm.CreatedDate = Convert.ToDateTime(DateTime.Now);
            _cm.ModifiedDate = Convert.ToDateTime(DateTime.Now); 
            #endregion

            int flag = _obj.Add_CompanyMaster(_cm);

            if (flag == 0)
            {
                Response.Redirect("LoginPage.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('You have not Successfully Registration..')</script>");
            }
        }
    }

    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        #region EmailValidation
        Utility _ut = new Utility();
        if (!_ut.Param(txtEmailId.Text.Trim()))
        {
            args.IsValid = false;
            return;
        }
        else
        {
            args.IsValid = true;
        }
        #endregion
    }

    protected void Back_Click(object sender, EventArgs e)
    {
        mvRegister.ActiveViewIndex = 0;
    }
}
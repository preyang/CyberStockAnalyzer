using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Biz.ActionStoredProcedure;
using Biz.SelectSP;
using Data.User;
using System.IO;
public partial class companyadmin_viewcompany : System.Web.UI.Page
{
    DataSet _ds = new DataSet();
    CompanyMaster _cm = new CompanyMaster();
    ActionStoredProcedure _objEdit = new ActionStoredProcedure();
    SelectSP _obj = new SelectSP();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindFormView();
        }
    }
    protected void FVCompany_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Edit"))
        {
            FVCompany.ChangeMode(FormViewMode.Edit);
        }
        else if (e.CommandName.Equals("Cancel"))
        {
            FVCompany.ChangeMode(FormViewMode.ReadOnly);
        }
        else if (e.CommandName.Equals("Save"))
        {
            UpdateFormView();
        }
    }

    protected void FVCompany_ModeChanging(object sender, FormViewModeEventArgs e)
    {
        BindFormView();
    }
    protected void FVCompany_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        Trace.Warn("Updated");
        FVCompany.ChangeMode(FormViewMode.ReadOnly);
    }

    private void BindFormView()
    {
        _cm.UserId = Convert.ToInt16(Session["UserId"]);
        _ds.Tables.Add(_obj.Selectcompany(_cm));
        FVCompany.DataSource = _ds;
        FVCompany.DataBind();

    }

    private void UpdateFormView()
    {
        if (Page.IsValid)
        {
            _cm.CompanyId = Convert.ToInt16(Session["CompanyId"]);
            _cm.CompanyName = ((TextBox)FVCompany.FindControl("txtCompanyName")).Text.Trim();
            _cm.InvoiceNoPrefix = ((TextBox)FVCompany.FindControl("txtInvoiceNoPrefix")).Text.Trim();
            _cm.CompAddress = ((TextBox)FVCompany.FindControl("txtCompAddress")).Text.Trim();

            #region ImageValidation
            string filename;
            if (((FileUpload)FVCompany.FindControl("logoUpload")).HasFile)
            {
                ((Label)FVCompany.FindControl("lbvalenght")).Visible = true;
                try
                {
                    if (((FileUpload)FVCompany.FindControl("logoUpload")).PostedFile.ContentType == "image/jpg" || ((FileUpload)FVCompany.FindControl("logoUpload")).PostedFile.ContentType == "image/jpeg")
                    {
                        if (((FileUpload)FVCompany.FindControl("logoUpload")).PostedFile.ContentLength < 102400)
                        {
                            filename = Path.GetFileName(((FileUpload)FVCompany.FindControl("logoUpload")).FileName);
                            ((FileUpload)FVCompany.FindControl("logoUpload")).SaveAs(Server.MapPath("~/Img/ComImage/") + filename);
                            _cm.CompanyLogo = "~/Img/ComImage/" + ((FileUpload)FVCompany.FindControl("logoUpload")).FileName;
                            ((Label)FVCompany.FindControl("lbvalenght")).Text = "Upload status: File uploaded!";
                        }
                        else
                        { ((Label)FVCompany.FindControl("lbvalenght")).Text = "Upload status: The file has to be less than 100 kb!"; return; }
                    }
                    else
                    { ((Label)FVCompany.FindControl("lbvalenght")).Text = "Upload status: Only JPEG files are accepted!"; return; }
                }
                catch (Exception ex)
                {
                    ((Label)FVCompany.FindControl("lbvalenght")).Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message; return;
                }
            }
            else
            {
                _cm.CompanyLogo = ((HiddenField)FVCompany.FindControl("hfCompLogo")).Value;
            }
            #endregion
           
            _cm.ContactPersonName = ((TextBox)FVCompany.FindControl("txtContactPerson")).Text.Trim();
            _cm.ContactNo = Convert.ToDouble(((TextBox)FVCompany.FindControl("txtContactNo")).Text.Trim());
            _cm.ContactEmail = ((TextBox)FVCompany.FindControl("txtContactEmail")).Text.Trim();
            _cm.WebSite = ((TextBox)FVCompany.FindControl("txtWebsite")).Text.Trim();
            _cm.CompanyStatus = Data.Constants.Active;
            _cm.UserId = Convert.ToInt16(Session["UserId"]);
            _cm.ModifiedDate = Convert.ToDateTime(DateTime.Now);
            int flag = _objEdit.Edit_CompanyMaster(_cm);
            if (flag == 0)
            {
                FVCompany.ChangeMode(FormViewMode.ReadOnly);
                BindFormView();
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('You have not Successfully Update Company..')</script>");
            }
        }
    }
}
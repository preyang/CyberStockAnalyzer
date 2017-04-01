<%@ Page Title="" Language="C#" MasterPageFile="~/companyadmin/adminmain.master" AutoEventWireup="true" CodeFile="viewcompany.aspx.cs" Inherits="companyadmin_viewcompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
InvoWebStub-Company Master
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">

<h1>
   Company Management
 </h1>

<div class="accountInfo">
<fieldset class="register">
    <legend>Company Information</legend>
<asp:FormView ID="FVCompany" runat="server" Width="100%" 
        DataKeyNames="CompanyID" OnItemCommand="FVCompany_ItemCommand" 
        OnModeChanging="FVCompany_ModeChanging" OnItemUpdated="FVCompany_ItemUpdated"  >
 <ItemTemplate>
 <table>
<tr>
<td style="text-transform: capitalize; font-weight: 600"  >
    Company Name :
</td>
<td>
    <asp:Label ID="lblCompanyName" runat="server" Text='<%# Eval("CompanyName") %>'></asp:Label>
</td>
<td>&nbsp;</td>
</tr>

<tr>
<td style="text-transform: capitalize; font-weight: 600">
    Invoice No Prefix :
</td>
<td>
   <asp:Label ID="lblInvoiceNoPrefix" runat="server" Text='<%# Eval("InvoiceNoPrefix") %>'></asp:Label>
</td>
<td>&nbsp;</td>
</tr>

<tr>
<td style="text-transform: capitalize; font-weight: 600">
    Company Address :
    
</td>
<td>
   <asp:Label ID="lblCompAddress" runat="server" Text='<%# Eval("CompAddress") %>'></asp:Label>
</td>
<td>&nbsp;</td>
</tr>

<tr>
<td style="text-transform: capitalize; font-weight: 600">
    Company Logo :
</td>

<td>
    <asp:Image ID="imgLogo" runat="server" ImageUrl='<%# Eval("CompanyLogo") %>'  
        CssClass="imgbanner" /></td>

<td>
   &nbsp;</td>
    
</tr>

<tr>
<td style="text-transform: capitalize; font-weight: 600">
    Contact Person Name :     
</td>
<td>
   <asp:Label ID="lblContactPerson" runat="server" Text='<%# Eval("ContactPersonName") %>' ></asp:Label>
</td>
<td>&nbsp;</td>
</tr>
<tr>
<td style="text-transform: capitalize; font-weight: 600">
    Contact No :
    
</td>
<td>
   <asp:Label ID="lblContactNo" runat="server" Text='<%# Eval("ContactNo") %>' ></asp:Label>
</td>
<td>
    &nbsp;</td>
</tr>
<tr>
<td style="text-transform: capitalize; font-weight: 600">
    Contact Email ID :
   
</td>
<td>
    <asp:Label ID="lblContactEmail" runat="server" Text='<%# Eval("ContactEmail") %>'></asp:Label>
</td>
<td>
   
    </td>
</tr>
<tr>
<td style="text-transform: capitalize; font-weight: 600">
    WebSite :
</td>
<td>
   <asp:Label ID="lblWebsite" runat="server" Text='<%# Eval("WebSite") %>'></asp:Label>
</td>
<td>&nbsp;</td>
</tr>

<tr>
<td>
    &nbsp;
</td>
<td>
    <asp:Button ID="EditcompMaster" runat="server" CommandName="Edit" Text="Edit Company" CssClass="submit" />
</td>
<td>
    &nbsp;
</td>
</tr>
</table>
 </ItemTemplate>
<EditItemTemplate>
<h6>Fields mark with red asterisk (*) are required</h6>
<table>
<tr>
<td>
    <asp:Label ID="lblCompanyName" runat="server" Text="CompanyName"></asp:Label>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="*" ControlToValidate="txtCompanyName" 
        ForeColor="Red"></asp:RequiredFieldValidator>
</td>
<td>
    <asp:TextBox ID="txtCompanyName" runat="server" CssClass="text" Text='<%# Eval("CompanyName") %>'></asp:TextBox>
</td>
<td>&nbsp;</td>
</tr>

<tr>
<td>
    <asp:Label ID="lblInvoiceNoPrefix" runat="server" Text="Invoice No Prefix"></asp:Label><br />
</td>
<td>
    <asp:TextBox ID="txtInvoiceNoPrefix" runat="server" CssClass="text" Text='<%# Eval("InvoiceNoPrefix") %>'></asp:TextBox><br />example. "IWS" for InvoiceNo-"IWS00002". 
</td>
<td><asp:RegularExpressionValidator ID="RegularExpressionValidator4"
        runat="server" ErrorMessage="Maximum 3 character string." ValidationExpression="^[a-zA-Z]{3,3}$" ControlToValidate="txtInvoiceNoPrefix"></asp:RegularExpressionValidator><br /></td>
</tr>

<tr>
<td>
    <asp:Label ID="lblCompAddress" runat="server" Text="Company Address"></asp:Label>
     <br /><br /><br /><br />
</td>
<td>
    <asp:TextBox ID="txtCompAddress" runat="server" CssClass="text" 
        TextMode="MultiLine" Text='<%# Eval("CompAddress") %>'></asp:TextBox>
</td>
<td>&nbsp;</td>
</tr>

<tr>
<td>
    <asp:Label ID="lblCompLogo" runat="server" Text="Company Logo"></asp:Label><asp:HiddenField
        ID="hfCompLogo" runat="server" Value='<%# Eval("CompanyLogo") %>' />
</td>

<td>
    <asp:FileUpload ID="logoUpload" runat="server" CssClass="upload"  />
    <br />Only JPEG image files are accepted, less than 100 kb!</td>

<td>
    <asp:Label ID="lbvalenght" runat="server" ForeColor="Red" Text="Label" 
        Visible="False"></asp:Label>
    </td>
</tr>
<tr>
<td>
    <asp:Label ID="lblContactPerson" runat="server" Text="Contact Person Name"></asp:Label>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
        ErrorMessage="*" ControlToValidate="txtContactPerson" 
        ForeColor="Red"></asp:RequiredFieldValidator>
</td>
<td>
    <asp:TextBox ID="txtContactPerson" runat="server" CssClass="text" Text='<%# Eval("ContactPersonName") %>'></asp:TextBox>
</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>
    <asp:Label ID="lblContactNo" runat="server" Text="Contact No"></asp:Label>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
        ErrorMessage="*" ControlToValidate="txtContactNo" 
        ForeColor="Red"></asp:RequiredFieldValidator>
</td>
<td>
    <asp:TextBox ID="txtContactNo" runat="server" CssClass="text" Text='<%# Eval("ContactNo") %>'></asp:TextBox>
</td>
<td>
    &nbsp;</td>
</tr>
<tr>
<td>
    <asp:Label ID="lblContactEmail" runat="server" Text="Contact Email"></asp:Label>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
        ErrorMessage="*" ControlToValidate="txtContactEmail" 
        ForeColor="Red"></asp:RequiredFieldValidator>
</td>
<td>
    <asp:TextBox ID="txtContactEmail" runat="server" CssClass="text" Text='<%# Eval("ContactEmail") %>'></asp:TextBox>
</td>
<td>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ControlToValidate="txtContactEmail" ErrorMessage="Please Enter Valid Email-Id" 
        ForeColor="Red" 
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </td>
</tr>
<tr>
<td>
    <asp:Label ID="lblWebsite" runat="server" Text="Website"></asp:Label>
</td>
<td>
    <asp:TextBox ID="txtWebsite" runat="server" CssClass="text"  Text='<%# Eval("WebSite") %>'></asp:TextBox>
</td>
<td>&nbsp;</td>
</tr>

<tr>
<td>
    <asp:Button ID="SavecompMaster" runat="server" CommandName="Save" Text="Save Company" 
        CssClass="submit"  />
</td>
<td>
 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="CancelcompMaster" runat="server" CommandName="Cancel" Text="Cancel" 
        CssClass="submit" />
</td>
<td>
    &nbsp;
</td>
</tr>
</table>
 </EditItemTemplate>
</asp:FormView>
</fieldset> 
</div>
</asp:Content>


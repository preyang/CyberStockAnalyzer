<%@ Page Title="" Language="C#" MasterPageFile="~/superadmin/supermain.master" AutoEventWireup="true" CodeFile="package.aspx.cs" Inherits="superadmin_package" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
InvoWebStub-Package Management
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>
    Package Management
 </h1>
<div class="accountInfo">
<fieldset class="register">
<legend>Package Infomation</legend>
<table>
<tr>
<td>
    <asp:Label ID="lblPackageName" runat="server" Text="Package Name"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtPackageName" ErrorMessage="*" ForeColor="Red" 
                    ValidationGroup="s"></asp:RequiredFieldValidator>
    <br />
                    <asp:HiddenField ID="hfPackId" runat="server" />
 </td>
 <td>
     <asp:TextBox ID="txtPackageName" runat="server" CssClass="text"></asp:TextBox>
     </td>
</tr>
<tr>
<td>
    <asp:Label ID="lblPackageDesc" runat="server" Text="Package Description"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtPackageDesc" ErrorMessage="*" ForeColor="Red" 
                    ValidationGroup="s"></asp:RequiredFieldValidator>
 </td>
 <td>
     <asp:TextBox ID="txtPackageDesc" runat="server" CssClass="text" 
         TextMode="MultiLine"></asp:TextBox></td>
</tr>
<tr>
<td>
    <asp:Label ID="lblPackageDuration" runat="server" Text="Package Duration/Days "></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtPackageDuration" ErrorMessage="*" ForeColor="Red" 
                    ValidationGroup="s"></asp:RequiredFieldValidator>
 </td>
 <td>
     <asp:TextBox ID="txtPackageDuration" runat="server" CssClass="text"></asp:TextBox></td>
        <td><asp:RegularExpressionValidator ID="RegularExpressionValidator1"
        runat="server" ErrorMessage="Only numeric characters." 
        ValidationExpression="^(-)?\d+(\.\d\d)?$" ControlToValidate="txtPackageDuration" 
        ForeColor="Red" ValidationGroup="s"></asp:RegularExpressionValidator>
                </td>
</tr>
<tr>
<td>
    <asp:Label ID="lblNoOfInvoice" runat="server" Text="No Of Invoice"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtNoOfInvoice" ErrorMessage="*" ForeColor="Red" 
                    ValidationGroup="s"></asp:RequiredFieldValidator>
 </td>
 <td>
     <asp:TextBox ID="txtNoOfInvoice" runat="server" CssClass="text"></asp:TextBox></td>
      <td><asp:RegularExpressionValidator ID="RegularExpressionValidator3"
        runat="server" ErrorMessage="Only numeric characters." 
        ValidationExpression="^(-)?\d+(\.\d\d)?$" ControlToValidate="txtNoOfInvoice" 
        ForeColor="Red" ValidationGroup="s"></asp:RegularExpressionValidator>
                </td>
</tr>
<tr>
<td>
    <asp:Label ID="lblNoOfItem" runat="server" Text="No Of Product"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtNoOfItem" ErrorMessage="*" ForeColor="Red" 
                    ValidationGroup="s"></asp:RequiredFieldValidator>
 </td>
 <td>
     <asp:TextBox ID="txtNoOfItem" runat="server" CssClass="text"></asp:TextBox></td>
      <td><asp:RegularExpressionValidator ID="RegularExpressionValidator4"
        runat="server" ErrorMessage="Only numeric characters." 
        ValidationExpression="^(-)?\d+(\.\d\d)?$" ControlToValidate="txtNoOfItem" 
        ForeColor="Red" ValidationGroup="s"></asp:RegularExpressionValidator>
                </td>
</tr>
<tr>
<td>
    <asp:Label ID="lblPrice" runat="server" Text="Price"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtPrice" ErrorMessage="*" ForeColor="Red" 
                    ValidationGroup="s"></asp:RequiredFieldValidator>
 </td>
 <td>
     <asp:TextBox ID="txtPrice" runat="server" CssClass="text"></asp:TextBox></td>
     <td><asp:RegularExpressionValidator ID="RegularExpressionValidator5"
        runat="server" ErrorMessage="Only numeric characters. &amp; Upto 2 decimal places." 
        ValidationExpression="^(-)?\d+(\.\d\d)?$" ControlToValidate="txtPrice" 
        ForeColor="Red" ValidationGroup="s"></asp:RegularExpressionValidator>
                </td>
</tr>
<tr>
<td>
    <asp:Label ID="lblTerm" runat="server" Text="Term"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="txtTerm" ErrorMessage="*" ForeColor="Red" 
                    ValidationGroup="s"></asp:RequiredFieldValidator>
 </td>
 <td>
     <asp:TextBox ID="txtTerm" runat="server" CssClass="text"></asp:TextBox></td>
</tr>
<tr>
 <td></td>
            <td align="right">
                <asp:Button ID="btnAddPack" runat="server" Text="Add Package" CssClass="submit" 
                    ValidationGroup="s" onclick="btnAddPack_Click"   />
                <asp:Button ID="btnSavePack" runat="server" CssClass="submit" 
                    Text="Save Package" ValidationGroup="s" onclick="btnSavePack_Click" />
                </td>
             <td>
                <asp:Button ID="btnCancel" runat="server" Text="Cancel Package" CssClass="submit" 
                     onclick="btnCancel_Click" /></td>
   </tr>
</table>
</fieldset>
</div>
</asp:Content>


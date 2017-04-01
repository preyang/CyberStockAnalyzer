<%@ Page Title="" Language="C#" MasterPageFile="~/companyadmin/adminmain.master" AutoEventWireup="true" CodeFile="tax.aspx.cs" Inherits="companyadmin_tax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
InvoWebStub-Tax Management
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
   <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <asp:UpdatePanel ID="upItem" runat="server">
    <ContentTemplate>
     <h1>
    Tax Management
 </h1>

<div class="accountInfo">
<fieldset class="register">
    <legend>Tax Information</legend>

<table>
            <tr>
            <td>
                <asp:Label ID="lblTaxname" runat="server" Text="Tax name"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtTaxname" ErrorMessage="*" ForeColor="Red" 
                    ValidationGroup="s"></asp:RequiredFieldValidator>
                    <asp:HiddenField ID="hfTaxId" runat="server" />
            </td>
            <td>
                <asp:TextBox ID="txtTaxname" runat="server" CssClass="text"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            </tr>

            <tr>
            <td>
                <asp:Label ID="lblTaxDesc" runat="server" Text="Tax Description"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtTaxDesc" ErrorMessage="*" ForeColor="Red" 
                    ValidationGroup="s"></asp:RequiredFieldValidator>
                <br /><br /><br /><br />
            </td>
            <td>
                <asp:TextBox ID="txtTaxDesc" runat="server" CssClass="text"
                    TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            </tr>

            <tr>
            <td>
                <asp:Label ID="lbtTaxrate" runat="server" Text="Tax Rate"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtTaxrate" ErrorMessage="*" ForeColor="Red" 
                    ValidationGroup="s"></asp:RequiredFieldValidator>
                <br />
                <br />
                <br />

            </td>
            <td>
                <asp:TextBox ID="txtTaxrate" runat="server" CssClass="text"></asp:TextBox>  <br />
                Percentage Value (%) Only.
                <br />
                <asp:RangeValidator ID="percentageRangeValidator" runat="server"
   ControlToValidate="txtTaxrate" 
   ErrorMessage="Below 50 % Percentage" 
   MaximumValue="50.00" MinimumValue="0.00" ValidationGroup="s" ForeColor="Red" Type="Double"></asp:RangeValidator> 
            </td>
            <td><asp:RegularExpressionValidator ID="RegularExpressionValidator3"
        runat="server" ErrorMessage="Only numeric characters. &amp; Upto 2 decimal places." 
        ValidationExpression="^(-)?\d+(\.\d\d)?$" ControlToValidate="txtTaxrate" 
        ForeColor="Red" ValidationGroup="s"></asp:RegularExpressionValidator>
                <br />
                <br />
                <br /></td>
            </tr>

            <tr>
            <td>
                <asp:Label ID="lblTaxStatus" runat="server" Text="Tax Status"></asp:Label>
            </td>
            <td>
                 <asp:DropDownList ID="ddlTaxStatus" runat="server">
                    <asp:ListItem Value='1'>Active</asp:ListItem>
                    <asp:ListItem Value='0'>Deactive</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
            </tr>

            <tr>
            <td></td>
            <td align="right">
                <asp:Button ID="btnAddTaxM" runat="server" Text="Add Tax" CssClass="submit" 
                    ValidationGroup="s" onclick="btnAddTaxM_Click"  />
                <asp:Button ID="btnSaveTax" runat="server" CssClass="submit" 
                    onclick="btnSaveTax_Click" Text="Save Tax" ValidationGroup="s" />
                </td>
             <td>
                <asp:Button ID="btnCancel" runat="server" Text="Cancel Tax" CssClass="submit" 
                     onclick="btnCancel_Click" /></td>
            </tr>
            </table>
</fieldset> 
</div>
 </ContentTemplate>
 </asp:UpdatePanel>
</asp:Content>


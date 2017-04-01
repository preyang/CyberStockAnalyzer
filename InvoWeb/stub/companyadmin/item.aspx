<%@ Page Title="" Language="C#" MasterPageFile="~/companyadmin/adminmain.master" AutoEventWireup="true" CodeFile="item.aspx.cs" Inherits="companyadmin_item" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
InvoWebStub-Product Management
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
 <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <asp:UpdatePanel ID="upItem" runat="server">
    <ContentTemplate>
  <h1>
    Product Management
 </h1>
      <div class="accountInfo">
       <fieldset class="register">
    <legend>Product Information</legend>
       <table>
        <tr>
        <td>
            <asp:Label ID="lblProductName" runat="server" Text="Product Name"></asp:Label>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
        ErrorMessage="*" ControlToValidate="txtItemName" 
        ForeColor="Red" ValidationGroup="s"></asp:RequiredFieldValidator>
        <asp:HiddenField ID="hfItemId" runat="server" />
    <br />
        </td>
        <td>
            <asp:TextBox ID="txtItemName" runat="server" CssClass="text"></asp:TextBox>
        </td>
        </tr>
        <tr>
        <td>
            <asp:Label ID="lblProductDesc" runat="server" Text="Product Description"></asp:Label>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="*" ControlToValidate="txtItemDesc" 
        ForeColor="Red" ValidationGroup="s"></asp:RequiredFieldValidator>
    <br />
        </td>
        <td>
            <asp:TextBox ID="txtItemDesc" runat="server" CssClass="text" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
        </tr>

        <tr>
    <td>
        <asp:Label ID="lblUnitPrice" runat="server" Text="Unit Price"></asp:Label>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
        ErrorMessage="*" ControlToValidate="txtUnitPrice" 
        ForeColor="Red" ValidationGroup="s"></asp:RequiredFieldValidator>
    <br />
    </td>
    <td>
        <asp:TextBox ID="txtUnitPrice" runat="server" CssClass="text" 
            ValidationGroup="s" AutoPostBack="True" 
            ontextchanged="txtUnitPrice_TextChanged" CausesValidation="True"></asp:TextBox>
    </td>
      <td><asp:RegularExpressionValidator ID="RegularExpressionValidator1"
        runat="server" ErrorMessage="Only numeric characters. &amp; Upto 2 decimal places." 
        ValidationExpression="^(-)?\d+(\.\d\d)?$" ControlToValidate="txtUnitPrice" 
        ForeColor="Red" ValidationGroup="s"></asp:RegularExpressionValidator><br /></td>
    </tr>
   
    <tr>
    <td>
        <asp:Label ID="lblProfitMargin" runat="server" Text="Profit Margin"></asp:Label>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
        ErrorMessage="*" ControlToValidate="txtProfitMargin" 
        ForeColor="Red" ValidationGroup="s"></asp:RequiredFieldValidator>
        <br />
        <br />
    <br />
    </td>
    <td>
        <asp:TextBox ID="txtProfitMargin" runat="server" CssClass="text" 
            ValidationGroup="s" AutoPostBack="True" 
            ontextchanged="txtProfitMargin_TextChanged" CausesValidation="True"></asp:TextBox>
        <br /> Percentage Value (%) Only.<br />
           <asp:RangeValidator ID="percentageRangeValidator" runat="server"
   ControlToValidate="txtProfitMargin" 
   ErrorMessage="Below 50 % Percentage" 
   MaximumValue="50.00" MinimumValue="0.00" ValidationGroup="s" ForeColor="Red" 
            Type="Double"></asp:RangeValidator> 
    </td>
    <td><asp:RegularExpressionValidator ID="RegularExpressionValidator3"
        runat="server" ErrorMessage="Only numeric characters. &amp; Upto 2 decimal places." 
        ValidationExpression="^(-)?\d+(\.\d\d)?$" ControlToValidate="txtProfitMargin" 
        ForeColor="Red" ValidationGroup="s"></asp:RegularExpressionValidator>
        <br />
        <br />
        <br /></td>
    </tr>
    <tr>
    <td>
        <asp:Label ID="lblFinalPrice" runat="server" Text="Final Price"></asp:Label>
    <br />
    </td>
    <td>
        <asp:TextBox ID="txtFinalPrice" runat="server" CssClass="text" Enabled="False"></asp:TextBox>
    </td>
    <td><br /></td>
    </tr>
    
        <tr>
        <td>
            <asp:Label ID="lblIsTaxable" runat="server" Text="Is Taxable"></asp:Label>
    <br />
        </td>
        <td>
            <asp:CheckBox ID="chckbxisTaxable" runat="server" CssClass="check" />
        </td>
        </tr>
         <tr>
            <td>
                <asp:Label ID="lblItemStatus" runat="server" Text="Product Status"></asp:Label>
            </td>
            <td>
                 <asp:DropDownList ID="ddlItemStatus" runat="server">
                    <asp:ListItem Value='1'>Active</asp:ListItem>
                    <asp:ListItem Value='0'>Deactive</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
            </tr>
        <tr>
            <td></td>
            <td align="right">
                <asp:Button ID="btnAddItem" runat="server" Text="Add Product" CssClass="submit" 
                    ValidationGroup="s" onclick="btnAddItem_Click"   />
                <asp:Button ID="btnSaveItem" runat="server" CssClass="submit" 
                     Text="Save Product" ValidationGroup="s" onclick="btnSaveItem_Click" />
                </td>
             <td>
                <asp:Button ID="btnCancel" runat="server" Text="Cancel Product" 
                     CssClass="submit" onclick="btnCancel_Click" 
                     /></td>
            </tr>
</table>
</fieldset>
</div>
 </ContentTemplate>
 </asp:UpdatePanel>
</asp:Content>


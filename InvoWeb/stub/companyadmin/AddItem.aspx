<%@ Page Title="" Language="C#" MasterPageFile="~/companyadmin/adminmain.master" AutoEventWireup="true" CodeFile="AddItem.aspx.cs" Inherits="companyadmin_AddItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:MultiView ID="mvAddItem" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
        <div class="accountInfo">
       <fieldset class="register">
    <legend>Add Item</legend>
       <table>
        <tr>
        <td>
            <asp:Label ID="lblProductName" runat="server" Text="Product Name"></asp:Label>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
        ErrorMessage="*" ControlToValidate="txtUserName" 
        ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
        </td>
        <td>
            <asp:TextBox ID="txtProductName" runat="server" CssClass="text"></asp:TextBox>
        </td>
        </tr>
        <tr>
        <td>
            <asp:Label ID="lblProductDesc" runat="server" Text="Product Description"></asp:Label>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="*" ControlToValidate="txtUserName" 
        ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
        </td>
        <td>
            <asp:TextBox ID="txtProductDesc" runat="server" CssClass="text"></asp:TextBox>
        </td>
        </tr>
        <tr>
        <td>
            <asp:Label ID="lblIsDiscount" runat="server" Text="Is Discount"></asp:Label>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ErrorMessage="*" ControlToValidate="txtUserName" 
        ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
        </td>
        <td>
            <asp:CheckBox ID="chckbxisDiscount" runat="server" />
        </td>
        </tr>
        <tr>
        <td>
            <asp:Label ID="lblIsTaxable" runat="server" Text="Is Taxable"></asp:Label>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ErrorMessage="*" ControlToValidate="txtUserName" 
        ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
        </td>
        <td>
            <asp:CheckBox ID="chckbxisTaxable" runat="server" />
        </td>
        </tr>
        <tr>
<td> &nbsp;</td>
<td> 
 <asp:Button ID="btn_Save" runat="server" Text="Save" 
        CssClass="submit"  />

</td>
<td>
    <asp:Button ID="btnNext" runat="server" Text="Next" 
        CssClass="submit" onclick="btnNext_Click" />
</td>
</tr>
        </table>
        </fieldset>
        </div>
        </asp:View>
        <asp:View ID="View2" runat="server">
        <div class="accountInfo">
        <fieldset class="register">
    <legend>Unit Information</legend>
    <table>
    <tr>
    <td>
        <asp:Label ID="lblUnitName" runat="server" Text="Unit Name"></asp:Label>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ErrorMessage="*" ControlToValidate="txtUserName" 
        ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    </td>
    <td>
        <asp:DropDownList ID="ddlUnitName" runat="server">
        <asp:ListItem><----------------Select----------------></asp:ListItem>
        </asp:DropDownList>
    </td>
    <td>
        <asp:Button ID="btnAddUnit" runat="server" CssClass="text" Text="+Add New Unit" />
    </td>
    </tr>
    <tr>
    <td>
        <asp:Label ID="lblproduct_name" runat="server" Text="Product Name"></asp:Label>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
        ErrorMessage="*" ControlToValidate="txtUserName" 
        ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    </td>
    <td>
        <asp:DropDownList ID="ddlProductName" runat="server">
        <asp:ListItem><----------------Select----------------></asp:ListItem>
        </asp:DropDownList>
    </td>
    <td>
     <asp:Button ID="btnAddProduct" runat="server" CssClass="text" Text="+Add New Product" />
    </td>
    </tr>
    <tr>
    <td>
        <asp:Label ID="lblUnitPrice" runat="server" Text="Unit Price"></asp:Label>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
        ErrorMessage="*" ControlToValidate="txtUserName" 
        ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    </td>
    <td>
        <asp:TextBox ID="txtUnitPrice" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td>
        <asp:Label ID="lblProfitMargin" runat="server" Text="Profit Margin"></asp:Label>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
        ErrorMessage="*" ControlToValidate="txtUserName" 
        ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    </td>
    <td>
        <asp:TextBox ID="txtProfitMargin" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td>
        <asp:Label ID="lblFinalPrice" runat="server" Text="Final Price"></asp:Label>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
        ErrorMessage="*" ControlToValidate="txtUserName" 
        ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    </td>
    <td>
        <asp:TextBox ID="txtFinalPrice" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
<td> &nbsp;</td>
<td>&nbsp;</td>
<td>
    <asp:Button ID="btnFinish" runat="server" Text="Finish" 
        CssClass="submit"  />
</td>
</tr>
    </table>
    </fieldset>
    </div>
        </asp:View>
        <asp:View ID="View3" runat="server">
        <div class="accountInfo">
       <fieldset class="register">
    <legend>Add Unit</legend>
    <table>
    <tr>
    <td>
        <asp:Label ID="lblUnit_Name" runat="server" Text="Unit Name"></asp:Label>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
        ErrorMessage="*" ControlToValidate="txtUserName" 
        ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    </td>
    <td>
        <asp:TextBox ID="txtUnitName" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td>
        <asp:Label ID="lblUnitDesc" runat="server" Text="Unit Description"></asp:Label>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
        ErrorMessage="*" ControlToValidate="txtUserName" 
        ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    </td>
    <td>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
   <td> 
    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="submit" />
    </td>
<td> 
    <asp:Button ID="btnSkip" runat="server" Text="Skip" CssClass="submit" />
    </td>
<td>
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
        CssClass="submit"  />
</td>
</tr>
    </table>
    </fieldset>
    </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/companyadmin/adminmain.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="companyadmin_Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="accountInfo">
<fieldset class="register">
<legend>Payment Options</legend>
<table>
<tr>
<td>
    <asp:RadioButton ID="radiobtnCash" runat="server" Text="Cash" />
</td>
<td>
    <asp:RadioButton ID="radiobtnCreditcard" runat="server" Text="Credit Card" 
        oncheckedchanged="radiobtnCreditcard_CheckedChanged" />
</td>
<td>
    <asp:RadioButton ID="radiobtnDebitcard" runat="server" Text="Debit Card" 
        oncheckedchanged="radiobtnDebitcard_CheckedChanged" />
</td>
</tr>
</table>
<table>
<tr>
<td>
    <asp:Label ID="lblCustomerName" runat="server" Text="Customer Name"></asp:Label>
</td>
<td>
    <asp:DropDownList ID="ddlCustomerName" runat="server">
    </asp:DropDownList>
</td>
</tr>
<tr>
<td>
    <asp:Label ID="lblInvoiceNo" runat="server" Text="Invoice No"></asp:Label>
</td>
<td>
    <asp:DropDownList ID="ddlInvoiceNo" runat="server">
    </asp:DropDownList>
</td>
</tr>
<tr>
<td>
    <asp:Label ID="lblPaidAmount" runat="server" Text="Paid Amount"></asp:Label>
</td>
<td>
    <asp:Label ID="Label4" runat="server" Text=""></asp:Label></td>
</tr>
<tr>
<td>
    <asp:Label ID="lblPaymentDate" runat="server" Text="Payment Date"></asp:Label>
</td>
<td>
    <asp:TextBox ID="txtPaymentDate" runat="server"></asp:TextBox></td>
</tr>
<tr>
<td>
    <asp:Label ID="lblCardno" runat="server" Text="Card No" Visible="false"></asp:Label>
</td>
<td>
    <asp:TextBox ID="txtCardno" runat="server" Visible="false"></asp:TextBox></td>
</tr>
<tr>
<td>
    <asp:Label ID="lblComment" runat="server" Text="Commment"></asp:Label>
</td>
<td>
    <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine"></asp:TextBox></td>
</tr>
<tr>
<td>
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
</td>
<td>
    <asp:Button ID="btnCancell" runat="server" Text="Cancell" />
</td>
</tr>
</table>
</fieldset>
</div>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/companyadmin/adminmain.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="companyadmin_Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHead" Runat="Server">
    <link type="text/css" href="../Css/ui-lightness/jquery-ui-1.8.19.custom.css" rel="stylesheet" />
    <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery-ui-1.8.19.custom.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#MainContent_txtPaymentDate").datepicker({ dateFormat: 'd MM, yy' });
        });
</script>
<style type="text/css">
.ui-datepicker { font-size:8pt !important} 
 </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
   <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <asp:UpdatePanel ID="upItem" runat="server">
     <ContentTemplate>
<h1>Customer Payment</h1>
    <div class="accountInfo">
<fieldset class="register">
<legend>Payment Options</legend>
<table>
<tr>
<td>Payment Method:
</td>
<td>
 <asp:RadioButton ID="radiobtnCash" runat="server" Text="Cash" GroupName="pay" 
        CssClass="check" AutoPostBack="True" 
        oncheckedchanged="radiobtnCash_CheckedChanged" Checked="True" />
    &nbsp;
    <asp:RadioButton ID="radiobtnCreditcard" runat="server" Text="Credit/Debit Card" 
        oncheckedchanged="radiobtnCreditcard_CheckedChanged" GroupName="pay" 
        CssClass="check" AutoPostBack="True" />
</td>
<td>
    &nbsp;</td>
</tr>
</table>
<table>
<tr>

<td>
    <asp:Label ID="lblInvoiceNo" runat="server" Text="Invoice No"></asp:Label>
</td>
<td>
    <asp:DropDownList ID="ddlInvoiceNo" runat="server" 
        onselectedindexchanged="ddlInvoiceNo_SelectedIndexChanged" 
        ValidationGroup="s" AutoPostBack="True">
    </asp:DropDownList>
</td>
<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
        ErrorMessage="*" ControlToValidate="ddlInvoiceNo" 
        ForeColor="Red" ValidationGroup="s" 
        InitialValue="----------Select----------"></asp:RequiredFieldValidator>
            </td>
</tr>
<tr>

<td>
    Customer Name:
</td>
<td>
     <asp:Label ID="lblCustName" runat="server" ></asp:Label>
</td>
<td>
    &nbsp;</td>
</tr>
<tr>

<td>
    Created Date:
</td>
<td>
     <asp:Label ID="lblCreatedDate" runat="server" ></asp:Label>
</td>
<td>
    &nbsp;</td>
</tr>
<tr>
<td>
    Paid Amount :
</td>
<td>
    <h2>Rs. <asp:Label ID="lblPaidAmt" runat="server" Text="0.00"></asp:Label></h2></td>
<td>
    &nbsp;</td>
</tr>
<tr>
<td>
    <asp:Label ID="lblPaymentDate" runat="server" Text="Payment Date"></asp:Label>
</td>
<td>
    <asp:TextBox ID="txtPaymentDate" runat="server" CssClass="text"></asp:TextBox></td>
    <td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
        ErrorMessage="*" ControlToValidate="txtPaymentDate" 
        ForeColor="Red" ValidationGroup="s"></asp:RequiredFieldValidator>
            </td>
</tr>
<tr>
<td>
    <asp:Label ID="lblCardno" runat="server" Text="Card No" Visible="false"></asp:Label>
</td>
<td>
    <asp:TextBox ID="txtCardno" runat="server" Visible="false" CssClass="text"></asp:TextBox></td>
<td>
    &nbsp;</td>
</tr>
<tr>
<td>
    <asp:Label ID="lblComment" runat="server" Text="Commment"></asp:Label>
</td>
<td>
    <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine"></asp:TextBox></td>
<td>
    &nbsp;</td>
</tr>
<tr>
<td>
    &nbsp;</td>
<td>
    <asp:Button ID="btnSubmit" runat="server" Text="Done Payment" CssClass="submit" 
        onclick="btnSubmit_Click" ValidationGroup="s" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnCancell" runat="server" Text="Cancel" CssClass="submit" 
        onclick="btnCancell_Click" />
</td>
<td>
    &nbsp;</td>
</tr>
</table>
</fieldset>
</div>
 </ContentTemplate>
 </asp:UpdatePanel>
</asp:Content>


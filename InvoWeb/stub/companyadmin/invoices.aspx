<%@ Page Title="" Language="C#" MasterPageFile="~/companyadmin/adminmain.master" AutoEventWireup="true" CodeFile="invoices.aspx.cs" Inherits="companyadmin_invoices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
InvoWebStub-[Invoices Management]
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHead" Runat="Server">
 <link type="text/css" href="../Css/ui-lightness/jquery-ui-1.8.19.custom.css" rel="stylesheet" />
    <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery-ui-1.8.19.custom.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#MainContent_txtStartDate").datepicker({ dateFormat: 'd MM, yy' });
            $("#MainContent_txtEndDate").datepicker({ dateFormat: 'd MM, yy' });
        });
</script>
<style type="text/css">
.ui-datepicker { font-size:8pt !important}
</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
<h1>
    Invoice Management
 </h1>
      <div class="accountInfo">
       <fieldset class="register">
    <legend>Invoice Information</legend>

    <asp:Button ID="btnAddInvoice" runat="server" Text=" + Add New Invoice" 
        CssClass="text" onclick="btnAddInvoice_Click"/>
    <br />    <br />
    Invoice Payment:  
    <asp:DropDownList ID="ddlPayment" runat="server" AutoPostBack="True" Width="211px" 
               onselectedindexchanged="ddlPayment_SelectedIndexChanged">
        <asp:ListItem Value="3">All</asp:ListItem>
        <asp:ListItem Value="1">Paid</asp:ListItem>
        <asp:ListItem Value="0">UnPaid</asp:ListItem>
    </asp:DropDownList>
    &nbsp;&nbsp; Invoice Date: 
           <asp:TextBox ID="txtStartDate" runat="server" 
               CssClass="text" Width="160px" Enabled="False"></asp:TextBox> 
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
        ErrorMessage="*" ControlToValidate="txtStartDate" 
        ForeColor="Red" ValidationGroup="s"></asp:RequiredFieldValidator>
           To 
           <asp:TextBox ID="txtEndDate" runat="server" CssClass="text" Width="160px" 
               Enabled="False"></asp:TextBox>
           
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
        ErrorMessage="*" ControlToValidate="txtEndDate" 
        ForeColor="Red" ValidationGroup="s"></asp:RequiredFieldValidator>  
           <asp:Button ID="btnFilter" runat="server" Text=" Filter " CssClass="submit" 
               Enabled="False" onclick="btnFilter_Click" ValidationGroup="s" />

           
    <asp:GridView ID="gvInvoice" runat="server" AutoGenerateColumns="False" 
    CssClass="mGrid" AllowPaging="True" PageSize="15" 
               OnRowCommand = "gvInvoice_InvoiceCommmand" ShowHeaderWhenEmpty="True" 
               onrowdatabound="gvInvoice_RowDataBound" >
        <AlternatingRowStyle CssClass="alt" />
        <Columns>
            <asp:TemplateField HeaderText="Delete">
            <ItemTemplate>
                    <asp:ImageButton ID="IbtnDelect" runat="Server" CommandName="Delete" CommandArgument='<%#Eval("InvoiceId") %>' CssClass="delete_icon"/>
             </ItemTemplate>
            </asp:TemplateField>
           
            <asp:TemplateField HeaderText="InvoiceNo"> <ItemTemplate><asp:Label ID="lbInvoiceNo" runat="server" Text='<%#Eval("InvoiceNo")%>' /></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Customer Name"> <ItemTemplate> <asp:Label ID="lbCustomerName" runat="server" Text='<%#Eval("CustomerName")%>' /></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Created Date"><ItemTemplate><asp:Label ID="lbCreatedDate" runat="server" Text='<%#Eval("CreatedDate", "{0:d MMMM, yyyy}")%>' /></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Net Amount"><ItemTemplate>Rs. <asp:Label ID="lbNetAmount" runat="server" Text='<%#Eval("NetAmount")%>' /></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="SalePerson Name"><ItemTemplate><asp:Label ID="lbSalePersonName" runat="server" Text='<%#Eval("SalePersonName")%>' /></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Payment Status">
            <ItemTemplate>
                 <asp:Image ID="ImagePaidStatus" runat="server" ImageUrl='<%# "~/Img/" + Eval("PaymentStatus") + "Paid.png" %>' />
             </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Payment">
            <ItemTemplate>
                  <asp:HiddenField ID="hfstatus" runat="server" Value='<%# Eval("PaymentStatus") %>' />
                  <asp:Button ID="btnPayment" runat="server" CommandName="Payment" CommandArgument='<%#Eval("InvoiceId") %>' Text=" Do Payment " Enabled="False" /> 
            </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                     <asp:Button ID="btnView" runat="server" CommandName="View" CommandArgument='<%#Eval("InvoiceId") %>' Text=" View "/>
            </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
           <h2>No Invoice Data Found Yet..!</h2>
        </EmptyDataTemplate>
        <PagerStyle CssClass="pgr" />

 </asp:GridView>
    </fieldset>
</div>
</asp:Content>


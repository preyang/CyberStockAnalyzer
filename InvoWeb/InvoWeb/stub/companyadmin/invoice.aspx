<%@ Page Title="" Language="C#" MasterPageFile="~/companyadmin/adminmain.master" AutoEventWireup="true" CodeFile="invoice.aspx.cs" Inherits="companyadmin_invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
InvoWebStub-Invoice
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHead" Runat="Server">

  <link type="text/css" href="../Css/ui-lightness/jquery-ui-1.8.19.custom.css" rel="stylesheet" />
    <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery-ui-1.8.19.custom.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#MainContent_txtDate").datepicker({ dateFormat: 'd MM, yy' });
        });
</script>
<style type="text/css">
.ui-datepicker { font-size:8pt !important}
    .style1
    {
        width: 571px;
    }
    .style2
    {
        width: 462px;
    }
    .style8
    {
        width: 147px;
    }
    .style10
    {
        width: 312px;
    }
    .style11
    {
        width: 127px;
    }
    .style12
    {
        width: 62px;
    }
    .style13
    {
        width: 135px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
  <h1>
    Invoice Management
 </h1>

 <div class="accountInfo">
    <fieldset class="register">
    <legend>Invoice Information</legend>

    <table width="100%">
        <tr>
        <td>
            <asp:Label ID="lblCompName" runat="server" ForeColor="#3399FF" 
                Font-Size="XX-Large" Font-Bold="True"></asp:Label>
            <br />
            <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label><br />
            Mobile No:<asp:Label ID="lblMobileNo" runat="server" Text=""></asp:Label>&nbsp;
            Email-ID:<asp:Label ID="lblEmailID" runat="server"></asp:Label>
           
        </td>
        <td align="right">
            <asp:Image ID="imgLogo" runat="server" Height="105px" Width="105px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
        </tr>
    </table>
    <hr size="1" style="color: #CCCCCC; font-size: 1px;" />
    <table width="100%">
        <tr>
        <td height="1px" class="style1">
         <h3>Invoice To:</h3>
         Customer Name:&nbsp;&nbsp;<asp:TextBox ID="txtCustName" 
                runat="server"/>&nbsp;&nbsp;&nbsp;&nbsp; Mobile No:&nbsp;&nbsp;<asp:TextBox ID="txtCustName0" 
                runat="server"/><br /><br />
         Address :&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:TextBox ID="txtCustAddress" 
                runat="server" Height="41px" />&nbsp;&nbsp;&nbsp;&nbsp; Email-ID:&nbsp;&nbsp;&nbsp; 
            &nbsp;<asp:TextBox ID="txtCustName1" 
                runat="server"/><br />

        </td>
        <td>
           <h3>Invoice No:</h3>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;  
           <asp:Label ID="lblPrefix" runat="server"></asp:Label>-
            <asp:TextBox ID="txtInvoiceNo" runat="server"/><br /><br />
         <div class="demo">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Date:&nbsp; <asp:TextBox ID="txtDate" runat="server"/>
          </div>
        </td>
        </tr>
    </table>
     <hr size="1" style="color: #CCCCCC; font-size: 1px;" />
     <table class="mGrid">
     <tr><th class="style8">Product Name</th>
    <th class="style10">Product Description</th>
    <th class="style11">Unit Price</th>
    <th class="style12">Quantity</th>
    <th class="style13">Amount</th>
    <th>Action</th></tr>
     </table>
     <hr size="1" style="color: #CCCCCC; font-size: 1px;" />
   <asp:GridView ID="gvItem" runat="server" AutoGenerateColumns="False" 
    CssClass="mGrid" ShowHeader="False" >
        <AlternatingRowStyle CssClass="alt" />
        <Columns>
            <asp:TemplateField HeaderText="Product Name" ControlStyle-CssClass="style8"> <ItemTemplate> <asp:Label ID="lbItemName" runat="server" Text='<%#Eval("ItemName")%>' /></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Product Description" ControlStyle-CssClass="style10"> <ItemTemplate> <asp:Label ID="lbItemDesc" runat="server" Text='<%#Eval("ItemDesc")%>' /></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Unit Price" ControlStyle-CssClass="style11"><ItemTemplate>Rs. <asp:Label ID="lbUnitPrice" runat="server" Text='<%#Eval("UnitPrice")%>' /></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Quantity" ControlStyle-CssClass="style12"><ItemTemplate><asp:Label ID="lbQuantity" runat="server" Text='<%#Eval("Quantity")%>' /></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Amount" ControlStyle-CssClass="style13"><ItemTemplate>Rs. <asp:Label ID="lbAmount" runat="server" Text='<%#Eval("Amount")%>' /></ItemTemplate></asp:TemplateField>       
            <asp:TemplateField HeaderText="Action" >
            <ItemTemplate>
                    <asp:ImageButton ID="IbtnDelect" runat="Server" CommandName="Delete" CommandArgument='<%#Eval("ItemId") %>' CssClass="delete_icon"/>&nbsp;&nbsp;
                   <asp:ImageButton ID="IbtnEdit" runat="Server"  CommandName="Edit" CommandArgument='<%#Eval("ItemId") %>' CssClass="edit_icon"/>&nbsp;&nbsp;
             </ItemTemplate>
             </asp:TemplateField>
        </Columns>
         <EmptyDataTemplate>
        </EmptyDataTemplate>
 </asp:GridView>
     <br />

     <hr size="1" style="color: #CCCCCC; font-size: 1px;" />
     <asp:HiddenField ID="hItemid" runat="server" /> 
        <asp:DropDownList ID="ddlItemName" runat="server" Width="117px" 
            AutoPostBack="True" 
            onselectedindexchanged="ddlItemName_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:TextBox ID="txtItemDesc" runat="server" CssClass="text" Width="213px"></asp:TextBox>
        <asp:TextBox ID="txtUnitPrice" runat="server" CssClass="text" Width="153px" 
            AutoPostBack="True"></asp:TextBox>
        <asp:TextBox ID="txtQuantity" runat="server" CssClass="text" Width="104px" 
            AutoPostBack="True">1</asp:TextBox>
        <asp:TextBox ID="txtAmount" runat="server" CssClass="text" Width="134px" 
            Enabled="False"></asp:TextBox>
        <asp:Button ID="btnAdd" runat="server" Text="ADD NEW" CssClass="submit" 
            onclick="btnAdd_Click" />
        <br />
    

     <hr size="1" style="color: #CCCCCC; font-size: 1px;" />
      <table width="100%">
        <tr>
        <td class="style2">
            Comment/Note :<br />
            <asp:TextBox ID="txtComment" 
                runat="server" Height="104px" Width="345px" />&nbsp;&nbsp;&nbsp;<br />
            <br />
            &nbsp;Payment Status:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:DropDownList 
                ID="ddlPaymentStatus" runat="server" Width="153px" AutoPostBack="True" 
                onselectedindexchanged="ddlPaymentStatus_SelectedIndexChanged">
             <asp:ListItem Value="1">Paid</asp:ListItem>
            <asp:ListItem Value="0">UnPaid</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Payment Method:&nbsp;&nbsp;&nbsp; &nbsp;<asp:DropDownList 
                ID="ddlPaymentMethod" runat="server" 
                Width="153px" AutoPostBack="True" 
                onselectedindexchanged="ddlPaymentMethod_SelectedIndexChanged" >
             <asp:ListItem Value="1">Cash</asp:ListItem>
            <asp:ListItem Value="0">Credit/Debit Card</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="lblCardNo" runat="server" Text="Credit/Debit Card No:"></asp:Label>&nbsp;
            <asp:TextBox ID="txtCardNo" 
                runat="server" Enabled="False"/>  <br />
            <br />
            <asp:Label ID="lblSalePerson" runat="server" Text="Sale Person Name:"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtSalePerson" 
                runat="server"/>
        </td>
        <td >
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Sub Total:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
             Rs.&nbsp; <asp:Label ID="lblSubTotal" runat="server" Text="0.00"></asp:Label>&nbsp;<br />
             <br />  
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Tax 1:&nbsp; <asp:DropDownList ID="ddlTax1" 
                 runat="server" Width="76px" AutoPostBack="True">
           

            </asp:DropDownList>
             &nbsp;&nbsp; <asp:Label ID="lblTax1" runat="server">0.00</asp:Label>&nbsp;%&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
             &nbsp;<br />    
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;Tax 2:&nbsp;&nbsp;<asp:DropDownList 
                 ID="ddlTax2" runat="server" 
                 Width="76px" AutoPostBack="True">
        
            </asp:DropDownList>
             &nbsp;&nbsp; <asp:Label ID="lblTax2" runat="server">0.00</asp:Label>&nbsp;%&nbsp;&nbsp;<br />   <br />              
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
             &nbsp;Discount:&nbsp;&nbsp;<asp:TextBox ID="txtDiscount" 
                runat="server"/>&nbsp;%&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />     <br />
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Addition Charge:&nbsp;Rs.&nbsp;   <asp:TextBox ID="txtAddCharge" 
                runat="server"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
             <br />
             <br />
             <br />
             <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Total Amount:&nbsp;Rs. <asp:Label ID="lblTotalPrice" runat="server">0.00</asp:Label>
                 &nbsp;&nbsp;&nbsp;
             </h1> 
        </td>
        </tr>
        <tr>
        <td class="style2">
            &nbsp;</td>
        <td >
             &nbsp;</td>
        </tr>
    </table>

 </fieldset>
</div>  

<div class="accountInfo">
    <fieldset class="register">
    <legend>Invoice Control</legend>
       <table align="center" width="100%">
        <tr>
        <td>
        <asp:Button ID="btnPrint" runat="server" Text="PRINT INVOICE" CssClass="submit" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnPdf" runat="server" Text="PDF INVOICE" CssClass="submit" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnEmail" runat="server" Text="SEND EMAIL" CssClass="submit" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSave" runat="server" Text="SAVE INVOICE" CssClass="submit" />
        </td>
        </tr>
        </table>
    </fieldset>
</div>
    
</asp:Content>


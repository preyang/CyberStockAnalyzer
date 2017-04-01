<%@ Page Title="" Language="C#" MasterPageFile="~/companyadmin/adminmain.master" AutoEventWireup="true" CodeFile="InvoiceView.aspx.cs" Inherits="companyadmin_InvoiceView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
InvoWebStub-Invoice View
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHead" Runat="Server">
 <script type="text/javascript">
        function printPartOfPage(elementId) {
            var printContent = document.getElementById(elementId);
            var printWindow = window.open('invoice', '', 'width=1000');
            printWindow.document.writeln('<!DOCTYPE html>');
            printWindow.document.writeln('<html><head><title>Print</title>');
            printWindow.document.writeln('<link rel="stylesheet" type="text/css" href="../css/MainStyle.css" media="print">');
            printWindow.document.writeln('</head><body onload="window.print();return false;">');
            printWindow.document.writeln(printContent.outerHTML);
            printWindow.document.writeln('</body></html>');
            printWindow.document.close();
            printWindow.location.href = "#";
            printWindow.focus();
        }
</script>
  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">

 <div class="accountInfo">
    <fieldset class="register">
    <legend>Invoice Management</legend>
<div id="print">
    <asp:Panel ID="PnlInvoice" runat="server">

    <table width="100%">
        <tr>
        <td>
            &nbsp;&nbsp;&nbsp;<asp:Label ID="lblCompName" 
                runat="server" ForeColor="#3399FF" 
               Font-Bold="True" Style="font-variant: small-caps;" Font-Size="XX-Large" ></asp:Label><br />
           &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblAddress" runat="server" Text=""></asp:Label><br />
            &nbsp;&nbsp;&nbsp;&nbsp;Mobile No:&nbsp;<asp:Label ID="lblMobileNo" runat="server" Text=""></asp:Label>&nbsp;
            Email-ID:&nbsp;<asp:Label ID="lblEmailID" runat="server"></asp:Label>
           
            <br />
            <br />
           
        </td>
        <td align="right">
                <asp:Image ID="imgLogo" runat="server" Height="105px" Width="105px" 
                ImageUrl="~/Img/default_image.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        </td>
        </tr>
    </table>
    <hr size="1" style="color: #CCCCCC;" />
     <table width="100%">
        <tr>
        <td width="612px">
         <h3>&nbsp;&nbsp;&nbsp;&nbsp;Invoice To:</h3>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Customer Name:&nbsp;<asp:Label ID="lblCustName" runat="server" Text=""></asp:Label><br />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblCustAddress" runat="server" Text=""></asp:Label><br />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mobile No:&nbsp; <asp:Label ID="lblCustMobileNo" runat="server" Text=""></asp:Label><br />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email-ID:&nbsp; <asp:Label ID="lblCustEmail" runat="server" Text=""></asp:Label><br />
        </td>
        <td width="35%"><br />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Invoice No:&nbsp; <asp:Label ID="lblInvoiceNo" runat="server" Text=""></asp:Label><br />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Invoice Date:&nbsp; <asp:Label ID="lblInvoiceDate" runat="server" Text=""></asp:Label><br />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Payment Status:&nbsp; <asp:Label ID="lblPaymentStatus" runat="server" Text=""></asp:Label><br />
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                ID="lblPayDateName" runat="server" Visible="False" Text="Payment Date :"></asp:Label>&nbsp;<asp:Label 
                ID="lblPayDate" runat="server" Visible="False"></asp:Label>
        </td>
        </tr>
    </table>
   <asp:GridView ID="gvItem" runat="server" AutoGenerateColumns="False" 
    CssClass="mGrid"  
            ShowHeaderWhenEmpty="True" Width="100%" HorizontalAlign="Center">
        <AlternatingRowStyle CssClass="alt" />
        <Columns>
            <asp:TemplateField HeaderText="Product Name"> <ItemTemplate> <asp:Label ID="lbItemName" runat="server" Text='<%#Eval("ItemName")%>' /></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Product Description"> <ItemTemplate> <asp:Label ID="lbItemDesc" runat="server" Text='<%#Eval("ItemDesc")%>' /></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Unit Price"><ItemTemplate>Rs. <asp:Label ID="lbUnitPrice" runat="server" Text='<%#Eval("UnitRate")%>' /></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Quantity"><ItemTemplate><asp:Label ID="lbQuantity" runat="server" Text='<%#Eval("Quantity")%>' /></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Amount"><ItemTemplate>Rs. <asp:Label ID="lbAmount" runat="server" Text='<%#Eval("Amount")%>' /></ItemTemplate></asp:TemplateField>       
           
        </Columns>
         <EmptyDataTemplate>
         No Item Yet..
        </EmptyDataTemplate>
 </asp:GridView>
      <table width="100%">
        <tr>
        <td width="525px">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SalePerson Name:&nbsp; <asp:Label ID="lblSalePersonName" runat="server"></asp:Label><br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                ID="lblPaymentMethodName" runat="server" Visible="False" Text="Payment Method :"></asp:Label>&nbsp;<asp:Label 
                ID="lblPaymentMethod" runat="server" Visible="False"></asp:Label><br />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                ID="lblCardName" runat="server" Text="Credit/Debit Card No:" Visible="False"></asp:Label>&nbsp;<asp:Label 
                ID="lblCardNo" runat="server" Visible="False"></asp:Label><br />
         <br /><br />
        </td>
        <td align="right" width="220px">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SubTotal(Rs.):<br />
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDiscountName" runat="server" Text="Discount(%) :"></asp:Label><br />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblAdditionChargeName" runat="server" Text="Addition Charge(Rs.):"></asp:Label><br /> 
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblTaxName1" runat="server" Text=""></asp:Label><br />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblTaxName2" runat="server" Text=""></asp:Label>
        </td>
        <td  width="15%">
        <asp:Label ID="lblSubTotal" runat="server" Text=""></asp:Label> <br />
        <asp:Label ID="lblDiscount" runat="server" Text=""></asp:Label><br />
        <asp:Label ID="lblAdditionCharge" runat="server" Text=""></asp:Label><br />
        <asp:Label ID="lblTaxRate1" runat="server" Text=""></asp:Label><br />
        <asp:Label ID="lblTaxRate2" runat="server" Text=""></asp:Label><br />
        </td>
        </tr>
    </table>
     <hr size="1" style="color: #CCCCCC; " />
      <table width="100%">
        <tr>
        <td align="right"><h3>Total Amount:&nbsp;Rs.<asp:Label ID="lblTotalAmount" runat="server" Text=""></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3></td>
        </tr>
      </table>
     <hr size="1" style="color: #CCCCCC; " />
      <asp:Label ID="lblNote" runat="server" Text="Notes:"></asp:Label>&nbsp; <asp:Label ID="lblComment" runat="server" Text=""></asp:Label>
     <Center>InvoiceDesign By <a href="#">Cyber Stock Analyzer</a></Center>
    </asp:Panel>
 </div>
     </fieldset>
</div>  


 <div class="accountInfo">
    <fieldset class="register">
    <legend>Invoice Control</legend>
       <table width="100%">
        <tr>
        <td align="center">
        <asp:Button ID="btnPrint" runat="server" Text="PRINT INVOICE" CssClass="submit" 
                 ValidationGroup="s" 
                onclientclick="javascript:printPartOfPage('print');return false;"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnEmail" runat="server" Text="SEND EMAIL INVOICE" CssClass="submit" 
               ValidationGroup="s" onclick="btnEmail_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <!--   <asp:Button ID="btnPdf" runat="server" Text="EXPORT PDF INVOICE" CssClass="submit" 
               ValidationGroup="s"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
        <asp:Button ID="btnSave" runat="server" Text="CANCEL" CssClass="submit" 
               ValidationGroup="s" onclick="btnSave_Click" />
        </td>
        </tr>
        </table>

    </fieldset>
</div>
 

</asp:Content>


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
        width: 575px;
    }
    .style2
    {
        width: 462px;
    }
  
   
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
  <h1>
    Invoice Management
 </h1>

 <div id="accountInfo" class="accountInfo">
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
           
            <br />
            <br />
           
        </td>
        <td align="right">
            <asp:Image ID="imgLogo" runat="server" Height="105px" Width="105px" 
                BorderColor="#0099FF" BorderStyle="Solid" BorderWidth="1px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
        </tr>
    </table>
    <hr size="1" style="color: #CCCCCC; font-size: 1px;" />
    <table width="100%">
        <tr>
        <td height="1px" class="style1">
         <h3>Invoice To:</h3>
         Customer Name:&nbsp;&nbsp;<asp:TextBox ID="txtCustName" 
                runat="server" CssClass="text" Width="166px"/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
        ErrorMessage="*" ControlToValidate="txtCustName" 
        ForeColor="Red" ValidationGroup="s"></asp:RequiredFieldValidator>
            &nbsp;&nbsp;Mobile No:&nbsp;&nbsp;<asp:TextBox ID="txtCustMobile" 
                runat="server" CssClass="text" Width="166px" MaxLength="10"/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
        ErrorMessage="*" ControlToValidate="txtCustMobile" 
        ForeColor="Red" ValidationGroup="s"></asp:RequiredFieldValidator>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ErrorMessage="Please Enter Valid Email-Id" ControlToValidate="txtCustEmail" 
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
        ForeColor="Red"></asp:RegularExpressionValidator>
        <br />
         Address :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            Email-ID:&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="txtCustEmail" 
                runat="server" CssClass="text" Width="166px"/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
        ErrorMessage="*" ControlToValidate="txtCustEmail" 
        ForeColor="Red" ValidationGroup="s"></asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="txtCustAddress" 
                runat="server" Height="60px" TextMode="MultiLine" Width="278px" />&nbsp;<asp:RequiredFieldValidator 
                ID="RequiredFieldValidator7" runat="server" 
        ErrorMessage="*" ControlToValidate="txtCustAddress" 
        ForeColor="Red" ValidationGroup="s"></asp:RequiredFieldValidator>
            &nbsp;&nbsp;&nbsp; 
            <br />

        </td>
        <td>
           <h3>Invoice No:
    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" 
        ErrorMessage="Already exist..." ForeColor="Red" 
        onservervalidate="CustomValidator1_ServerValidate" ControlToValidate="txtInvoiceNo" 
                   ValidationGroup="s" SetFocusOnError="True"></asp:CustomValidator>
            </h3>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
           <asp:Label ID="lblPrefix" runat="server"></asp:Label>&nbsp; 
            <asp:TextBox ID="txtInvoiceNo" runat="server" CssClass="text" Width="166px" 
                MaxLength="8" ValidationGroup="s">00000000</asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
        ErrorMessage="*" ControlToValidate="txtInvoiceNo" 
        ForeColor="Red" ValidationGroup="s"></asp:RequiredFieldValidator>
            <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3"
        runat="server" ErrorMessage="Only numeric characters.." 
        ValidationExpression="^(-)?\d+(\.\d\d)?$" ControlToValidate="txtInvoiceNo" 
        ForeColor="Red" ValidationGroup="s"></asp:RegularExpressionValidator>
                <div class="demo">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date:&nbsp; 
             <asp:TextBox ID="txtDate" runat="server" CssClass="text" Width="166px"/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
        ErrorMessage="*" ControlToValidate="txtDate" 
        ForeColor="Red" ValidationGroup="s"></asp:RequiredFieldValidator>
             <br />
             <br />
             <br />
             <br />
          </div>
        </td>
        </tr>
    </table>
    
     <hr size="1" style="color: #CCCCCC; font-size: 1px;" />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <asp:UpdatePanel ID="upItem" runat="server">
     <ContentTemplate>
   <asp:GridView ID="gvItem" runat="server" AutoGenerateColumns="False" 
    CssClass="mGrid"  
            onrowdeleting="gvItem_RowDeleting" ShowHeaderWhenEmpty="True">
        <AlternatingRowStyle CssClass="alt" />
        <Columns>
            <asp:TemplateField HeaderText="Product Name"> <ItemTemplate> <asp:Label ID="lbItemName" runat="server" Text='<%#Eval("ItemName")%>' /></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Product Description"> <ItemTemplate> <asp:Label ID="lbItemDesc" runat="server" Text='<%#Eval("ItemDesc")%>' /></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Unit Price"><ItemTemplate>Rs. <asp:Label ID="lbUnitPrice" runat="server" Text='<%#Eval("UnitRate")%>' /></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Quantity"><ItemTemplate><asp:Label ID="lbQuantity" runat="server" Text='<%#Eval("Quantity")%>' /></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Amount"><ItemTemplate>Rs. <asp:Label ID="lbAmount" runat="server" Text='<%#Eval("Amount")%>' /></ItemTemplate></asp:TemplateField>       
            <asp:TemplateField HeaderText="Action" >
            <ItemTemplate>
                    <asp:ImageButton ID="IbtnDelect" runat="Server" CommandName="Delete" CssClass="delete_icon"/>&nbsp;&nbsp;
             </ItemTemplate>
             </asp:TemplateField>
        </Columns>
         <EmptyDataTemplate>
         No Item Yet..
        </EmptyDataTemplate>
 </asp:GridView>
     <br />  
     </ContentTemplate>
     </asp:UpdatePanel>
     <hr size="1" style="color: #CCCCCC; font-size: 1px;" />
     <asp:Panel ID="pnlItemAdd" runat="server">
      <asp:UpdatePanel ID="udAddItem" runat="server">
     <ContentTemplate>
     <table width="100%">
     <tr><td><asp:HiddenField ID="hItemTax" runat="server" />Product Name:<br/>
        <asp:DropDownList ID="ddlItemName" runat="server" Width="117px" 
            AutoPostBack="True" 
            onselectedindexchanged="ddlItemName_SelectedIndexChanged">
        </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
        ErrorMessage="*" ControlToValidate="ddlItemName" 
        ForeColor="Red" InitialValue="----SELECT----" ValidationGroup="i"></asp:RequiredFieldValidator>
         <br />
         <br />
         </td>
        <td>Product Description:<br />
        <asp:TextBox ID="txtItemDesc" runat="server" CssClass="text" Width="207px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
        ErrorMessage="*" ControlToValidate="txtItemDesc" 
        ForeColor="Red" ValidationGroup="i"></asp:RequiredFieldValidator><br />
         </td>
        <td>Unit Price: <br/>
            <asp:TextBox ID="txtUnitPrice" runat="server" CssClass="text" Width="153px" 
            AutoPostBack="True" ontextchanged="txtUnitPrice_TextChanged" MaxLength="10"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
        ErrorMessage="*" ControlToValidate="txtUnitPrice" 
        ForeColor="Red" ValidationGroup="i"></asp:RequiredFieldValidator>
            <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4"
        runat="server" ErrorMessage="Only numeric characters.." 
        ValidationExpression="^(-)?\d+(\.\d\d)?$" ControlToValidate="txtUnitPrice" 
        ForeColor="Red" ValidationGroup="i"></asp:RegularExpressionValidator>
                </td>
        <td>Quantity: <br />
            <asp:TextBox ID="txtQuantity" runat="server" CssClass="text" Width="104px" 
            AutoPostBack="True" ontextchanged="txtQuantity_TextChanged" MaxLength="3">1</asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
        ErrorMessage="*" ControlToValidate="txtQuantity" 
        ForeColor="Red" ValidationGroup="i"></asp:RequiredFieldValidator>
            <br />
            <br />
         </td>
        <td>Amount : <br /><asp:TextBox ID="txtAmount" runat="server" CssClass="text" Width="134px" 
            Enabled="False"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
        ErrorMessage="*" ControlToValidate="txtAmount" 
        ForeColor="Red" ValidationGroup="i"></asp:RequiredFieldValidator>
            <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5"
        runat="server" ErrorMessage="Only numeric characters.." 
        ValidationExpression="^(-)?\d+(\.\d\d)?$" ControlToValidate="txtAmount" 
        ForeColor="Red" ValidationGroup="i"></asp:RegularExpressionValidator>
                </td>
     </tr>
     <tr>
        <td align="right" colspan="5">
            <asp:Button ID="btnAdd" runat="server" Text="ADD NEW" CssClass="submit" 
            onclick="btnAdd_Click" ValidationGroup="i" /></td>
     </tr>     
    </table>
    </ContentTemplate>
     </asp:UpdatePanel>
 </asp:Panel>
     <hr size="1" style="color: #CCCCCC; font-size: 1px;" />
      <asp:UpdatePanel ID="uplast" runat="server">
     <ContentTemplate>
      <table width="100%">
        <tr>
        <td class="style2">
            Comment/Note :<br />
            <asp:TextBox ID="txtComment" 
                runat="server" Height="60px" Width="282px" TextMode="MultiLine" />&nbsp;&nbsp;<asp:RequiredFieldValidator 
                ID="RequiredFieldValidator17" runat="server" 
        ErrorMessage="*" ControlToValidate="txtComment" 
        ForeColor="Red" ValidationGroup="s"></asp:RequiredFieldValidator>
            &nbsp;<br />
            <br />
            &nbsp;Payment Status:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:DropDownList 
                ID="ddlPaymentStatus" runat="server" Width="153px" AutoPostBack="True" 
                onselectedindexchanged="ddlPaymentStatus_SelectedIndexChanged">
             <asp:ListItem Value="1">Paid</asp:ListItem>
            <asp:ListItem Value="0">UnPaid</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Payment Method:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:DropDownList 
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
                runat="server" Enabled="False" CssClass="text" Width="166px" 
                EnableTheming="True"/>  <br />
            <br />
            <asp:Label ID="lblSalePerson" runat="server" Text="Sale Person Name:"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtSalePerson" 
                runat="server" CssClass="text" Width="166px"/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
        ErrorMessage="*" ControlToValidate="txtSalePerson" 
        ForeColor="Red" ValidationGroup="s"></asp:RequiredFieldValidator>
        </td>
        <td >
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Sub Total:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
             Rs.&nbsp; <asp:Label ID="lblSubTotal" runat="server" Text="0.00"></asp:Label>&nbsp;<br />
             <br />  
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Tax 1:&nbsp; <asp:DropDownList ID="ddlTax1" 
                 runat="server" Width="76px" AutoPostBack="True" 
                 onselectedindexchanged="ddlTax1_SelectedIndexChanged">
           

            </asp:DropDownList>
             &nbsp;&nbsp; <asp:Label ID="lblTax1" runat="server">0.00</asp:Label>&nbsp;%&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
             &nbsp;<br />    
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;Tax 2:&nbsp;&nbsp;<asp:DropDownList 
                 ID="ddlTax2" runat="server" 
                 Width="76px" AutoPostBack="True" 
                 onselectedindexchanged="ddlTax2_SelectedIndexChanged">
        
            </asp:DropDownList>
             &nbsp;&nbsp; <asp:Label ID="lblTax2" runat="server">0.00</asp:Label>&nbsp;%&nbsp;&nbsp;<br />   <br />              
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Discount:&nbsp;&nbsp;<asp:TextBox ID="txtDiscount" 
                runat="server" CssClass="text" Width="166px" AutoPostBack="True" 
                 ontextchanged="txtDiscount_TextChanged" MaxLength="6">0.00</asp:TextBox>
             &nbsp;%&nbsp;&nbsp;&nbsp;&nbsp;<br />
             &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:RegularExpressionValidator ID="RegularExpressionValidator6"
        runat="server" ErrorMessage="Only numeric characters.." 
        ValidationExpression="^(-)?\d+(\.\d\d)?$" ControlToValidate="txtDiscount" 
        ForeColor="Red" ValidationGroup="s"></asp:RegularExpressionValidator>
                <br />
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Addition Charge:&nbsp;Rs.&nbsp;   
             <asp:TextBox ID="txtAddCharge" 
                runat="server" CssClass="text" Width="166px" AutoPostBack="True" 
                 ontextchanged="txtAddCharge_TextChanged" MaxLength="6">0.00</asp:TextBox>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:RegularExpressionValidator ID="RegularExpressionValidator7"
        runat="server" ErrorMessage="Only numeric characters.." 
        ValidationExpression="^(-)?\d+(\.\d\d)?$" ControlToValidate="txtAddCharge" 
        ForeColor="Red" ValidationGroup="s"></asp:RegularExpressionValidator>
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
   </ContentTemplate>
     </asp:UpdatePanel>
 </fieldset>
</div>  

<div class="accountInfo">
    <fieldset class="register">
    <legend>Invoice Control</legend>
       <table width="100%">
        <tr>
        <td align="center">
          <asp:UpdatePanel ID="upBtn" runat="server">
        <ContentTemplate>
        <asp:Button ID="btnSave" runat="server" Text="SAVE INVOICE" CssClass="submit" 
                Enabled="False" onclick="btnSave_Click" ValidationGroup="s" />
                </ContentTemplate></asp:UpdatePanel>
        </td>
        </tr>
        </table>
    </fieldset>
</div>
     
</asp:Content>


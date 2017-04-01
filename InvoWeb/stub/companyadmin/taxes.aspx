<%@ Page Title="" Language="C#" MasterPageFile="~/companyadmin/adminmain.master" AutoEventWireup="true" CodeFile="taxes.aspx.cs" Inherits="companyadmin_taxes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
InvoWebStub-Tax Management
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
 <h1>
    Tax Management
 </h1>
 <div class="accountInfo">
<fieldset class="register">
    <legend>Tax Information</legend>

    <asp:Button ID="btnAddTax" runat="server" Text=" + Add New Tax" 
        CssClass="text" onclick="btnAddTax_Click" />

 <asp:GridView ID="gvTax" runat="server" AutoGenerateColumns="False" 
    CssClass="mGrid" AllowPaging="True" PageSize="10" OnRowCommand = "gvTax_ItemCommmand" ShowHeaderWhenEmpty="True">
        <AlternatingRowStyle CssClass="alt" />
        <Columns>
            <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                    <asp:ImageButton ID="IbtnDelect" runat="Server" CommandName="Delete" CommandArgument='<%#Eval("TaxId") %>' CssClass="delete_icon" ToolTip="Delete Tax" />&nbsp;&nbsp;&nbsp;
                   <asp:ImageButton ID="IbtnEdit" runat="Server"  CommandName="Edit" CommandArgument='<%#Eval("TaxId") %>' CssClass="edit_icon" ToolTip="Edit Tax"/>
               </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tax No"> <ItemTemplate> <%#Container.DataItemIndex+1%></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Tax Name"> <ItemTemplate> <asp:Label ID="lbTaxName" runat="server" Text='<%#Eval("TaxName")%>' /></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Tax Rate"><ItemTemplate><asp:Label ID="lbTaxRate" runat="server" Text='<%#Eval("TaxRate")%>' /> %</ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Tax Description"><ItemTemplate><asp:Label ID="lbTaxDesc" runat="server" Text='<%#Eval("TaxDesc")%>' /></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Tax Status">
            <ItemTemplate>
                <asp:Image ID="ImageTaxStatus" runat="server" ImageUrl='<%# "~/Img/" + Eval("TaxStatus") + ".png" %>' />
            </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
           <h2>No Tax Data Found..!</h2>
        </EmptyDataTemplate>
        <PagerStyle CssClass="pgr" />

 </asp:GridView>
</fieldset> 
</div>
</asp:Content>


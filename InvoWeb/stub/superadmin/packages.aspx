<%@ Page Title="" Language="C#" MasterPageFile="~/superadmin/supermain.master" AutoEventWireup="true" CodeFile="packages.aspx.cs" Inherits="superadmin_packages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
InvoWebStub-Package Management
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
 <h1>
    Package Management
 </h1>
<div class="accountInfo">
<fieldset class="register">
<legend>Package Infomation</legend>

 <asp:Button ID="btnAddPack" runat="server" Text=" + Add New Package" 
        CssClass="text" onclick="btnAddPack_Click" />

 <asp:GridView ID="gvPackage" runat="server" CssClass="mGrid" AllowPaging="True" 
        PageSize="10" AutoGenerateColumns="False" OnRowCommand = "gvPack_ItemCommmand" ShowHeaderWhenEmpty="True">
         <AlternatingRowStyle CssClass="alt" />
        <Columns>
            <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                   <asp:ImageButton ID="IbtnDelect" runat="Server" CommandName="Delete" CommandArgument='<%#Eval("PackageId") %>' CssClass="delete_icon" ToolTip="Delete Package" />&nbsp;&nbsp;&nbsp;
                   <asp:ImageButton ID="IbtnEdit" runat="Server"  CommandName="Edit" CommandArgument='<%#Eval("PackageId") %>' CssClass="edit_icon" ToolTip="Edit Package"/>
            </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="No"> <ItemTemplate> <%#Container.DataItemIndex+1%></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Package Name"><ItemTemplate><%#Eval("PackageName")%></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Duration/Days"><ItemTemplate> <%#Eval("PackageDuration")%></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="No Of Invoice"><ItemTemplate> <%#Eval("NoOfInvoice")%></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="No Of Product"><ItemTemplate> <%#Eval("NoOfItem")%></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Price"><ItemTemplate>Rs.<%#Eval("Price")%></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Term"><ItemTemplate><%#Eval("Term")%></ItemTemplate></asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
           <h2>No Package Data Found..!</h2>
        </EmptyDataTemplate>
        <PagerStyle CssClass="pgr" />
    </asp:GridView>
</fieldset>
</div>
</asp:Content>


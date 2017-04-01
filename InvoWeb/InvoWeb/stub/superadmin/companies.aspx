<%@ Page Title="" Language="C#" MasterPageFile="~/superadmin/supermain.master" AutoEventWireup="true" CodeFile="companies.aspx.cs" Inherits="superadmin_companies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
InvoWebStub-Companies Management
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
<h1>
   Companies Management
 </h1>
 <div class="rightseacrh">
 <table>
<tr align="right">
<td>
   <asp:TextBox ID="txtSearch" runat="server" CssClass="text">Search Text..</asp:TextBox></td>
 <td><asp:Button ID="btnSearch" runat="server" Text="Search" 
        CssClass="submit" onclick="btnSearch_Click" /></td>
</tr></table>
</div>
<div class="accountInfo">
<fieldset class="register">
<legend>Companies Infomation</legend>

 <asp:GridView ID="gvCompany" runat="server" CssClass="mGrid" AllowPaging="True" 
        PageSize="10" AutoGenerateColumns="False" OnRowCommand = "gvCompany_ItemCommmand" ShowHeaderWhenEmpty="True">
         <AlternatingRowStyle CssClass="alt" />
        <Columns>
            <asp:TemplateField HeaderText="Delete">
            <ItemTemplate>
                   <asp:ImageButton ID="IbtnDelect" runat="Server" CommandName="Delete" CommandArgument='<%#Eval("CompanyId") %>' CssClass="delete_icon" ToolTip="Delete Company" />
             </ItemTemplate>
            </asp:TemplateField> 
            <asp:TemplateField HeaderText="Status">
            <ItemTemplate>
                   <asp:ImageButton ID="IbtnActivee" runat="Server"  CommandName="Active" CommandArgument='<%#Container.DataItemIndex%>' ImageUrl='<%# "~/Img/" + Eval("CompanyStatus") + ".png" %>' ToolTip="Active/Inactive Company"/>
                   <asp:HiddenField ID="hfstatus" Value='<%#Eval("CompanyStatus") %>' runat="server" />
                   <asp:HiddenField ID="hfindex" Value='<%#Eval("CompanyId")%>' runat="server" />
            </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="No"> <ItemTemplate> <%#Container.DataItemIndex+1%></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Company Name"><ItemTemplate><%#Eval("CompanyName")%></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="InvoiceNoPrefix"><ItemTemplate> <%#Eval("InvoiceNoPrefix")%></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Address"><ItemTemplate> <%#Eval("CompAddress")%></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="ContactPersonName"><ItemTemplate> <%#Eval("ContactPersonName")%></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="ContactNo"><ItemTemplate>Rs.<%#Eval("ContactNo")%></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="ContactEmail"><ItemTemplate><%#Eval("ContactEmail")%></ItemTemplate></asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
           <h2>No Company Data Found..!</h2>
        </EmptyDataTemplate>
        <PagerStyle CssClass="pgr" />
    </asp:GridView>
</fieldset>
</div>
</asp:Content>


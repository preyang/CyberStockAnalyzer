<%@ Page Title="" Language="C#" MasterPageFile="~/companyadmin/adminmain.master" AutoEventWireup="true" CodeFile="items.aspx.cs" Inherits="companyadmin_items" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
InvoWebStub-Product Management
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
 <h1>
    Product Management
 </h1>
      <div class="accountInfo">
       <fieldset class="register">
    <legend>Product Information</legend>

    <asp:Button ID="btnAdditem" runat="server" Text=" + Add New Product" 
        CssClass="text" onclick="btnAdditem_Click" />

    <asp:GridView ID="gvItem" runat="server" AutoGenerateColumns="False" 
    CssClass="mGrid" AllowPaging="True" PageSize="15" OnRowCommand = "gvItem_ItemCommmand" ShowHeaderWhenEmpty="True">
        <AlternatingRowStyle CssClass="alt" />
        <Columns>
            <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                    <asp:ImageButton ID="IbtnDelect" runat="Server" CommandName="Delete" CommandArgument='<%#Eval("ItemId") %>' CssClass="delete_icon"/>&nbsp;&nbsp;
                   <asp:ImageButton ID="IbtnEdit" runat="Server"  CommandName="Edit" CommandArgument='<%#Eval("ItemId") %>' CssClass="edit_icon"/>&nbsp;&nbsp;
               </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="No"> <ItemTemplate> <%#Container.DataItemIndex+1%></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Product Name"> <ItemTemplate> <asp:Label ID="lbItemName" runat="server" Text='<%#Eval("ItemName")%>' /></ItemTemplate></asp:TemplateField>
           <asp:TemplateField HeaderText="UnitPrice"><ItemTemplate>Rs. <asp:Label ID="lbUnitPrice" runat="server" Text='<%#Eval("UnitPrice")%>' /></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="ProfitMargin"><ItemTemplate><asp:Label ID="lbProfitMargin" runat="server" Text='<%#Eval("ProfitMargin")%>' />%</ItemTemplate></asp:TemplateField>
             <asp:TemplateField HeaderText="FinalPrice"><ItemTemplate>Rs. <asp:Label ID="FinalPrice" runat="server" Text='<%#Eval("FinalPrice")%>' /></ItemTemplate></asp:TemplateField>
                <asp:TemplateField HeaderText="IsTaxable"><ItemTemplate> <asp:Image ID="ImageIsTaxable" runat="server" ImageUrl='<%# "~/Img/icons/" + Eval("IsTaxable") + ".png" %>' /></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Product Status">
            <ItemTemplate>
                 <asp:Image ID="ImageItemStatus" runat="server" ImageUrl='<%# "~/Img/" + Eval("ItemStatus") + ".png" %>' />
            </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
           <h2>No Product Data Found..!</h2>
        </EmptyDataTemplate>
        <PagerStyle CssClass="pgr" />

 </asp:GridView>
    </fieldset>
</div>
</asp:Content>


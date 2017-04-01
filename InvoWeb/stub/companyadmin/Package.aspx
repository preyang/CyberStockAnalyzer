<%@ Page Title="" Language="C#" MasterPageFile="~/companyadmin/adminmain.master" AutoEventWireup="true" CodeFile="Package.aspx.cs" Inherits="companyadmin_Package" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
<table>
    
    <tr>
<td>
    <asp:Label ID="lblPckage" runat="server" Text="Package"></asp:Label>
  </td>
<td>
    <asp:DropDownList ID="ddlPackage" runat="server" DataSourceID="SqlDataSource1" 
        DataTextField="PackageName" DataValueField="PackageId">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:strConn %>" 
        SelectCommand="SELECT [PackageId], [PackageName] FROM [PackageMaster]">
    </asp:SqlDataSource>
</td>
<td>
    &nbsp;</td>
</tr>
<tr>
<td>
  <asp:Button ID="Submit" runat="server" Text="Submit" CssClass="submit" 
        onclick="Submit_Click" />
</td>
</tr>

      
    </table>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>


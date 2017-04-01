<%@ Page Title="" Language="C#" MasterPageFile="~/companyadmin/adminmain.master" AutoEventWireup="true" CodeFile="ForgetPassword.aspx.cs" Inherits="companyadmin_ForgetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
<table>
<tr>
<td>
    <asp:Label ID="lblemailid" runat="server" Text="Enter Your EmailId"></asp:Label>
</td>
<td>
    <asp:TextBox ID="txtemailid" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
    <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="submit" 
        onclick="Button1_Click" />
</td>
</tr>
</table>
</asp:Content>


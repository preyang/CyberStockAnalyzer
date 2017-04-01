<%@ Page Title="" Language="C#" MasterPageFile="~/companyadmin/adminmain.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="companyadmin_ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="accountInfo">
<h1>Contact Us</h1>
<fieldset class="register">
<div class="divmain">
<div class="right">
<dl>
<dt class="dt">
Give us a Ring
</dt>
<dd class="dd">
091-9824949161
</dd>
</dl>
<dl>
<dt class="dt">
Pop us an Email
</dt>
<dd class="dd">
invowebstub@gmail.com
</dd>
</dl>
<dl>
<dt class="dt">
Connect With Us
</dt>
<dd class="dd">
<img src="../Img/images.png" alt="" class="snslogo" />
<img src="../Img/fb.png" alt="" class="snslogo" />
</dd>
</dl>
</div>
<div class="left">
<table>
<tr>
<td class="label">
    <asp:Label ID="lblName" runat="server" Text="Your Name"></asp:Label>
</td>
<td>
    <asp:TextBox ID="txtName" runat="server" CssClass="text"></asp:TextBox>
</td>
</tr>
<tr>
<td class="label">
    <asp:Label ID="lblEmail" runat="server" Text="Your Email"></asp:Label>
</td>
<td>
    <asp:TextBox ID="txtEmail" runat="server" CssClass="text"></asp:TextBox>
</td>
</tr>
<tr>
<td class="label">
    <asp:Label ID="lblContact" runat="server" Text="Contact No"></asp:Label>
</td>
<td>
    <asp:TextBox ID="txtContact" runat="server" CssClass="text"></asp:TextBox>
</td>
</tr>
<tr>
<td class="label">
    <asp:Label ID="lblMessage" runat="server" Text="Your Message"></asp:Label>
</td>
<td>
    <asp:TextBox ID="txtMessage" runat="server" CssClass="text" TextMode="MultiLine"></asp:TextBox>
</td>
</tr>
<tr>
<td class="label">
</td>
<td>
    <asp:Button ID="Button1" runat="server" Text="Submit" Width="86px" />
</td>
</tr>
</table>
</div>
</div>
</fieldset>
</div>
</asp:Content>


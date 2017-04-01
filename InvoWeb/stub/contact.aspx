<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
InvoWebStub-[Contact Us]
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
 <h1>
    About to Cyber Stock Analyzer 
</h1>
 <p>We are <a href="#">Student Of B.E IT</a>. we are making our last year <a href="#">Cyber Stock Analyzer</a> project, but we make it real web application in this project and also
                 improving our knowledge about web application.</p>      
 <p>Our aim to making of <a href="#">Invoice</a> oriented web apllication is easlier serving <a href="#">Invoice</a> informaiton to web user. We learn the purpose of acquiring the invoices which helps us in surveying the details of the invoices and its potentiality.
                Thourgh this we providing company Account where he/she make own company invoice and managing Invoices, reports purpose.</p>
<br />
<table width="100%">
<tr>
<td width="50%" align="center">
    <p>
    </p>
<dl>
<h6>&nbsp;</h6>
    <h6>Give us a Ring</h6>
</dt>
<dd class="dd">
091-9824949161
</dd>
</dl>
<dl>
<dt class="dt">
<h6>Pop us an Email</h6>
</dt>
<dd class="dd">
<a href="#">invowebstub@gmail.com</a>
</dd>
</dl><br />
</td>
<td width="50%" align="center">
<dl>
<dt class="dt">
<h6>Connect With Us</h6>
    <p>&nbsp;</p>
</dt>
<dd class="dd">
<img src="Img/invoice.jpg" alt="" height="100px" width="100px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="Img/fb.png" alt="" height="100px" width="100px" />
</dd>
</dl>
</td>
</tr>
</table><br />
<div class="accountInfo">
<fieldset class="register">
    <legend>Send Us Feedback</legend>
<table width="100%">
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
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="86px" 
        CssClass="submit"  />
</td>
</tr>
</table>
</fieldset> 
<br />
 <h5>Some Quotes</h5>          
<p>"When we first passed through our minds ages ago. Nothing gives ourselves so much pleasure as to find our works respectfully quoted by <a href="#">other learned.</a>"</p>
 <p>"<a href="#">Luck is not in our hands</a>, But work is in our hands. Our works can make our luck but luck can not make our works, So always trust ourself."</p>

</div>
</asp:Content>


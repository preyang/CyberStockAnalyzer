<%@ Page Title="" Language="C#" MasterPageFile="~/companyadmin/adminmain.master" AutoEventWireup="true" CodeFile="InvoicePage.aspx.cs" Inherits="stub_companyadmin_InvoicePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
<table>
<tr>
<td>
    <asp:Label ID="Label1" runat="server" Text="CompanyName"></asp:Label>
</td>
<td>
    <asp:Label ID="Label2" runat="server" Text="Invoice"></asp:Label>
</td>
<td>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
    <asp:Label ID="Label3" runat="server" Text="Address"></asp:Label>
</td>
<td>
    <asp:Label ID="Label4" runat="server" Text="Country"></asp:Label>
</td>
<td>
    <asp:Label ID="Label17" runat="server" Text="Date"></asp:Label>&nbsp;
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
    <asp:Image ID="CompnyLogo" runat="server" />
</td>
</tr>
</table>
<hr />
<table>
<tr>
<td>
    <asp:Label ID="Label5" runat="server" Text="Customer Name"></asp:Label>
</td>
<td>
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
    <asp:Label ID="Label6" runat="server" Text="Address"></asp:Label>
</td>
<td>
    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
    <asp:Label ID="Label7" runat="server" Text="Phone No"></asp:Label>
</td>
<td>
    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
    <asp:Label ID="Label8" runat="server" Text="Email"></asp:Label>
</td>
<td>
    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
</td>
</tr>
</table>
<hr />
    <asp:Button ID="Button1" runat="server" Text="+Add Product" />
    <br />
    <asp:ListView ID="ListView1" runat="server">

    </asp:ListView>
    <table>
    <tr>
    <td>
        <asp:Label ID="Label18" runat="server" Text="Comment"></asp:Label>
        <asp:TextBox ID="TextBox7" runat="server" TextMode="MultiLine"></asp:TextBox>
    </td>
    <td>
        <asp:Label ID="Label9" runat="server" Text="SubTotal"></asp:Label>
    </td>
    <td>
        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td>
    </td>
    <td>
        <asp:Label ID="Label10" runat="server" Text="Tax"></asp:Label>
    </td>
    <td>
        <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td>
    </td>
    <td>
        <asp:Label ID="Label11" runat="server" Text="Discount"></asp:Label>
    </td>
    <td>
        <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td>
    </td>
    <td>
        <asp:Label ID="Label12" runat="server" Text="Total Amount"></asp:Label>
    </td>
    <td>
        <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
    </td>
    </tr>
    
    <tr>
    <td>
        <asp:Label ID="Label14" runat="server" Text="Payment Status"></asp:Label>
    </td>
    <td>
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
    </td>
    </tr>
    <tr>
    <td>
        <asp:Label ID="Label15" runat="server" Text="Payment Method "></asp:Label>
    </td>
    <td>
        <asp:DropDownList ID="DropDownList2" runat="server">
        </asp:DropDownList>
    </td>
    </tr>
    <tr>
    <td>
        <asp:Label ID="Label16" runat="server" Text="Sale Person Name"></asp:Label>
    </td>
    <td>
        <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
    <td>
        <asp:Button ID="Button2" runat="server" Text="PDF" />
    </td>
    <td>
        <asp:Button ID="Button3" runat="server" Text="Email" />
    </td>
    <td>
        <asp:Button ID="Button4" runat="server" Text="Save" />
    </td>
    <td>
        <asp:Button ID="Button5" runat="server" Text="Print" />
    </td>
    </tr>
    </table>
</asp:Content>


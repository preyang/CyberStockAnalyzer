<%@ Page Title="" Language="C#" MasterPageFile="~/companyadmin/adminmain.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="companyadmin_Dashboard" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
InvoWebStub-[Dashboard]
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>Dashboard</h1>

<div class="accountInfo">
<fieldset class="register">
    <legend>Top Statistical</legend>
<table width="100%">
<tr>
<td width="280px" align="center">
<h2>Top Customers</h2>
</td>
<td width="280px" align="center">
<h2>Top Invoices</h2>
</td>
<td width="280px" align="center">
<h2>Top Products</h2>
</td>
</tr>
<tr>
<td width="280px" align="center">

    <asp:DataList ID="dlCust" runat="server" BackColor="White" 
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        DataSourceID="SqlDataSource5" ForeColor="Black" GridLines="Horizontal" 
        Width="280px">
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <ItemTemplate>
             <table width="100%" style="padding: 0px 0px -10px 0px; margin: 0px 0px -20px 0px">
             <tr><td align="left">
             <a href="#"><asp:Label ID="CustomerNameLabel" runat="server" 
                  Text='<%# Eval("CustomerName") %>' /></a>
               </td>
               <td align="right"><a href="#">
                   &nbsp;Rs.<asp:Label ID="NetAmountLabel" runat="server" 
                Text='<%# Eval("NetAmount") %>' /> </a></td>
                </tr>
              </table>
              <br />
        </ItemTemplate>
        <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
    </asp:DataList>
    <asp:Label ID="lblcust" runat="server" Text="No Record Found" Visible="False"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
        ConnectionString="<%$ ConnectionStrings:strConn %>" 
        
        
        SelectCommand="SELECT TOP (5) SUM(NetAmount) AS NetAmount, CustomerName FROM InvoiceMaster WHERE (CompanyId = @CompanyId) GROUP BY CustomerName ORDER BY NetAmount DESC">
        <SelectParameters>
            <asp:SessionParameter Name="CompanyId" SessionField="CompanyId" 
                Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
</td>
<td width="280px" align="center">

  <asp:DataList ID="dlInvoice" runat="server" BackColor="White" 
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        DataSourceID="SqlDataSource6" ForeColor="Black" GridLines="Horizontal" 
        Width="280px">
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <ItemTemplate>
             <table width="100%" style="padding: 0px 0px -10px 0px; margin: 0px 0px -20px 0px">
             <tr><td align="left"> <a href="#"><asp:Label ID="Label1" runat="server" 
                  Text='<%# Eval("InvoiceNo") %>' /></a> 
               </td>
               <td align="right"><a href="#">
                   &nbsp;Rs.<asp:Label ID="NetAmountLabel" runat="server" 
                Text='<%# Eval("NetAmount") %>' /> </a></td>
                </tr>
              </table>
              <br />
        </ItemTemplate>
        <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
    </asp:DataList>
    <asp:Label ID="lblInvoice" runat="server" Text="No Record Found" Visible="False"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
        ConnectionString="<%$ ConnectionStrings:strConn %>" 
        
        
        
        
        SelectCommand="SELECT TOP (5) NetAmount, InvoiceNo FROM InvoiceMaster WHERE (CompanyId = @CompanyId) ORDER BY NetAmount DESC">
        <SelectParameters>
            <asp:SessionParameter Name="CompanyId" SessionField="CompanyId" 
                Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
</td>
<td width="280px" align="center">

  <asp:DataList ID="dlItem" runat="server" BackColor="White" 
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        DataSourceID="SqlDataSource7" ForeColor="Black" GridLines="Horizontal" 
        Width="280px">
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <ItemTemplate>
             <table width="100%" style="padding: 0px 0px -10px 0px; margin: 0px 0px -20px 0px">
             <tr><td align="left">
             <a href="#"><asp:Label ID="CustomerNameLabel" runat="server" 
                  Text='<%# Eval("ItemName") %>' /></a>
               </td>
               <td align="right"><a href="#">
                   &nbsp;No Of Sale-<asp:Label ID="NetAmountLabel" runat="server" 
                Text='<%# Eval("NoSale") %>' /> </a></td>
                </tr>
              </table>
              <br />
        </ItemTemplate>
        <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
    </asp:DataList>
    <asp:Label ID="lblItem" runat="server" Text="No Record Found" Visible="False"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
        ConnectionString="<%$ ConnectionStrings:strConn %>" 
        
        
        
        SelectCommand="SELECT InvoiceDetail.ItemName, COUNT(*) AS NoSale FROM InvoiceMaster INNER JOIN InvoiceDetail ON InvoiceMaster.InvoiceId = InvoiceDetail.InvoiceId WHERE (InvoiceMaster.CompanyId = @CompanyId) GROUP BY InvoiceDetail.ItemName ORDER BY NoSale DESC">
        <SelectParameters>
            <asp:SessionParameter Name="CompanyId" SessionField="CompanyId" 
                Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
</td>
</tr>
<tr>
<td align="center" style="background-color: #F6B300" width="280px">
<a href="items.aspx" style="color: #FFE2B7; font-size: x-large;">Manage Products</a><br />
&nbsp;<p 
        style="color: #FFFFFF; padding: 30px 30px 15px 30px; margin-top: -40px;">&#39;Manage 
        product information. Add new products, and edit existing product information.&#39; 
       </p>
</td>
<td align="center" style="background-color: #F6B300" width="280px">
<a href="taxes.aspx" style="color: #FFE2B7; font-size: x-large;">Manage Taxes</a><br />
&nbsp;<p style="color: #FFFFFF; padding: 30px 30px 15px 30px; margin-top: -40px;">
        &#39;Manage Taxinformation. Add new Taxes, and edit existing Tax information." 
       </p>
</td>
<td align="center" style="background-color: #F6B300" width="280px">
<a href="invoices.aspx" style="color: #FFE2B7; font-size: x-large;">Manage Invoices</a><br />
&nbsp;<p 
        style="color: #FFFFFF; padding: 30px 30px 15px 30px; margin-top: -40px; ">
        &#39;Manage Invoice information. Add new Invoices, and edit existing Invoice 
        information.&#39; 
       </p>
</td>
</tr>
</table>
</fieldset> 
</div>


<div class="accountInfo">
<fieldset class="register">
    <legend> Performance</legend>
<table width="100%">
<tr>
<td align="center" width="50%">
<h2>Daily Sales Performance</h2>
    <asp:Chart ID="Chartdaily" runat="server" BackColor="" 
        DataSourceID="SqlDataSource1" Width="420px" >
        <series>
            <asp:Series Name="Series1" XValueMember="CreatedDate" 
                YValueMembers="TotalAmount" ChartType="FastLine" YValuesPerPoint="4" >
            </asp:Series>
        </series>
        <chartareas>
            <asp:ChartArea Name="ChartArea1">
                <AxisY Title="[ Net Amounts Rs. ]">
                </AxisY>
                <AxisX Title="[ Days ]">
                </AxisX>
            </asp:ChartArea>
        </chartareas>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:strConn %>" 
        
        
        SelectCommand="SELECT CreatedDate, SUM(NetAmount) AS TotalAmount FROM InvoiceMaster WHERE (CompanyId = @CompanyId) AND (CreatedDate BETWEEN DATEADD(day, - 5, GETDATE()) AND GETDATE()) GROUP BY CreatedDate ORDER BY CreatedDate" 
        >
        <SelectParameters>
            <asp:SessionParameter Name="CompanyId" SessionField="CompanyId" 
                Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
    </td>
    <td align="center" width="50%">
    <h2>Monthly Sales Performance</h2>
    <asp:Chart ID="chartmonth" runat="server"  Width="420px" 
            AlternateText="No Information Available." DataSourceID="SqlDataSource2">
        <series>
            <asp:Series Name="Series1" XValueMember="Month" YValueMembers="TotalAmount" 
                YValuesPerPoint="6" ChartType="StackedColumn">
            </asp:Series>
        </series>
           <chartareas>
            <asp:ChartArea Name="ChartArea1">
                <AxisY Title="[ Net Amounts Rs. ]">
                </AxisY>
                <AxisX Title="[ Month ]">
                </AxisX>
            </asp:ChartArea>
        </chartareas>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:strConn %>" 
        
            
            SelectCommand="SELECT MONTH(CreatedDate) AS Month, SUM(NetAmount) AS TotalAmount FROM InvoiceMaster WHERE (CompanyId = @CompanyId) GROUP BY MONTH(CreatedDate) ORDER BY Month">
        <SelectParameters>
            <asp:SessionParameter Name="CompanyId" SessionField="CompanyId" 
                Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
    </td>
</tr>
<tr>
<td align="center" width="50%">
<h2>Quarterly Sales Performance</h2>
    <asp:Chart ID="ChartQuarterly" runat="server" BackColor="" 
        DataSourceID="SqlDataSource3" Width="420px" >
        <series>
            <asp:Series Name="Series1" XValueMember="Quarters" 
                YValueMembers="TotalAmount" YValuesPerPoint="4" ChartType="StackedColumn" >
            </asp:Series>
        </series>
        <chartareas>
            <asp:ChartArea Name="ChartArea1">
                <AxisY Title="[ Net Amounts Rs. ]">
                </AxisY>
                <AxisX Title="[ Quarter ]">
                </AxisX>
            </asp:ChartArea>
        </chartareas>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:strConn %>" 
        
        
        SelectCommand="SELECT DATEPART(q, CreatedDate) AS Quarters, SUM(NetAmount) AS TotalAmount FROM InvoiceMaster WHERE (CompanyId = @CompanyId) GROUP BY DATEPART(q, CreatedDate)" 
        >
        <SelectParameters>
            <asp:SessionParameter Name="CompanyId" SessionField="CompanyId" 
                Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
    </td>
    <td align="center" width="50%">
    <h2>Yearly Sales Performance</h2>
    <asp:Chart ID="chartYearly" runat="server"  Width="420px" 
            AlternateText="No Information Available." DataSourceID="SqlDataSource4">
        <series>
            <asp:Series Name="Series1" XValueMember="year" YValueMembers="TotalAmount" 
                YValuesPerPoint="6" ChartType="StackedColumn">
            </asp:Series>
        </series>
           <chartareas>
            <asp:ChartArea Name="ChartArea1">
                <AxisY Title="[ Net Amounts Rs. ]">
                </AxisY>
                <AxisX Title="[ Year ]">
                </AxisX>
            </asp:ChartArea>
        </chartareas>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:strConn %>" 
        
            
            
            SelectCommand="SELECT YEAR(CreatedDate) AS year, SUM(NetAmount) AS TotalAmount FROM InvoiceMaster WHERE (CompanyId = @CompanyId) GROUP BY YEAR(CreatedDate) ORDER BY year">
        <SelectParameters>
            <asp:SessionParameter Name="CompanyId" SessionField="CompanyId" 
                Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
    </td>
</tr>
</table>
</fieldset> 
</div>

</asp:Content>


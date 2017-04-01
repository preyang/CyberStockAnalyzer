<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginPage.aspx.cs" Inherits="LoginPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
  
    <title>Cyber Stock Analyzer-LOGIN</title>
    <link href="Css/Login.css" rel="stylesheet" type="text/css" />
</head>
<body>
   <div class="main">
     <!--header start -->
        <div class="header">
            <div class="header_resize">
            <div class="logo"><h1><span>Cyber</span>Stock Analyzer<br /></h1></div>
            <div class="clr"></div>
            </div>
        </div>
    <!--header end -->

    <!--body start -->
   <div class="content">
        <div class="content_resize">
        <form id="form1" runat="server">
        <asp:Login ID="Login1" runat="server" RememberMeSet="True" >
            <LayoutTemplate>
			<ol><li>
			<div id="lit">
			<asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
			</div>
			</li><li>
            <label for="username">Email ID :&nbsp;<a href="Registration.aspx" tabindex="2">(Register Now !)</a></label>
            <asp:TextBox ID="UserName" runat="server" CssClass="text"></asp:TextBox>
            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="ctl00$Login1" ForeColor="DeepSkyBlue">*</asp:RequiredFieldValidator>
            <asp:Label ID="lbl_email" runat="server" Text="Not Available Email ID.." 
                        Visible="False" ForeColor="#0099FF"></asp:Label>
            </li><li>
            <label for="password">Password :&nbsp;<a href="ForgetPassword.aspx" tabindex="2">(Forgot Your Password?)</a></label>
            <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="text"></asp:TextBox>
            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="ctl00$Login1" ForeColor="DeepSkyBlue">*</asp:RequiredFieldValidator> 
           <div class="clr"></div>
           </li></ol>
            <div id="checks">
            &nbsp;
            </div>
            <div id="buttons">
				<asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="LOG IN" 
                    ValidationGroup="ctl00$Login1" Cssclass="send" 
                    onclick="LoginButton_Click" />
           </div>
           </LayoutTemplate>
        </asp:Login>
        </form>
        </div>    
    </div>	
    <!--body end -->

  <!--footer start -->
  <div class="footer">
    <div class="footer_resize">
      <p class="lf">Invoice System by <a href="Default.aspx">Cyber Stock Analyzer</a></p>
      <ul class="fmenu">
        <li class="active"><a href="Default.aspx"><<&nbsp;Back Home</a></li>
      </ul>
    </div>
    <div class="clr"></div>
  </div>
  <!--footer end -->
  </div> 
</body>
</html>

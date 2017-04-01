<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true"
    CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="Server">
    InvoWebStub-Registration
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHead" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <h1>
        Create a New Account >>
        <asp:Label ID="lblAcctStatus" runat="server" Text=" (Step-1) "></asp:Label>
    </h1>
    <asp:MultiView ID="mvRegister" runat="server" ActiveViewIndex="0">
        <asp:View ID="vAcct" runat="server">
            <div class="accountInfo">
                <fieldset class="register">
                    <legend>Account Registration</legend>
                    <h6>
                        Fields mark with red asterisk (*) are required</h6>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblUserName" runat="server" Text="User Name: "></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtUserName" ForeColor="Red"></asp:RequiredFieldValidator>
                                <br />
                            </td>
                            <td>
                                <asp:TextBox ID="txtUserName" runat="server" CssClass="text"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblEmailId" runat="server" Text="Email-Id: "></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtEmailId" ForeColor="Red"></asp:RequiredFieldValidator>
                                <br />
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmailId" runat="server" CssClass="text"></asp:TextBox>
                                <br />
                                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="Email ID already exist..."
                                    ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                            </td>
                            <td>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Enter Valid Email-Id"
                                    ControlToValidate="txtEmailId" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ForeColor="Red"></asp:RegularExpressionValidator>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblPassword" runat="server" Text="Password: "></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="text"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Password must be 8-10 characters long&lt;/br&gt; with at least one numeric character."
                                    ControlToValidate="txtPassword" ForeColor="Red" ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password: "></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtConfirmPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="text"></asp:TextBox>
                            </td>
                            <td>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Your Password Does No Match!!"
                                    ControlToValidate="txtConfirmPassword" ForeColor="Red" ControlToCompare="txtPassword"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblSecurityQuestion" runat="server" Text="Security Question: "></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlSecurityQuestion"
                                    ErrorMessage="*" ForeColor="Red" InitialValue="Select Any Question"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlSecurityQuestion" runat="server">
                                    <asp:ListItem>Select Any Question</asp:ListItem>
                                    <asp:ListItem>What was your School Name?</asp:ListItem>
                                    <asp:ListItem>What is your Favourite Food?</asp:ListItem>
                                    <asp:ListItem>What is your pet Name?</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblAnswer" runat="server" Text="Answer"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAnswer" 
                                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAnswer" runat="server" CssClass="text"></asp:TextBox>
                                
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="btnSubmit" runat="server" Text="Registered & Next" CssClass="submit"
                                    OnClick="btnSubmit_Click" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </div>
        </asp:View>
        <asp:View ID="vComp" runat="server">
            <div class="accountInfo">
                <fieldset class="register">
                    <legend>Company Information</legend>
                    <h6>
                        Fields mark with red asterisk (*) are required</h6>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblCompanyName" runat="server" Text="Company Name"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtCompanyName" ForeColor="Red" ValidationGroup="s"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCompanyName" runat="server" CssClass="text" ValidationGroup="s"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblInvoiceNoPrefix" runat="server" Text="Invoice No Prefix :"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtInvoiceNoPrefix" ForeColor="Red" ValidationGroup="s"></asp:RequiredFieldValidator><br />
                            </td>
                            <td>
                                <asp:TextBox ID="txtInvoiceNoPrefix" runat="server" CssClass="text" ValidationGroup="s"></asp:TextBox><br />
                                example. "IWS" for InvoiceNo-"IWS00002".
                            </td>
                            <td>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Maximum 3 character string."
                                    ValidationExpression="^[a-zA-Z]{3,3}$" ControlToValidate="txtInvoiceNoPrefix"
                                    ForeColor="Red"></asp:RegularExpressionValidator><br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblCompAddress" runat="server" Text="Company Address"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtCompAddress" ForeColor="Red" ValidationGroup="s"></asp:RequiredFieldValidator>
                                <br />
                                <br />
                                <br />
                                <br />
                            </td>
                            <td>
                                <asp:TextBox ID="txtCompAddress" runat="server" CssClass="text" TextMode="MultiLine"
                                    ValidationGroup="s"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblCompLogo" runat="server" Text="Company Logo"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*"
                                    ControlToValidate="logoUpload" ForeColor="Red" ValidationGroup="s"></asp:RequiredFieldValidator><br />
                            </td>
                            <td>
                                <asp:FileUpload ID="logoUpload" runat="server" CssClass="upload" />
                                <br />
                                Only JPEG image files are accepted, less than 100 kb!
                            </td>
                            <td>
                                <asp:Label ID="lbvalenght" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label><br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblContactPerson" runat="server" Text="Contact Person Name"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtContactPerson" ForeColor="Red" ValidationGroup="s"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="txtContactPerson" runat="server" CssClass="text" ValidationGroup="s"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblContactNo" runat="server" Text="Contact No"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtContactNo" ForeColor="Red" ValidationGroup="s"></asp:RequiredFieldValidator>
                              
                            </td>
                            <td>
                                <asp:TextBox ID="txtContactNo" runat="server" CssClass="text" ValidationGroup="s"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblContactEmail" runat="server" Text="Contact Email"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtContactEmail" ForeColor="Red" ValidationGroup="s"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="txtContactEmail" runat="server" CssClass="text" ValidationGroup="s"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtContactEmail"
                                    ErrorMessage="Please Enter Valid Email-Id" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ValidationGroup="s"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblWebsite" runat="server" Text="Website"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtWebsite"
                                    ErrorMessage="*" ForeColor="Red" ValidationGroup="s"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="txtWebsite" runat="server" CssClass="text" ValidationGroup="s"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td align="right">
                                <asp:Button ID="Back" runat="server" Text="Back" CssClass="submit" OnClick="Back_Click" />
                            </td>
                            <td>
                                <asp:Button ID="SavecompMaster" runat="server" Text="Save Company" CssClass="submit"
                                    OnClick="SavecompMaster_Click" ValidationGroup="s" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="dbms.login" %>



<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>



<asp:Content ID="Content1" ContentPlaceHolderID="contentplaceholder1" runat="server">
     <table>
        <tr>
            <td><b>Login: </b></td>
            <td style="width: 623px">
                <asp:TextBox ID="txtLogin" onkeypress="return IsAlphaNumeric(event);" ondrop="return false;" onpaste="return false;" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Century Schoolbook" Font-Size="16px" ToolTip="Input your registered name" CssClass="ProductsTextBox"></asp:TextBox>
               
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLogin" ErrorMessage="RequiredFieldValidator" ValidationGroup="valid">*</asp:RequiredFieldValidator>
                   <span id="error" style="color: Red; display: none">Special Characters not allowed</span>         
            </td>
        </tr>
         
        <tr>
            <td><b>Password: </b></td>
            <td style="width: 623px">
                <asp:TextBox ID="txtPassword" runat="server" onkeypress="return IsAlphaNumeric1(event);" ondrop="return false;" onpaste="return false;" Font-Bold="True" Font-Italic="True" Font-Names="Century Schoolbook" Font-Size="16px" ToolTip="Input your password" TextMode="Password" CssClass="ProductsTextBox"></asp:TextBox>
               
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="RequiredFieldValidator" ValidationGroup="valid">*</asp:RequiredFieldValidator>
                <span id="error1" style="color: Red; display: none">Special Characters not allowed</span>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnLogin" runat="server" Text="Login" 
                    onclick="btnLogin_Click" Font-Bold="True" Font-Names="Century Schoolbook" Font-Size="16px" ValidationGroup="valid" /><br/>
                <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                <br />
                <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="register.aspx" CausesValidation="False">Register</asp:LinkButton>
                
            </td>
        </tr>
    </table>

    <script type="text/javascript">
        var specialKeys = new Array();
        specialKeys.push(8); //Backspace
        specialKeys.push(9); //Tab
        specialKeys.push(46); //Delete
        specialKeys.push(36); //Home
        specialKeys.push(35); //End
        specialKeys.push(37); //Left
        specialKeys.push(39); //Right
        specialKeys.push(59);
        specialKeys.push(61);
        specialKeys.push(45);
        specialKeys.push(47);
        specialKeys.push(96);
        specialKeys.push(91);
        specialKeys.push(92);
        specialKeys.push(39);
        specialKeys.push(47);

        function IsAlphaNumeric(e) {
            var keyCode = e.keyCode == 0 ? e.charCode : e.keyCode;
            var ret = ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 65 && keyCode <= 90) || (keyCode >= 97 && keyCode <= 122) || (specialKeys.indexOf(e.keyCode) != -1 && e.charCode != e.keyCode));
            document.getElementById("error").style.display = ret ? "none" : "inline";
            return ret;
        }
        function IsAlphaNumeric1(e) {
            var keyCode = e.keyCode == 0 ? e.charCode : e.keyCode;
            var ret = ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 65 && keyCode <= 90) || (keyCode >= 97 && keyCode <= 122) || (specialKeys.indexOf(e.keyCode) != -1 && e.charCode != e.keyCode));
            document.getElementById("error1").style.display = ret ? "none" : "inline";
            return ret;
        }

    </script>



</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="dbms.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentplaceholder1" runat="server">


     <table cellspacing="4" cellpadding="4">
        <tr>
            <td style="font-weight: 700">Name: </td>
            <td style="width: 581px">
                <asp:TextBox ID="txtName" runat="server" onkeypress="return IsAlphaNumeric(event);" ondrop="return false;" onpaste="return false;" Width="250px" Font-Bold="True" Font-Italic="True" Font-Names="Century Schoolbook" Font-Size="16px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtName" ErrorMessage="*" ValidationGroup="valid"></asp:RequiredFieldValidator>
                <span id="error" style="color: Red; display: none">Special Characters not allowed</span>
            </td>
        </tr>
        <tr>
            <td style="font-weight: 700">Password: </td>
            <td style="width: 581px">
                <asp:TextBox ID="txtPassword" runat="server" onkeypress="return IsAlphaNumeric1(event);" ondrop="return false;" onpaste="return false;" TextMode="Password" Width="250px" Font-Bold="True" Font-Italic="True" Font-Names="Century Schoolbook" Font-Size="16px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtPassword" ErrorMessage="*" ValidationGroup="valid"></asp:RequiredFieldValidator>
                <span id="error1" style="color: Red; display: none">Special Characters not allowed</span>
            </td>
        </tr>
        <tr>
            <td style="font-weight: 700">Confirm Password: </td>
            <td style="width: 581px">
                <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" Width="250px" Font-Bold="True" Font-Italic="True" Font-Names="Century Schoolbook" Font-Size="16px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtConfirm" ErrorMessage="*" ValidationGroup="valid"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="font-weight: 700">E-mail: </td>
            <td style="width: 581px">
                <asp:TextBox ID="txtEmail" runat="server" Width="250px" Font-Bold="True" Font-Italic="True" Font-Names="Century Schoolbook" Font-Size="16px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="*" ValidationGroup="valid"></asp:RequiredFieldValidator>
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Wrong Email Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="valid"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnRegister" runat="server" Text="Register" 
                    onclick="btnRegister_Click" Font-Bold="True" Font-Names="Century Schoolbook" Font-Size="16px" ValidationGroup="valid" />
                <br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtConfirm" ControlToValidate="txtPassword" 
                    ErrorMessage="Passwords must match"></asp:CompareValidator>
                <br />
                <asp:Label ID="lblResult" runat="server"></asp:Label>
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

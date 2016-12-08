<%@ Page Title="" Language="C#" MasterPageFile="~/manage.Master" AutoEventWireup="true" CodeBehind="tennis_add.aspx.cs" Inherits="dbms.tennis_add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentplaceholder1" runat="server">

    <h3>Adding a new product</h3>

    <table class="tennisTable">
        <tr>
            <td style="width: 80px">
                <b>
                <br />
                Name:</b>
            </td>
            <td>
                <br />
                <asp:TextBox ID="txtName" runat="server" Width="300px" OnTextChanged="txtName_TextChanged" Font-Bold="True" Font-Italic="True" Font-Names="Century Schoolbook" Font-Size="16px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtName" ErrorMessage="*" ValidationGroup="valid"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 80px">
                <b>Type:</b>
            </td>
            <td>
                <asp:TextBox ID="txtType" runat="server" Width="300px" Font-Bold="True" Font-Italic="True" Font-Names="Century Schoolbook" Font-Size="16px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtType" ErrorMessage="*" ValidationGroup="valid"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 80px">
                <b>Price:</b>
            </td>
            <td>
                <asp:TextBox ID="txtPrice" runat="server" Width="300px" Font-Bold="True" Font-Italic="True" Font-Names="Century Schoolbook" Font-Size="16px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtPrice" ErrorMessage="*" ValidationGroup="valid"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 80px">
                <b>Gender:</b>
            </td>
            <td>
                <asp:TextBox ID="txtGender" runat="server" Width="300px" Font-Bold="True" Font-Italic="True" Font-Names="Century Schoolbook" Font-Size="16px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtGender" ErrorMessage="*" ValidationGroup="valid"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 80px">
                <b>Category:</b>
            </td>
            <td>
                <asp:TextBox ID="txtCategory" runat="server" Width="300px" Font-Bold="True" Font-Italic="True" Font-Names="Century Schoolbook" Font-Size="16px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtCategory" ErrorMessage="*" ValidationGroup="valid"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 80px">
                <b>Brand:</b>
            </td>
            <td>
                <asp:TextBox ID="txtBrand" runat="server" Width="300px" Font-Bold="True" Font-Italic="True" Font-Names="Century Schoolbook" Font-Size="16px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtBrand" ErrorMessage="*" ValidationGroup="valid"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 80px">
                <b>Country:</b>
            </td>
            <td>
                <asp:TextBox ID="txtCountry" runat="server" Width="300px" Font-Bold="True" Font-Italic="True" Font-Names="Century Schoolbook" Font-Size="16px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="txtCountry" ErrorMessage="*" ValidationGroup="valid"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 80px">
                <b>Image:</b>
            </td>
            <td>
                <asp:DropDownList ID="ddlImage" runat="server" Width="300px" Font-Bold="True" Font-Italic="True" Font-Names="Century Schoolbook" Font-Size="16px">
                </asp:DropDownList>
                <br/>
                <asp:FileUpload ID="FileUpload1" runat="server" Width="245px" Font-Bold="True" Font-Names="Century Schoolbook" Font-Size="16px" /> 
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                <asp:Button ID="btnUploadImage" runat="server" Text="Upload Image" 
                    onclick="btnUploadImage_Click" CausesValidation="False" style="margin-left: 34px" Font-Bold="True" Font-Names="Century Schoolbook" Font-Size="16px"/> 
            </td>
            
        </tr>
        <tr>
            <td style="width: 80px">
                <b>Review:</b>
            </td>
            <td>
                <asp:TextBox ID="txtReview" runat="server" Height="98px" TextMode="MultiLine" Width="332px" Font-Bold="True" Font-Italic="True" Font-Names="Century Schoolbook" Font-Size="16px"></asp:TextBox>
            </td>
        </tr>

        <tr>

            <td style="width:auto">
                 <asp:Label ID="lblResult" runat="server" Text="" Font-Bold="True" Font-Italic="True" Font-Names="Century Schoolbook" Font-Size="16px"></asp:Label>
             </td>

                <td>
                    <asp:Button ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click" Font-Bold="True" Font-Names="Century Schoolbook" Font-Size="16px" ValidationGroup="valid" />
            </td>
        </tr>
    </table>
   
    <br />
    
    
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/manage.Master" AutoEventWireup="true" CodeBehind="orders_list.aspx.cs" Inherits="dbms.orders_list" %>



<asp:Content ID="Content1" ContentPlaceHolderID="contentplaceholder1" runat="server">



    <p>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; From:
        <asp:TextBox ID="TextBox1" runat="server" CssClass="ProductsTextBox"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*" ValidationGroup="valid"></asp:RequiredFieldValidator>
        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="mm/dd/yyyy" ValidationExpression="^((0?[1-9]|1[012])[- /.](0?[1-9]|[12][0-9]|3[01])[- /.](19|20)?[0-9]{2})*$" ValidationGroup="valid"></asp:RegularExpressionValidator>
        &nbsp;&nbsp;&nbsp;&nbsp; To:
        <asp:TextBox ID="TextBox2" runat="server" CssClass="ProductsTextBox"></asp:TextBox>
    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*" ValidationGroup="valid"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="mm/dd/yyyy" ValidationExpression="^((0?[1-9]|1[012])[- /.](0?[1-9]|[12][0-9]|3[01])[- /.](19|20)?[0-9]{2})*$" ValidationGroup="valid"></asp:RegularExpressionValidator>
    </p>
    <p style="margin-left: 120px">
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Get Open Orders" Font-Bold="True" Font-Names="Century Schoolbook" Font-Size="16px" ValidationGroup="valid" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Get Closed Orders" Font-Bold="True" Font-Names="Century Schoolbook" Font-Size="16px" ValidationGroup="valid" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p style="margin-left: 120px">
&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Label" Font-Bold="True" Font-Italic="True" Font-Names="Century Schoolbook" Font-Size="12px"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>



</asp:Content>

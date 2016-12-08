<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="pdf.aspx.cs" Inherits="dbms.pdf" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentplaceholder1" runat="server">
    <p>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    </p>
    <p style="margin-left: 40px">
        <asp:Button ID="Button1" runat="server" Font-Bold="True" Font-Names="Century Schoolbook" Font-Size="16px" OnClick="Button1_Click" Text="Download" />
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="tennis.aspx.cs" Inherits="dbms.tennis1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentplaceholder1" runat="server">





    <p style="font-family: 'Century Schoolbook'; font-style: italic; font-weight: bold; color: #006600">
        &nbsp;&nbsp; Select type &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="type" DataValueField="type" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TennisDBConnectionString %>" SelectCommand="SELECT DISTINCT [type] FROM [tennis]"></asp:SqlDataSource>
    </p>
<p style="font-family: 'Century Schoolbook'; font-style: italic; font-weight: bold; color: #006600; margin-left: 40px;">
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </p>





</asp:Content>

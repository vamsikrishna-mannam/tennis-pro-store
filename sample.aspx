<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="sample.aspx.cs" Inherits="dbms.sample" %>


<asp:Content ID="Content1" ContentPlaceHolderID="contentplaceholder1" runat="server">


    <p>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Filters:&nbsp; Brand&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="brand" DataValueField="brand" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Font-Bold="True" Font-Italic="True" Font-Names="Century Schoolbook" Font-Size="12px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tennisConnectionString %>" SelectCommand="SELECT DISTINCT [brand] FROM [products]"></asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Gender&nbsp;
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="gender" DataValueField="gender" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Font-Bold="True" Font-Italic="True" Font-Names="Century Schoolbook" Font-Size="12px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:tennisConnectionString %>" SelectCommand="SELECT DISTINCT [gender] FROM [products]"></asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Category&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="category" DataValueField="category" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" Font-Bold="True" Font-Italic="True" Font-Names="Century Schoolbook" Font-Size="12px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:tennisConnectionString %>" SelectCommand="SELECT DISTINCT [category] FROM [products]"></asp:SqlDataSource>
    </p>
    <p style="margin-left: 80px">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;
    </p>
    <p style="margin-left: 80px">
        &nbsp;</p>
    <p style="margin-left: 80px">
        &nbsp;</p>
    <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p>
    </p>
    <p>
    </p>


</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="shop.aspx.cs" Inherits="dbms.shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentplaceholder1" runat="server">

    <asp:Label ID="lblResult" runat="server" Text="Label" Visible="False" Font-Names="Century Schoolbook" ForeColor="#FF5050"></asp:Label>
    <br />
    <asp:Button ID="btnOk" runat="server" Text="Ok" Visible="False" Width="100px" 
        onclick="btnOk_Click" Font-Bold="True" Font-Italic="True" Font-Names="Century Schoolbook" ForeColor="#3366CC" ToolTip="Place order" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" Visible="False" 
        Width="100px" onclick="btnCancel_Click" Font-Bold="True" Font-Italic="True" Font-Names="Century Schoolbook" ForeColor="#3366CC" ToolTip="Remove from cart" />
    <br />
    <br />
    <asp:Button ID="btnOrder" runat="server" Text="Order!" 
        onclick="btnOrder_Click" Font-Bold="True" Font-Italic="True" Font-Names="Century Schoolbook" ForeColor="#3366CC" ToolTip="Add product to cart" />
    <br />
    <asp:Label ID="lblError" runat="server"></asp:Label>
    <asp:Panel ID="pnlProducts" runat="server">
    </asp:Panel>
    <br />
</asp:Content>

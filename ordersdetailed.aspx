<%@ Page Title="" Language="C#" MasterPageFile="~/manage.Master" AutoEventWireup="true" CodeBehind="ordersdetailed.aspx.cs" Inherits="dbms.ordersdetailed" %>


<asp:Content ID="Content1" ContentPlaceHolderID="contentplaceholder1" runat="server">


    <p style="margin-left: 40px">
        &nbsp;</p>
    <p style="margin-left: 80px">
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    </p>
    <p style="margin-left: 80px">
        <br />
        <asp:GridView ID="GridView1" AutoGenerateColumns="False" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="product" HeaderText="product" SortExpression="product" />
                <asp:BoundField DataField="amount" HeaderText="amount" ReadOnly="True" SortExpression="amount" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:CheckBoxField DataField="orderShipped" HeaderText="orderShipped" SortExpression="orderShipped" />
                <asp:BoundField DataField="total" HeaderText="total" ReadOnly="True" SortExpression="total" />
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tennisConnectionString %>" SelectCommand="Select product, SUM(amount) AS amount, price, orderShipped, SUM(amount*price) AS total from orders where client=@client AND date=@date GROUP BY product, price, orderShipped">
            <SelectParameters>
                <asp:QueryStringParameter Name="client" QueryStringField="client" />
                <asp:QueryStringParameter DbType="Date" Name="date" QueryStringField="date" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p style="margin-left: 80px">
        <asp:Button ID="Button1" runat="server" Text="Ship Order" OnClick="Button1_Click" />
    </p>
    <p>
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

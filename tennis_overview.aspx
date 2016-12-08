<%@ Page Title="" Language="C#" MasterPageFile="~/manage.Master" AutoEventWireup="true" CodeBehind="tennis_overview.aspx.cs" Inherits="dbms.tennis_overview" %>



<asp:Content ID="Content1" ContentPlaceHolderID="contentplaceholder1" runat="server">

    <h4 style="font-family: 'Century Schoolbook'; font-weight: bold; font-style: italic">
                   &nbsp;&nbsp; List of Products&nbsp;</h4>
    <p style="font-family: 'Century Schoolbook'; font-weight: bold; font-style: italic; margin-left: 40px;">
                   <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/tennis_add.aspx">Add new item</asp:LinkButton>
    </p>
               <p style="margin-left: 40px">
                   <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:BoundField DataField="country" HeaderText="country" SortExpression="country" />
                <asp:BoundField DataField="gender" HeaderText="gender" SortExpression="gender" />
                <asp:BoundField DataField="image" HeaderText="image" SortExpression="image" />
                <asp:BoundField DataField="review" HeaderText="review" SortExpression="review" />
                <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                <asp:BoundField DataField="brand" HeaderText="brand" SortExpression="brand" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tennisConnectionString %>" DeleteCommand="DELETE FROM [products] WHERE [id] = @id" InsertCommand="INSERT INTO [products] ([name], [type], [price], [country], [gender], [image], [review], [category], [brand]) VALUES (@name, @type, @price, @country, @gender, @image, @review, @category, @brand)" SelectCommand="SELECT * FROM [products]" UpdateCommand="UPDATE [products] SET [name] = @name, [type] = @type, [price] = @price, [country] = @country, [gender] = @gender, [image] = @image, [review] = @review, [category] = @category, [brand] = @brand WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="type" Type="String" />
                <asp:Parameter Name="price" Type="Int32" />
                <asp:Parameter Name="country" Type="String" />
                <asp:Parameter Name="gender" Type="String" />
                <asp:Parameter Name="image" Type="String" />
                <asp:Parameter Name="review" Type="String" />
                <asp:Parameter Name="category" Type="String" />
                <asp:Parameter Name="brand" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="type" Type="String" />
                <asp:Parameter Name="price" Type="Int32" />
                <asp:Parameter Name="country" Type="String" />
                <asp:Parameter Name="gender" Type="String" />
                <asp:Parameter Name="image" Type="String" />
                <asp:Parameter Name="review" Type="String" />
                <asp:Parameter Name="category" Type="String" />
                <asp:Parameter Name="brand" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
               </p>

</asp:Content>

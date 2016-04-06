<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageCMS.master" AutoEventWireup="true" CodeFile="OrdersDetails.aspx.cs" Inherits="Pages_OrdersDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:Label ID="lblTitle" runat="server"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="sds_order_detalied" ForeColor="Black" GridLines="Vertical" Width="919px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="product" HeaderText="product" SortExpression="product" />
            <asp:BoundField DataField="amount" HeaderText="amount" ReadOnly="True" SortExpression="amount" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <asp:CheckBoxField DataField="orderShipped" HeaderText="orderShipped" SortExpression="orderShipped" />
            <asp:BoundField DataField="total" HeaderText="total" ReadOnly="True" SortExpression="total" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    <asp:SqlDataSource ID="sds_order_detalied" runat="server" ConnectionString="<%$ ConnectionStrings:Coffee_DBConnectionString %>" SelectCommand="SELECT 
product,
SUM(amount) AS amount,
price,
orderShipped,
SUM(amount*price) AS total
FROM 
orders
WHERE
client = @client
AND
date = @date
GROUP BY
product, price, orderShipped">
        <SelectParameters>
            <asp:QueryStringParameter Name="client" QueryStringField="client" />
            <asp:QueryStringParameter DbType="DateTime" Name="date" QueryStringField="date" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Button ID="btnShip" runat="server" Text="Ship Order!" />
</asp:Content>


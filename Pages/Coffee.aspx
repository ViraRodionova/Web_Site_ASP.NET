<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Coffee.aspx.cs" Inherits="Coffee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Select a type:
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="150px" DataSourceID="sss" DataTextField="type" DataValueField="type" Height="20px"></asp:DropDownList>
    <asp:SqlDataSource ID="sss" runat="server" ConnectionString="<%$ ConnectionStrings:Coffee_DBConnectionString %>" SelectCommand="SELECT DISTINCT [type] FROM [coffee] ORDER BY [type]"></asp:SqlDataSource>
<br />
<asp:Label ID="lblOutput" runat="server"></asp:Label>

</asp:Content>


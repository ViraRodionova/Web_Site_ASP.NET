<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Shop.aspx.cs" Inherits="Pages_Shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblResult" runat="server" Text="Label" Visible="False"></asp:Label>
<br />
<asp:Button ID="btnOK" runat="server" Text="OK" Visible="False" Width="100px" OnClick="btnOK_Click" />
    <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" Visible="False" Width="100px" />
<br />
<asp:Button ID="btnOrder" runat="server" Text="Order!" OnClick="btnOrder_Click" />
<br />
<asp:Label ID="lblError" runat="server"></asp:Label>
<asp:Panel ID="pnlProducts" runat="server">
</asp:Panel>
<br />
</asp:Content>


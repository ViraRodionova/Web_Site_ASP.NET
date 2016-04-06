<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageCMS.master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Pages_Orders" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="744px">
        <ajaxToolkit:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
            <HeaderTemplate>
                Open Orders<br />
            </HeaderTemplate>
            <ContentTemplate>
                Show orders between:
                <asp:TextBox ID="txtOpenOrders1" runat="server" AutoPostBack="True"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtOpenOrders1_CalendarExtender" runat="server" TargetControlID="txtOpenOrders1" BehaviorID="_content_txtOpenOrders1_CalendarExtender" />
                &nbsp;And:
                <asp:TextBox ID="txtOpenOrders2" runat="server" AutoPostBack="True"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtOpenOrders2_CalendarExtender" runat="server" TargetControlID="txtOpenOrders2" BehaviorID="_content_txtOpenOrders2_CalendarExtender" />
                <br />
                <asp:Label ID="lblOpenOrders" runat="server"></asp:Label>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel runat="server" HeaderText="TabPanel2" ID="TabPanel2">
            <HeaderTemplate>
                Closed Orders<br />
            </HeaderTemplate>
        </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3">
            <HeaderTemplate>
                Analytics<br />
            </HeaderTemplate>
        </ajaxToolkit:TabPanel>
    </ajaxToolkit:TabContainer>
    
<br />
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
    
</asp:Content>


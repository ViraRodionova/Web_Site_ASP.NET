<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageCMS.master" AutoEventWireup="true" CodeFile="Coffee_Add.aspx.cs" Inherits="Pages_Coffee_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Add new Coffee</h3>

    <div id="content_area">
        <table cellspasing="15" class="coffeeTable">
            <tr>
                <td style="width: 85px">

                    Name:</td>
                <td>

                    <asp:TextBox ID="txtName" runat="server" Width="300px"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                </td>
            </tr>

            <tr>
                <td style="width: 85px">

                    Type:</td>
                <td>

                    <asp:TextBox ID="txtType" runat="server" Width="300px"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtType" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                </td>
            </tr>

            <tr>
                <td style="width: 85px; height: 24px">

                    Price:</td>
                <td style="height: 24px">

                    <asp:TextBox ID="txtPrice" runat="server" Width="300px"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPrice" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                </td>
            </tr>

            <tr>
                <td style="width: 85px">

                    Roast:</td>
                <td>

                    <asp:TextBox ID="txtRoast" runat="server" Width="300px"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtRoast" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                </td>
            </tr>

            <tr>
                <td style="width: 85px">

                    Country:</td>
                <td>

                    <asp:TextBox ID="txtCountry" runat="server" Width="300px"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCountry" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                </td>
            </tr>

            <tr>
                <td style="width: 85px">

                    Image:</td>
                <td>

                    <asp:DropDownList ID="ddlImage" runat="server" Width="300px" OnSelectedIndexChanged="ddlImage_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlImage" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:Button ID="btnUploadImage" runat="server" Text="Upload Image" OnClick="btnUploadImage_Click" CausesValidation="False" />

                </td>
            </tr>

            <tr>
                <td style="width: 85px">

                    Review:</td>
                <td>

                    <asp:TextBox ID="txtReview" runat="server" Height="120px" TextMode="MultiLine" Width="300px"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtReview" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                </td>
            </tr>

        </table>
    
        <br />
        <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
        <br />
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />

    </div>

    <div id="slidebar">
        <asp:Image ID="imgPreview" runat="server" />
    </div>
    
</asp:Content>


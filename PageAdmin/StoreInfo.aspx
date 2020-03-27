<%@ Page Title="" Language="C#" MasterPageFile="~/Master/AdminMaster.master" AutoEventWireup="true" CodeFile="StoreInfo.aspx.cs" Inherits="PageAdmin_StoreInfo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentuser" Runat="Server">
 <style>
        .st {
            color: #F5F5F5;
            text-align: left;
            background-color: #00C6C6;
            border-radius: 12px;
            opacity: 80;
            padding: 10px;
            font-size: medium;
            font-weight: 500;
            font-family: 'Palatino Linotype';
        }

            .st input[type="text"], input[type="password"], input[type="label"] {
                border-radius: 7px;
                border-style: groove;
                padding-left: 15px;
                height: 20px;
                box-shadow: 0 0 5px #333;
                outline: none;
                border: 1px solid #ffa853;
                margin-top: 15px;
            }

            .st input[type="submit"] {
                border-radius: 8px;
                border-style: groove;
                height: 40px;
                width: 100px;
                background-color: #2762f7;
                color: whitesmoke;
                font-size: medium;
                margin-top: 15px;
                vertical-align: central;
                text-align: center;
            }
    </style>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <div id="content">
        <br />
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Panel ID="formatTable" class="st" runat="server" Width="565px">
                    <table style="width: 573px; margin-right: 0px;" cellpadding="5" cellspacing="2" id="formtable">
                        <tr>
                            <td colspan="3" style="text-align: center">
                                <asp:Label ID="Label1" Font-Size="Large" runat="server" Text="Enter details of new books"></asp:Label>
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>

                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Label ID="lblISBN" runat="server" Text="ISBN"></asp:Label>
                            </td>
                            <td style="width: 43px">&nbsp;</td>
                            <td>
                                <asp:TextBox ID="txtIsbn" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rq5" runat="server" ControlToValidate="txtIsbn" Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red" ValidationGroup="store">*</asp:RequiredFieldValidator>
                            </td>

                        </tr>
                        <tr>
                            <td style="height: 34px"></td>
                            <td style="height: 34px">
                                <asp:Label ID="lblBookName" runat="server" Text="BookName"></asp:Label>
                            </td>
                            <td style="height: 34px; width: 43px;"></td>
                            <td style="height: 34px">
                                <asp:TextBox ID="txtbk_name" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rq6" runat="server" ControlToValidate="txtbk_name" Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red" ValidationGroup="store">*</asp:RequiredFieldValidator>
                            </td>

                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Label ID="lblAuthor" runat="server" Text="Author"></asp:Label>
                            </td>
                            <td style="width: 43px">&nbsp;</td>
                            <td>
                                <asp:TextBox ID="txtAuth_name" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rq3" runat="server" ControlToValidate="txtAuth_name" Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red" ValidationGroup="store">*</asp:RequiredFieldValidator>
                            </td>

                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Label ID="lblPublisher" runat="server" Text="Publisher"></asp:Label>
                            </td>
                            <td style="width: 43px">&nbsp;</td>
                            <td>
                                <asp:TextBox ID="txtPublisher" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rq4" runat="server" ControlToValidate="txtPublisher" Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red" ValidationGroup="store">*</asp:RequiredFieldValidator>
                            </td>

                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Label ID="lblCategory" runat="server" Text="Category"></asp:Label>
                            </td>
                            <td style="width: 43px">&nbsp;</td>
                            <td>
                                <asp:DropDownList ID="ddlCat" CssClass="ddstyle" runat="server" Height="23px" Width="128px">
                                    <asp:ListItem>--Select--</asp:ListItem>
                                    <asp:ListItem>Hindi </asp:ListItem>
                                    <asp:ListItem>English</asp:ListItem>
                                    <asp:ListItem>Maths</asp:ListItem>
                                    <asp:ListItem>Chemistry</asp:ListItem>
                                    <asp:ListItem>Physic</asp:ListItem>
                                    <asp:ListItem>Magzine</asp:ListItem>
                                    <asp:ListItem>Novel</asp:ListItem>
                                    <asp:ListItem>Computer</asp:ListItem>
                                    <asp:ListItem>Electrical</asp:ListItem>
                                    <asp:ListItem>Mechanical</asp:ListItem>
                                    <asp:ListItem>Electonics</asp:ListItem>
                                    <asp:ListItem>Civil</asp:ListItem>
                                </asp:DropDownList>
                            </td>

                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Label ID="lblPubYear" runat="server" Text="Published Year"></asp:Label>
                            </td>
                            <td style="width: 43px">&nbsp;</td>
                            <td>
                                <asp:DropDownList ID="ddlYear" CssClass="ddstyle" runat="server" Height="23px" Width="128px">
                                </asp:DropDownList>
                            </td>

                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="No Of Copies"></asp:Label>
                            </td>
                            <td style="width: 43px">&nbsp;</td>
                            <td>
                                <asp:TextBox ID="txtCopies" runat="server"></asp:TextBox>
                                <asp:FilteredTextBoxExtender ID="ftcontact" runat="server" FilterType="Numbers" TargetControlID="txtCopies"></asp:FilteredTextBoxExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCopies" Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red" ValidationGroup="store">*</asp:RequiredFieldValidator>
                            </td>

                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td colspan="2" style="text-align: center; align-items: center">
                                <br />
                                <asp:Button ID="btnSubmit" CssClass="st" runat="server" Text="SUBMIT" ValidationGroup="store" OnClick="btnSubmit_Click" />
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>

                            <td colspan="2">
                                <asp:Label ID="storeMsg" runat="server" Font-Size="Medium" Text=""></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>

                    </table>
                </asp:Panel>
                <asp:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" TargetControlID="formatTable" Radius="12"></asp:RoundedCornersExtender>
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>

</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MasterUser.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="PageUser_MyProfile" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentuser" Runat="Server">
<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>   
     <div id="content">
        <div class="search">
             <table cellpadding="5" cellspacing="2" style="width: 573px; text-align:center; margin-right: 0px;">
                <tr>
                    <th colspan="3">Fill Your Info</th>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>Age</td>
                    <td>
                        <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
                        <asp:FilteredTextBoxExtender ID="ft" runat="server" FilterType="Numbers" TargetControlID="txtAge"></asp:FilteredTextBoxExtender>
                        
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>Designation</td>
                    <td>
                        <asp:TextBox ID="txtDesign" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>Contact No</td>
                    <td>
                        <asp:TextBox ID="txtContact" runat="server"></asp:TextBox>
                        <asp:FilteredTextBoxExtender ID="ftcontact" runat="server" FilterType="Numbers" TargetControlID="txtContact"></asp:FilteredTextBoxExtender>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server" Height="94px" TextMode="MultiLine" Width="270px" CssClass="ddstyle"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="SUBMIT" OnClick="Button1_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="" ></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        
        </div>
           
     </div>

</asp:Content>




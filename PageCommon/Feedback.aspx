<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MasterPage.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="PageCommon_Feedback" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div id="content">
       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>


                <asp:Panel ID="formatTable" class="mycss" runat="server" Width="450px">
                    <table cellpadding="3" cellspacing="2">
                        <tr>
                            <td></td>
                            <td>
                                <p><b><i>FeedBack Form </i></b></p>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <p>Use the form below to get in touch with us. Enter Your Details and feedback here.</p>
                            </td>

                        </tr>
                        <tr>
                            <td>Name</td>
                            <td>
                                <asp:TextBox ID="txtName" runat="server" required="true"></asp:TextBox>
                            </td>
                            <td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td>
                                <asp:TextBox ID="txtEmail" runat="server" required="true" title="Please Enter Valid Email Address" pattern="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:TextBox></td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Contact</td>
                            <td>
                                <asp:TextBox ID="txtContact" runat="server" required="true"></asp:TextBox>

                               
                                <asp:FilteredTextBoxExtender ID="fltrContact" runat="server" FilterType="Numbers" TargetControlID="txtContact"></asp:FilteredTextBoxExtender>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Suggestion Complaint</td>
                            <td>
                                <asp:TextBox ID="txtSuggestion" runat="server" TextMode="MultiLine" required="true" Height="83px" Rows="6" Width="254px" CssClass="ddstyle"></asp:TextBox></td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="lblMsg" runat="server" Font-Size="Medium" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:ImageButton ID="Submit" runat="server" ImageUrl="~/Images/Submit.png" 
                                    OnClick="Submit_Click" Height="48px" Width="137px" /></td>
                            <td></td>
                        </tr>
                    </table>
                </asp:Panel>
        <asp:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" TargetControlID="formatTable" Radius="12"></asp:RoundedCornersExtender>
         </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <p>
            <asp:Label ID="lblMail" runat="server"></asp:Label>
        </p>
    </div>

</asp:Content>




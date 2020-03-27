<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MasterUser.master" AutoEventWireup="true" CodeFile="Setting.aspx.cs" Inherits="PageUser_Setting" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentuser" Runat="Server">

<style type="text/css">
        .fancy-green .ajax__tab_header { background: url('../Images/green_bg_Tab.gif') repeat-x; cursor: pointer; }
        .fancy-green .ajax__tab_hover .ajax__tab_outer, .fancy-green .ajax__tab_active .ajax__tab_outer { background: url('../Images/green_left_Tab.gif') no-repeat left top; }
        .fancy-green .ajax__tab_hover .ajax__tab_inner, .fancy-green .ajax__tab_active .ajax__tab_inner { background: url('../Images/green_right_Tab.gif') no-repeat right top; }
        .fancy .ajax__tab_header { font-size: 13px; font-weight: bold; color: #000; font-family: sans-serif; }
            .fancy .ajax__tab_active .ajax__tab_outer, .fancy .ajax__tab_header .ajax__tab_outer, .fancy .ajax__tab_hover .ajax__tab_outer { height: 46px; }
            .fancy .ajax__tab_active .ajax__tab_inner, .fancy .ajax__tab_header .ajax__tab_inner, .fancy .ajax__tab_hover .ajax__tab_inner { height: 46px; margin-left: 16px; /* offset the width of the left image */ }
            .fancy .ajax__tab_active .ajax__tab_tab, .fancy .ajax__tab_hover .ajax__tab_tab, .fancy .ajax__tab_header .ajax__tab_tab { margin: 16px 16px 0px 0px; }
        .fancy .ajax__tab_hover .ajax__tab_tab, .fancy .ajax__tab_active .ajax__tab_tab { color: #fff; }
        .fancy .ajax__tab_body { font-family: Arial; font-size: 10pt; border-top: 0; border: 1px solid #999999; padding: 8px; background-color: #ffffff; }
       .chpass  input[type="password"] 
       {
        border-radius: 8px;
        border-style: groove;
        padding-left: 3px;
       }
       .chpass input[type="submit"]
        {
            border-radius:8px;
            border-style:groove;
            height:40px;
            width:auto 5px;
            background-color:#2762f7;
           color:whitesmoke;
           font-size:medium;
           margin-top:15px;
           vertical-align:central;
           text-align:center;
           padding:10px;
        }
      </style>
    <div id="content">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <div style="width: 70%">
            <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" CssClass="fancy fancy-green" TabStripPlacement="Top">
                
                <asp:TabPanel ID="TabPanel2" runat="server">
                    <HeaderTemplate>Change Password</HeaderTemplate>
                    <ContentTemplate>
                        <asp:ChangePassword ID="ChangePassword1" runat="server" Height="300px" CancelDestinationPageUrl="~/PageUser/MyProfile.aspx" ContinueDestinationPageUrl="~/PageUser/MyProfile.aspx" CssClass="chpass"></asp:ChangePassword>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="TabPanel3" runat="server">
                    <HeaderTemplate>Delete Account</HeaderTemplate>
                    <ContentTemplate>
                        <asp:Panel ID="pnlDetails" runat="server">
                            <p>
                                Please Check You account details : &nbsp;&nbsp;&nbsp;&nbsp;
                               <asp:Button ID="btnCheckDeatails" runat="server" Text="Check Details" OnClick="btnCheckDeatails_Click" />
                            </p>
                        </asp:Panel>
                        <asp:GridView ID="gvAccDetails" runat="server">
                            <EmptyDataTemplate>
                                <asp:Label ID="Label1" runat="server" Font-Size="Medium" Text="Your Account Is Clear . " ForeColor="Green"></asp:Label>
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <p style="height: 29px; width: 430px;">
                            <asp:Label ID="lblmsg" runat="server" Text="Do You Want To Delete Your Account Permanently .. ?" Visible="false"></asp:Label>
                        </p>
                        <asp:Panel ID="pnlConfirm" runat="server" Visible="false">
                            <p>
                                <asp:Button ID="btnyes" runat="server" Text=" Yes " ForeColor="#ff0000" Font-Bold="true" Font-Size="Medium" OnClick="btnyes_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnNo" runat="server" Text=" No " ForeColor="Green" Font-Bold="true" Font-Size="Medium" OnClick="btnNo_Click" />
                            </p>
                            <p style="height: 20px;">
                                <asp:Label ID="lblMsg1" Visible="false" Text="lbl1" runat="server"></asp:Label>
                            </p>
                            <p style="height: 20px;">
                                <asp:Label ID="lblMsg2" Visible="false" runat="server" Text="Label"></asp:Label>
                            </p>
                            <p style="height: 20px;">
                                <asp:Label ID="lblMsg3" Visible="false" runat="server" Text="Label"></asp:Label>
                            </p>

                        </asp:Panel>
                    </ContentTemplate>
                </asp:TabPanel>
                
            </asp:TabContainer>
        </div>

    </div>

</asp:Content>



<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MasterUser.master" AutoEventWireup="true" CodeFile="UserReturnBook.aspx.cs" Inherits="PageUser_UserReturnBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentuser" Runat="Server">
<div id="content">
        <table cellpadding="3" cellspacing="2">
            <tr>
                <td>
                    <p>Click Here For View The Status Of The Book</p>
                </td>
                <td>&nbsp;&nbsp;</td>
                <td>
                    <asp:Button ID="btnNotify" runat="server" Text="Status" OnClick="btnNotify_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl" runat="server" Text="Label" Visible="false"></asp:Label>
                </td>
                <td>&nbsp;&nbsp;</td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblBook" runat="server" Text="BookName" Visible="false"></asp:Label></td>
                <td colspan="2">&nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblReturnDate" runat="server" Visible="false" Text="ReturnDate"></asp:Label>
                </td>
                <td colspan="2">&nbsp;</td>
            </tr>
        </table>
        <br />
        <p>
            <asp:Label ID="lblMsg1" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="lblMsg2" runat="server" Visible="false"></asp:Label>
        </p>
        <p>
            <asp:Label ID="lblMsg3" runat="server" Visible="false"></asp:Label>
        </p>
        <asp:GridView ID="gvRetBook" runat="server" AllowPaging="true" PageSize="5" Width="650px" >
            <HeaderStyle BackColor="#df5015" Font-Bold="true" ForeColor="White" />
                <PagerSettings Mode="NumericFirstLast" FirstPageText="First" PreviousPageText="Previous" NextPageText="Next" LastPageText="Last" />
                <PagerStyle BackColor="#7779AF" Font-Bold="true" ForeColor="White" />
            
            <EmptyDataTemplate>
                <p style="color:green">
                    You have Not issued any book. <br />
                    To Issue a book Click on <asp:HyperLink ID="HyperLink1" NavigateUrl="~/PageUser/Issue.aspx" runat="server">Issue Books</asp:HyperLink>
                </p>
            </EmptyDataTemplate>
        </asp:GridView>
    </div>
</asp:Content>



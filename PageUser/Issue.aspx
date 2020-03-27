<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MasterUser.master" AutoEventWireup="true" CodeFile="Issue.aspx.cs" Inherits="PageUser_Issue" %>

<%@ Register Assembly="obout_Calendar2_Net" Namespace="OboutInc.Calendar2" TagPrefix="obout" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentuser" Runat="Server">

<script type="text/javascript">
    function CheckForPastDate(sender, args) {
        var selectedDate = new Date();
        selectedDate = sender._selectedDate;
        var todayDate = new Date();


        if (selectedDate.getDateOnly() <= todayDate.getDateOnly()) {
            alert('Date Cannot be in the past or current date');
            sender._textbox.set_Value(null);

        }


    }
    function moredate() {
        alert('date can not be more than 20 days');
    }
    </script>
  
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div id="content">
        <div class="search">
            <table style="width: 100%" class="tabStyle">
                <tr>
                    <td colspan="3">Search On The Basis Of</td>
                </tr>
                <tr>
                    <td>Book Name :
                    <asp:TextBox ID="txtBookname" runat="server" placeholder="Book Name"></asp:TextBox></td>
                    <td>Author Name :
                    <asp:TextBox ID="txtAuthorname" runat="server" placeholder="Author Name"></asp:TextBox></td>
                    <td>Category :
                    <asp:DropDownList ID="dlCategory" runat="server" CssClass="ddstyle">
                        <asp:ListItem>-Select-</asp:ListItem>
                        <asp:ListItem>Hindi </asp:ListItem>
                        <asp:ListItem>English</asp:ListItem>
                        <asp:ListItem>Maths</asp:ListItem>
                        <asp:ListItem>Chemistry</asp:ListItem>
                        <asp:ListItem>Physic</asp:ListItem>
                        <asp:ListItem>Magzine</asp:ListItem>
                        <asp:ListItem>Novel</asp:ListItem>
                        <asp:ListItem>Computer</asp:ListItem>
                    </asp:DropDownList></td>
                </tr>
                <tr>
                    <td colspan="3">
                        <center><asp:ImageButton ID="imgSearchbooks" runat="server" ImageUrl="~/Images/search.png" OnClick="imgSearchbooks_Click"></asp:ImageButton></center>
                    </td>
                </tr>

            </table>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblretur" runat="server" Text="Select Returning Date Of Book"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>

                        <asp:TextBox ID="txtDate" runat="server" OnTextChanged="txtDate_TextChanged"></asp:TextBox></td>
                    <td>
                        <asp:ImageButton ID="imgCalender" runat="server" ImageUrl="~/Images/Calendar.png" ToolTip="Select a Date" />
                        <asp:CalendarExtender ID="calShow" Format="dd/MM/yyyy" runat="server" PopupButtonID="imgCalender" PopupPosition="BottomLeft" TargetControlID="txtDate" OnClientDateSelectionChanged="CheckForPastDate"></asp:CalendarExtender>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblDateChk" runat="server" Visible="false"></asp:Label></td>
                    <td colspan="2">&nbsp;&nbsp;</td>
                </tr>
            </table>
            <br />
        </div>
        <asp:Panel ID="pnlBookShow" runat="server">
            <asp:Label ID="lblBookStatus" runat="server" Text="Select the book you want to issue" Visible="false"></asp:Label>
            <asp:GridView ID="grdBookList" runat="server" RowStyle-HorizontalAlign="Center" Width="734px" PageSize="10" AllowPaging="true" OnSelectedIndexChanged="grdBookList_SelectedIndexChanged" OnPageIndexChanging="grdBookList_PageIndexChanging" CssClass="gridStyle" HorizontalAlign="Center">
                <HeaderStyle BackColor="#df5015" Font-Bold="true" ForeColor="White" />
                <PagerSettings Mode="NumericFirstLast" FirstPageText="First" PreviousPageText="Previous" NextPageText="Next" LastPageText="Last" />
                <PagerStyle BackColor="#7779AF" Font-Bold="true" ForeColor="White" />
                <Columns>
                    <asp:CommandField ButtonType="Button" ControlStyle-ForeColor="Green" SelectText="Request" ShowSelectButton="true" />
                </Columns>
                <EmptyDataTemplate>
                    <asp:Label ID="Label1" runat="server" Text="Book Is Not Available..please request any other books." ForeColor="Red"></asp:Label>
                </EmptyDataTemplate>
            </asp:GridView>
            <br />
            <asp:Label ID="lblReq" runat="server" ForeColor="Green" Visible="False"></asp:Label>
            <br />
            <asp:Label ID="lblmsg" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        </asp:Panel>
    </div>
</asp:Content>


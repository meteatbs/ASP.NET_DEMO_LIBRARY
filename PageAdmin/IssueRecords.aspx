<%@ Page Title="" Language="C#" MasterPageFile="~/Master/AdminMaster.master" AutoEventWireup="true" CodeFile="IssueRecords.aspx.cs" Inherits="PageAdmin_IssueRecords" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentuser" Runat="Server">

<div id="content">
        <p style="color:green"><b>Issue The Following Books .. </b></p><br />
        <asp:GridView ID="gdIssue" runat="server" Width="700" AllowPaging="true" PageSize="10" OnSelectedIndexChanged="gdIssue_SelectedIndexChanged" OnPageIndexChanging="gdIssue_PageIndexChanging">
            <HeaderStyle BackColor="#df5015" Font-Bold="true" ForeColor="White" />
                <PagerSettings Mode="NumericFirstLast" FirstPageText="First" PreviousPageText="Previous" NextPageText="Next" LastPageText="Last" />
                <PagerStyle BackColor="#7779AF" Font-Bold="true" ForeColor="White" />
            <Columns>
                <asp:CommandField ButtonType="Button" ControlStyle-ForeColor="Green" SelectText="ISSUE" ShowSelectButton="true" />
            </Columns>
            <EmptyDataTemplate>
                <asp:Label ID="Label1" ForeColor="Green" Font-Size="Large" runat="server" Text="No Request Found To Issue The Book.."></asp:Label>
            </EmptyDataTemplate>
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:Label ID="lblMsg" runat="server" Text="" Visible="false"></asp:Label>
    </div>
</asp:Content>



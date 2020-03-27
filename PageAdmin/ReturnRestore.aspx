<%@ Page Title="" Language="C#" MasterPageFile="~/Master/AdminMaster.master" AutoEventWireup="true" CodeFile="ReturnRestore.aspx.cs" Inherits="PageAdmin_ReturnRestore" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentuser" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
 <style type="text/css">
        .headPane {
            background-color: Olive;
            font-size: xx-large;
            font-weight: 200;
            margin: 2px 20px 2px 15px;
            border-top-left-radius: 7px;
            border-top-right-radius: 7px;
            text-align: center;
        }

        .bodyPane {
            margin-left: 25px;
            margin-top: 5px;
            margin-bottom: 5px;
        }
    </style>
    <div id="content">

        <asp:Accordion ID="Accordion1" runat="server" SelectedIndex="0" AutoSize="None"
            FadeTransitions="true" TransitionDuration="300" FramesPerSecond="25">
            <Panes>
                <asp:AccordionPane ID="AccordionPane1" runat="server">
                    <Header>
                        <br />
                        <div class="headPane">
                            Issued History
                        </div>
                    </Header>
                    <Content>
                        <div class="bodyPane">

                            <p style="float: right; margin-right: 30px; margin-left: 2px;">
                                <asp:ImageButton ID="imgPDF" runat="server" ImageUrl="~/Images/pdf.png" OnClick="imgPDF_Click" /><br />
                                <asp:ImageButton ID="imgExcel" runat="server" ImageUrl="~/Images/excel.png" OnClick="imgExcel_Click" />
                            </p>
                            <br />
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="GridIssue" AllowPaging="true" PageSize="10" Width="800px"
                                        runat="server" CssClass="grid" HeaderStyle-BackColor="#3AC0F2"
                                        HeaderStyle-ForeColor="White" AutoGenerateColumns="false"
                                        RowStyle-HorizontalAlign="Center" OnPageIndexChanging="GridIssue_PageIndexChanging">

                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <EmptyDataTemplate>
                                            <p style="margin-left: 10px;">No Book Has Been Issued Yet.</p>
                                        </EmptyDataTemplate>
                                        <Columns>
                                            <asp:BoundField DataField="Issue ID" HeaderText="Issue ID" />
                                            <asp:BoundField DataField="Issue Date" HeaderText="Issue Date" DataFormatString="{0:dd-MM-yyyy}" />
                                            <asp:BoundField DataField="Return Date" HeaderText="Return Date" DataFormatString="{0:dd-MM-yyyy}" />
                                            <asp:BoundField DataField="User Name" HeaderText="User Name" />
                                            <asp:BoundField DataField="Book Name" HeaderText="Book Name" />
                                            <asp:BoundField DataField="Category" HeaderText="Category" />
                                            <asp:BoundField DataField="ActualReturnDate" HeaderText="Actual Return Date" DataFormatString="{0:dd-MM-yyyy}" />
                                        </Columns>
                                    </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>
                    </Content>
                </asp:AccordionPane>
                <asp:AccordionPane runat="server" ID="acd2">
                    <Header>
                        <div class="headPane">
                            Restore Books
                        </div>
                    </Header>
                    <Content>
                        <div class="bodyPane">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:GridView ID="GridReturned" Width="800px" DataSourceID="sdSource" runat="server" OnSelectedIndexChanged="GridReturned_SelectedIndexChanged">
                                        <EmptyDataTemplate>
                                            <p>Books Are Not Required To Return At Present.</p>
                                        </EmptyDataTemplate>
                                        <Columns>
                                            <asp:CommandField ButtonType="Button" SelectText="Return" ShowSelectButton="true" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="sdSource" runat="server" SelectCommand="select Issue_ID,BID,UserName,BookName,IssueDate,ReturnDate from IssueRecords where ActualReturnDate is null" ConnectionString="<%$ConnectionStrings:connect %>"></asp:SqlDataSource>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </Content>
                </asp:AccordionPane>
            </Panes>
        </asp:Accordion>

    </div>
</asp:Content>



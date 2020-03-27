<%@ Page Title="" Language="C#" MasterPageFile="~/Master/AdminMaster.master" AutoEventWireup="true" CodeFile="ViewInformation.aspx.cs" Inherits="PageAdmin_ViewInformation" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentuser" Runat="Server">
 <style>
        .ModPop {
            background-color: #FFFFFF;
            width: 350px;
            border: 3px solid #0DA9D0;
        }

            .ModPop .popHead {
                background-color: #2FBDF1;
                height: 30px;
                color: white;
                line-height: 30px;
                text-align: center;
                font-weight: bold;
            }

            .ModPop .popBody {
                min-height: 70px;
                text-align: center;
                padding: 5px;
                line-height: 30px;
            }

            .ModPop .popFoot {
                padding: 3px;
            }

            .button
             {
                height: 23px;
                color: White;
               
                text-align: center;
                font-weight: bold;
                cursor: pointer;
                background-color: #0099FF;
                border: 1px solid #5C5C5C;
                margin-top:2px;
                margin-bottom:3px;
                border-radius:6px;
                border-style:groove;
                box-shadow:white 2px 2px;
             }

            .ModPop td 
            {
                text-align: left;
            }

        .GridStyle {
            text-align: center;
        }
    </style>




    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div id="content">
        <p>
            <asp:Button ID="btnUsrInfo" runat="server" CssClass="button" Text="View Users" OnClick="btnUsrInfo_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnBookInfo" runat="server" CssClass="button" Text="View Books"  OnClick="btnBookInfo_Click" />
        </p>
        <br />

        <asp:Panel ID="PanelUser" runat="server" Visible="false">
            <div id="DivUser" class="InfoStyle">
               
                <asp:GridView ID="GridView1" Width="585px" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="UserName" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
                    OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="GridStyle" OnRowDeleting="GridView1_RowDeleting">
                    <EmptyDataTemplate>
                        <asp:Label ID="lblEmpty" runat="server" Text="No Users Founds"></asp:Label>
                    </EmptyDataTemplate>
                    <Columns>
                        <asp:BoundField HeaderText="UserName" ReadOnly="true" DataField="UserName" />
                        <asp:BoundField HeaderText="Name" DataField="Fullname" />
                        <asp:BoundField HeaderText="Email" DataField="EmailID" />
                        <asp:BoundField HeaderText="ContactNo" DataField="ContactNo" />
                        <asp:CommandField ShowDeleteButton="true" />
                        <asp:ButtonField Text="Select" CommandName="Select" />
                    </Columns>
                    <HeaderStyle BackColor="#3AC0F2" ForeColor="White" />
                </asp:GridView>
                <br /><br />
                <asp:Label ID="lblError" runat="server" Visible="false" Text=""></asp:Label>
            </div>
        </asp:Panel>
        <asp:LinkButton ID="lnkFake" runat="server"></asp:LinkButton>
        <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="pnlPop" TargetControlID="lnkFake"
            CancelControlID="btnPop" BackgroundCssClass="modBack">
        </asp:ModalPopupExtender>
        <asp:Panel ID="pnlPop" runat="server" CssClass="ModPop" Style="display: none">
            <div class="popHead">
                Details
            </div>
            <div class="PopBody" style="padding-left: 5px; padding-top: 3px;">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="width: 100px">
                            <b>Name : </b>
                        </td>
                        <td>
                            <asp:Label ID="lblName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Age : </b>
                        </td>
                        <td>
                            <asp:Label ID="lblAge" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Designation : </b>
                        </td>
                        <td>
                            <asp:Label ID="lblDesign" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Contact : </b>
                        </td>
                        <td>
                            <asp:Label ID="lblContact" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Address : </b>
                        </td>
                        <td>
                            <asp:Label ID="lblAdd" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="popFoot" align="right">
                <asp:Button ID="btnPop" runat="server" Text="Close" CssClass="button" />
            </div>
        </asp:Panel>

        <asp:Panel ID="PanelBook" runat="server" Visible="false">
            <div id="divBook" class="InfoStyle">
                
                <asp:GridView ID="GridBook" DataKeyNames="BID"  HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" runat="server" AutoGenerateColumns="False" Width="820px" OnSelectedIndexChanged="GridBook_SelectedIndexChanged" OnRowDeleting="GridBook_RowDeleting">
                    <Columns>
                        <asp:BoundField Visible="false" ReadOnly="true" DataField="Book_ID" HeaderText="Book ID" />
                        <asp:BoundField DataField="ISBN" HeaderText="ISBN" />
                        <asp:BoundField DataField="BookName" HeaderText="Book" />
                        <asp:BoundField DataField="AuthorName" HeaderText="Author" />
                        <asp:BoundField DataField="Publisher" HeaderText="Publisher" />
                        <asp:BoundField DataField="Category" HeaderText="Category" />
                        <asp:BoundField DataField="PublishYear" HeaderText="Year" />
                        <asp:BoundField DataField="Available" HeaderText="Available" />
                        <asp:BoundField DataField="Requested" HeaderText="Requested" />
                        <asp:BoundField DataField="Copies" HeaderText="Copies" />
                        
                         <asp:CommandField ShowDeleteButton="True" />
                        <asp:CommandField ShowSelectButton="True" />
                      
                    </Columns>
                    
                </asp:GridView>
               
            </div>

            <asp:LinkButton ID="lnkFaBook" runat="server"></asp:LinkButton>
            <asp:ModalPopupExtender ID="ModalPopupExtender2" runat="server" PopupControlID="PnlBook" TargetControlID="lnkFaBook"
            CancelControlID="btnBkPop" BackgroundCssClass="modBack"></asp:ModalPopupExtender>
            <asp:Panel ID="PnlBook" runat="server" CssClass="ModPop" Style="display: none">
                <div class="popHead">
                Details
            </div>
            <div class="PopBody" style="padding-left: 5px; padding-top: 3px;">
                <table border="0" cellpadding="3" cellspacing="3">
                    <tr>
                        <td style="width: 100px">
                            <b>ISBN : </b>
                        </td>
                        <td>
                            <asp:TextBox ID="txtBkIsbn" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Book : </b>
                        </td>
                        <td>
                            <asp:TextBox ID="txtBkName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td >
                            <b>Author : </b>
                        </td>
                        <td>
                            <asp:TextBox ID="txtBkAuthor" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <b>Publisher: </b>
                        </td>
                        <td>
                            <asp:TextBox ID="txtBkPublisher" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                      <tr>
                        <td>
                            <b>Category: </b>
                        </td>
                        <td>
                             <asp:DropDownList ID="ddBkCat" CssClass="ddstyle" runat="server" Height="23px" Width="128px">
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
                        <td>
                            <b>Publish Year: </b>
                        </td>
                        <td>
                             <asp:DropDownList ID="ddBkYear" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <b>Available: </b>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="radBkAvail" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True">True</asp:ListItem>
                                <asp:ListItem>False</asp:ListItem>  
                            </asp:RadioButtonList>
                        </td>
                    </tr> 
                   <tr>
                        <td>
                            <b>Requested: </b>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="radBkReq" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True">True</asp:ListItem>
                                <asp:ListItem>False</asp:ListItem>  
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                     <tr>
                        <td >
                            <b>No Of Copies : </b>
                        </td>
                        <td>
                            <asp:TextBox ID="txtBkCopies" runat="server"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" 
                                runat="server" FilterType="Numbers" TargetControlID="txtBkCopies">

                            </asp:FilteredTextBoxExtender>
                        </td>
                    </tr>
                </table>
            </div>
                <div class="popFoot">
                    <table style="width:100%;">
                        <tr>
                            <td style="width:50%; text-align:center;">
                                 <asp:Button ID="btnBkEdit" runat="server" CssClass="button" OnClick="btnBkEdit_Click"  Text="Update"  />
                            </td>
                            <td>
                                <asp:Button ID="btnBkPop"  runat="server" Text="Close" CssClass="button" />
                               
                            </td>
                        </tr>
                        
                    </table>
                    
                    
                </div>
            </asp:Panel>
        </asp:Panel>
      
    </div>
</asp:Content>



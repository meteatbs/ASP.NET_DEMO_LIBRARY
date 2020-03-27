<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="PageCommon_Search" %>
<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="content">
    <div class="search">

         <br />
            <center><p><b> Search Books </b> </p> </center>
            <table style="width: 100%">
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
                    <asp:Label ID="Label1" runat="server" ></asp:Label>
                    <center><asp:ImageButton ID="imgSearchbooks" runat="server" 
                            ImageUrl="~/Images/search.png" OnClick="imgSearchbooks_Click" Height="41px" 
                            Width="234px"></asp:ImageButton></center>
                </td>
            </tr>
           
        </table>
    
    </div>

     <asp:Panel ID="Panel1" runat="server" Visible="false">
                     <asp:Label ID="lblmsg" runat="server" Text="Please Enter BookName or AuthorName or Select the category"></asp:Label>
            </asp:Panel>


             <asp:Panel ID="gpanel" runat="server" Visible="false">
             
             <cc1:Grid ID="GridShow" runat="server" AllowPaging="true" AllowPageSizeSelection="true" Serialize="true" AutoGenerateColumns="false" AllowAddingRecords="false" >
                
                <Columns>
                <cc1:Column ID="ISBN" HeaderText="ISBN" DataField="ISBN" ReadOnly="true"></cc1:Column>
                <cc1:Column ID="BookName" HeaderText="Book Name" DataField="BookName" ReadOnly="true"></cc1:Column>
                <cc1:Column ID="AuthorName" HeaderText="Author Name" DataField="AuthorName" ReadOnly="true"></cc1:Column>
                <cc1:Column ID="Category" HeaderText="Category" DataField="Category" ReadOnly="true"></cc1:Column>
                <cc1:Column ID="Book_ID" HeaderText="Book ID" DataField="Book_ID" ReadOnly="true"></cc1:Column>
            </Columns>
             
             
             
             
             
             
             </cc1:Grid>
             
             
             </asp:Panel>


</div>



</asp:Content>




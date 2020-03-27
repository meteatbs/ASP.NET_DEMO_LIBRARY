<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="PageCommon_login" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
.myt
{
    color:#F5F5F5; 
    width:450px; 
            text-align:left; 
            background-color:#00C6C6; 
            border-radius:12px; 
            opacity:80; 
            padding:10px; 
            font-size: medium;
            font-weight: 500; 
            font-family: 'Palatino Linotype';
}
.conto input[type="text"],input[type="password"],input[type="label"]
        {
            border-radius:7px;
            border-style:groove;
            padding-left:15px;
            height:20px;
            box-shadow: 0 0 5px #333;
            outline: none;
            border: 1px solid #ffa853;
            margin-top:15px;
            
        }
         .conto input[type="submit"]
        {
            border-radius:8px;
            border-style:groove;
            height:30px;
            width:100px;
            background-color:#2762f7;
           color:whitesmoke;
           font-size:medium;
           margin-top:15px;
        }
        .lab
        {
          margin-top:15px;  
        }

</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" >

</asp:ToolkitScriptManager>
 <div id="content">
        <div id="log" class="myt" style="width:410px;display:block;float:left; ">
          <asp:Login ID="Login1" runat="server" CssClass="conto" DisplayRememberMe="False" EnableViewState="True" DestinationPageUrl="~/PageCommon/index.aspx" Height="210px" Width="350px">
              <LabelStyle CssClass="lab" VerticalAlign="Middle" />
            </asp:Login>
        </div>
        <div id="reg" style="display:block; width:280px; padding-top:50px; padding-left:20px; height:165px; border-radius:12px; margin-left:470px" class="myt">
            <asp:Panel ID="pnlReg" runat="server">
                <table>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                      <center> <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/new user.png" /> </center> 
                    </td>
                </tr>
                    <tr>
                        <td>&nbsp;&nbsp;</td>
                        <td  style="color:whitesmoke"><marquee> <b><i> Register Here</i></b></marquee></td>
                        
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;</td>
                        <td>
                            <asp:HyperLink ID="hplReg" Font-Size="Medium" NavigateUrl="~/PageCommon/NewUser.aspx"  runat="server">Registration</asp:HyperLink>
<br>
<a href="https://github.com/meteatbs">Visit My Github</a>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            
        </div>
    </div>


</asp:Content>


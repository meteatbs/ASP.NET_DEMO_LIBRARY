<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MasterPage.master" AutoEventWireup="true" CodeFile="NewUser.aspx.cs" Inherits="PageCommon_NewUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
 #myStyle
        {
            color:#F5F5F5; width:450px; 
            text-align:left; 
            background-color:#00C6C6; 
            border-radius:12px; 
            opacity:80; 
            padding:10px; 
            font-size: medium;
            font-weight: 500; 
            font-family: 'Palatino Linotype';
        }
        .conto input[type="text"],input[type="password"]
        {
            border-radius:7px;
            border-style:groove;
            padding-left:10px;
            height:18px;
            box-shadow: 0 0 5px #333;
            outline: none;
            border: 1px solid #ffa853;
            
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
        }
        

</style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="content">
    <div id="myStyle">  
         <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" CellPadding="15" CellSpacing="15" ContinueDestinationPageUrl="~/PageUser/MyProfile.aspx" Width="464px" CssClass="conto" Height="454px">
                <LabelStyle HorizontalAlign="Left" />
                <WizardSteps>
                    <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                    </asp:CreateUserWizardStep>
                    <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                    </asp:CompleteWizardStep>
                </WizardSteps>
            </asp:CreateUserWizard>
    
    </div>

</div>
</asp:Content>


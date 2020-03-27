<%@ Page Title="" Language="C#" MasterPageFile="~/Master/AdminMaster.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="PageAdmin_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentuser" Runat="Server">

 <div id="content">
        <p style="width:580px;line-height:1.8em">
            You Have All The Administrator Rights.&nbsp;You Can <span style="color:green">Add, Delete, Modify </span> Any Book&#39;s Information.<br />
            Borrowers Information Has Been Stored In The WebSite, Which Helps You To Contact Them Easily.
        </p>
        <p style="width:580px;line-height:1.8em; color:green;font-size:medium">
            The Various Task Which You Can Perform Through This Account Are :
        </p>
        <ul style="color:red;">
            <li>
                <p>View, Insert, Edit, Delete Book&#39;s Information.</p>
            </li>
             <li>
                <p>Issue Book To The Users.</p>
            </li>
             <li>
                <p>Restore The Books Returned By The Users.</p>
            </li>
             <li>
                <p>View, Delete, User&#39;s Information.</p>
            </li>
        </ul>
    </div>
</asp:Content>


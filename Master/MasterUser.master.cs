using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Master_MasterUser : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Page.User.Identity.Name == string.Empty)
        {
            Response.Redirect("~/PageCommon/login.aspx");

        }
        else
        {
            LoginView logInView = (LoginView)this.Master.FindControl("HeadLoginView");

            HyperLink rdirect = (HyperLink)logInView.FindControl("HyperLink1");
            rdirect.NavigateUrl = "~/PageUser/MyProfile.aspx";
        }
    }
}

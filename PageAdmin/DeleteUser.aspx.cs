using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

using System.Web.UI.WebControls;

public partial class PageAdmin_DeleteUser : System.Web.UI.Page
{
    string str = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    SqlConnection con;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnDelReq_Click(object sender, EventArgs e)
    {
        con = new SqlConnection(str);
        delInfo.Visible = true;
        gvDelete.Visible = true;
        gvdeleteduser.Visible = false;
        lblDelInfo.Visible = false;
        try
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from DeleteRequest", con);
            DataSet ds = new DataSet();
            da.Fill(ds, "DeleteRequest");
            gvDelete.DataSource = ds;
            gvDelete.DataBind();
        }
        catch
        {
            lbldelete.Visible = true;
            lbldelete.Text = "No request to delete the account";
            lbldelete.ForeColor = Color.Green;
        }
    }
    protected void btnDeleted_Click(object sender, EventArgs e)
    {
        con = new SqlConnection(str);
        lblDelInfo.Visible = true;
        gvdeleteduser.Visible = true;
        gvDelete.Visible = false;
        delInfo.Visible = false;
        SqlDataAdapter adpDeleted = new SqlDataAdapter("select * from DeleteAccount", con);
        DataSet ds = new DataSet();
        adpDeleted.Fill(ds, "DeleteAccount");
        gvdeleteduser.DataSource = ds;
        gvdeleteduser.DataBind();
    }
    protected void gvDelete_SelectedIndexChanged(object sender, EventArgs e)
    {
        con = new SqlConnection(str);
        try
        {
            string usrname = gvDelete.SelectedRow.Cells[1].Text;
            string usremail = gvDelete.SelectedRow.Cells[2].Text;
            con.Open();
            SqlCommand delMember = new SqlCommand("delete dbo.aspnet_Membership where email=@em", con);
            delMember.Parameters.AddWithValue("@em", usremail);
            SqlCommand delUser = new SqlCommand("delete dbo.aspnet_Users where Username='" + usrname + "'", con);
            SqlCommand dellibuser = new SqlCommand("delete Library_User where UserName='" + usrname + "'", con);
            SqlCommand delReq = new SqlCommand("delete DeleteRequest where UserName='" + usrname + "'", con);
            int Menbr = delMember.ExecuteNonQuery();
            int usr = delUser.ExecuteNonQuery();
            int libuser = dellibuser.ExecuteNonQuery();
            int req = delReq.ExecuteNonQuery();
            if ((Menbr >= 1) & (usr >= 1) & (libuser >= 1))
            {
                lbldelete.Text = "Account of " + usrname + " has been deleted successfully";
                lbldelete.Visible = true;
                lbldelete.ForeColor = Color.Green;
            }
            else
            {
                lbldelete.Text = "Account of " + usrname + " has not been deleted successfully. Please try again later.";
                lbldelete.Visible = true;
                lbldelete.ForeColor = Color.Red;
            }

        }
        catch
        {
            lbldelete.Text = "Account has not been deleted successfully. Please try again later.";
            lbldelete.Visible = true;
            lbldelete.ForeColor = Color.Red;
        }
    }
}
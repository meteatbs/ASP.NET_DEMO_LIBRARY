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

public partial class PageUser_Setting : System.Web.UI.Page
{
    string str = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnCheckDeatails_Click(object sender, EventArgs e)
    {
        string name = Page.User.Identity.Name;
        SqlConnection con = new SqlConnection(str);
        con.Open();
        SqlDataAdapter adpCheck = new SqlDataAdapter("select BookName,ReturnDate,ActualReturnDate from IssueRecords where UserName='" + name + "' and ActualReturnDate is null ", con);

        DataSet ds = new DataSet();
        adpCheck.Fill(ds, "IssueRecords");
        gvAccDetails.DataSource = ds;
        gvAccDetails.DataBind();


        if (ds.Tables[0].Rows.Count == 0)
        {
            pnlConfirm.Visible = true;
            lblmsg.Visible = true;
        }
        else
        {
            pnlConfirm.Visible = false;
            lblmsg.Text = "You Can Not Delete Your Account.. Please Clear All Your Account Details.";
            lblmsg.Visible = true;
            lblmsg.ForeColor = Color.Red;
        }
        con.Close();
    }

    protected void btnyes_Click(object sender, EventArgs e)
    {
        string name = Page.User.Identity.Name;
        SqlConnection con = new SqlConnection(str);
        con.Open();
        lblMsg1.Text = "Please, Clear All Your Account Details ..!!";
        lblMsg2.Text = "Your Request Has Been Sent To Admin.. !!";
        lblMsg2.Visible = true;
        lblMsg1.Visible = true;
        lblMsg1.ForeColor = Color.Red;
        lblMsg2.ForeColor = Color.Green;
        SqlDataAdapter adpusrMail = new SqlDataAdapter("Select UserName,EmailID from Library_User where UserName='" + name + "'", con);
        DataSet dsuser = new DataSet();
        adpusrMail.Fill(dsuser, "Library_User");
        string Umail = dsuser.Tables[0].Rows[0]["EmailID"].ToString();
        SqlCommand cmdInsert = new SqlCommand("insert into DeleteRequest values ('" + name + "','" + Umail + "',default)", con);
        int insertFalg = cmdInsert.ExecuteNonQuery();
    }

    protected void btnNo_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserHome.aspx");
    }

}
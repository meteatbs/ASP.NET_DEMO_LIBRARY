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
using System.Net.Mail;

public partial class PageCommon_Feedback : System.Web.UI.Page
{
    string str = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Submit_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(str);
            con.Open();
            SqlCommand insert = new SqlCommand("insert into Feedback (Name,Email,ContactNo,Comments,PostingDate) values (@1,@2,@3,@4,@5)", con);
            insert.Parameters.AddWithValue("@1", txtName.Text);
            insert.Parameters.AddWithValue("@2", txtEmail.Text);
            insert.Parameters.AddWithValue("@3", txtContact.Text);
            insert.Parameters.AddWithValue("@4", txtSuggestion.Text);
            insert.Parameters.AddWithValue("@5", DateTime.Today);
            int flag = insert.ExecuteNonQuery();
            if (flag > 0)
            {
                lblMsg.Text = "Thanx for your valuable feedback";
                lblMsg.Visible = true;
                lblMsg.ForeColor = Color.Green;
                txtName.Text = "";
                txtEmail.Text = "";
                txtContact.Text = "";
                txtSuggestion.Text = "";

            }
        }
        catch
        {
            lblMsg.Text = "Your feedback could not be submitted. please try again";
            lblMsg.Visible = true;
            lblMsg.ForeColor = Color.Red;
            txtName.Text = "";
            txtEmail.Text = "";
            txtContact.Text = "";
            txtSuggestion.Text = "";
        }
    }
}
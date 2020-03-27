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
public partial class PageAdmin_StoreInfo : System.Web.UI.Page
{
    string str = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            addYear();
        }
    }
    private void addYear()
    {
        int x = DateTime.Now.Year;
        List<string> str = new List<string>();

        for (int i = x; i >= 1975; i--)
        {

            str.Add(i.ToString());
        }

        ddlYear.DataSource = str;
        ddlYear.DataBind();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(str);
            con.Open();
            Label2.Text = ddlYear.SelectedItem.ToString();
            string df = ddlYear.SelectedItem.ToString();
            SqlCommand cmd = new SqlCommand("insert into InfoBook (ISBN,BookName,AuthorName,Publisher,Category,PublishYear,Copies) values (@1,@2,@3,@4,@5,@6,@7) ", con);

            cmd.Parameters.AddWithValue("@1", txtIsbn.Text);
            cmd.Parameters.AddWithValue("@2", txtbk_name.Text);
            cmd.Parameters.AddWithValue("@3", txtAuth_name.Text);
            cmd.Parameters.AddWithValue("@4", txtPublisher.Text);
            cmd.Parameters.AddWithValue("@5", ddlCat.SelectedValue);
            cmd.Parameters.AddWithValue("@6", df);
            cmd.Parameters.AddWithValue("@7", txtCopies.Text);
            //cmd.Parameters.AddWithValue("@7", true);
            //cmd.Parameters.AddWithValue("@8", false);
            int i = cmd.ExecuteNonQuery();
            if (i >= 1)
            {
                txtIsbn.Text = "";
                txtbk_name.Text = "";
                txtAuth_name.Text = "";
                txtPublisher.Text = "";
                ddlCat.SelectedIndex = 0;
                ddlYear.SelectedIndex = 0;
                txtCopies.Text = "";
                storeMsg.Text = "Data Stored Successfully.";
                storeMsg.ForeColor = Color.Green;
            }
            con.Close();
        }
        catch (Exception exp)
        {
            storeMsg.Text = exp.Message;
        }
    }
}
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

public partial class PageCommon_Search : System.Web.UI.Page
{

    SqlConnection con;
    SqlCommand cmd;
    string str = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void imgSearchbooks_Click(object sender, ImageClickEventArgs e)
    {
        DataSet ds = new DataSet();
        if (txtBookname.Text == string.Empty && txtAuthorname.Text == string.Empty && dlCategory.SelectedValue == "-Select-")
        {
            Panel1.Visible = true;
            lblmsg.Visible = true;
            lblmsg.ForeColor = System.Drawing.Color.Red;
            gpanel.Visible = false;
        }
        else
        {
            Panel1.Visible = false;
            gpanel.Visible = true;

            try
            {
                con = new SqlConnection(str);
                con.Open();

                SqlDataAdapter adpAll = new SqlDataAdapter("select ISBN,BookName,AuthorName,Category,Book_ID from InfoBook where BookName='" + txtBookname.Text + "' and AuthorName='" + txtAuthorname.Text + "' and Category='" + dlCategory.SelectedValue + "'  ", con);

                SqlDataAdapter adpBook = new SqlDataAdapter("select ISBN,BookName,AuthorName,Category,Book_ID from InfoBook where BookName='" + txtBookname.Text + "'", con);

                SqlDataAdapter adpAuthor = new SqlDataAdapter("select ISBN,BookName,AuthorName,Category,Book_ID from InfoBook where AuthorName='" + txtAuthorname.Text + "'", con);
                SqlDataAdapter adpCat = new SqlDataAdapter("select ISBN,BookName,AuthorName,Category,Book_ID from InfoBook where Category='" + dlCategory.SelectedValue + "'", con);
                SqlDataAdapter adpBook_Author = new SqlDataAdapter("select ISBN,BookName,AuthorName,Category,Book_ID from InfoBook where BookName='" + txtBookname.Text + "' and AuthorName='" + txtAuthorname.Text + "'", con);
                SqlDataAdapter adpBook_Cat = new SqlDataAdapter("select ISBN,BookName,AuthorName,Category,Book_ID from InfoBook where BookName='" + txtBookname.Text + "' and Category='" + dlCategory.SelectedValue + "'", con);
                SqlDataAdapter adpAuthor_Cat = new SqlDataAdapter("select ISBN,BookName,AuthorName,Category,Book_ID from InfoBook where AuthorName='" + txtAuthorname.Text + "' and Category='" + dlCategory.SelectedValue + "'", con);
                if (txtBookname.Text == string.Empty && txtAuthorname.Text == string.Empty && dlCategory.SelectedValue != "-Select-")
                {

                    adpCat.Fill(ds, "InfoBook");
                    GridShow.DataSource = ds;
                    GridShow.DataBind();

                }
                else if (txtBookname.Text == string.Empty && dlCategory.SelectedValue == "-Select-")
                {
                    adpAuthor.Fill(ds, "InfoBook");

                    GridShow.DataSource = ds;
                    GridShow.DataBind();
                }
                else if (txtAuthorname.Text == string.Empty && dlCategory.SelectedValue == "-Select")
                {
                    adpBook.Fill(ds, "InfoBook");

                    GridShow.DataSource = ds;
                    GridShow.DataBind();
                }
                else if (txtBookname.Text != string.Empty && txtAuthorname.Text != string.Empty && dlCategory.SelectedValue != "-Select-")
                {
                    adpAll.Fill(ds, "InfoBook");

                    GridShow.DataSource = ds;
                    GridShow.DataBind();
                }
                else if (txtBookname.Text != string.Empty && txtAuthorname.Text != string.Empty && dlCategory.SelectedValue == "-Select-")
                {
                    adpBook_Author.Fill(ds, "InfoBook");

                    GridShow.DataSource = ds;
                    GridShow.DataBind();
                }
                else if (txtBookname.Text != string.Empty && txtAuthorname.Text == string.Empty && dlCategory.SelectedValue != "-Select-")
                {
                    adpBook_Cat.Fill(ds, "InfoBook");

                    GridShow.DataSource = ds;
                    GridShow.DataBind();
                }
                else if (txtBookname.Text == string.Empty && txtAuthorname.Text != string.Empty & dlCategory.SelectedValue != "-Select-")
                {

                    adpAuthor_Cat.Fill(ds, "InfoBook");

                    GridShow.DataSource = ds;
                    GridShow.DataBind();
                }
                con.Close();



            }
            catch (Exception ex)
            {

            }

        }
    }
}


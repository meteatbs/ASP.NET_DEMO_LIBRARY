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

public partial class PageUser_Issue : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    string str = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    string bk_ID, bk_NAME, name;
    DateTime fdate;


    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void imgSearchbooks_Click(object sender, ImageClickEventArgs e)
    {
        lblReq.Text = "";
        lblmsg.Text = "";
        lblDateChk.Text = "";
        txtDate.Text = "";
        DataSet ds = new DataSet();
        lblBookStatus.Visible = false;
        grdBookList.Visible = true;

        if (txtBookname.Text == string.Empty && txtAuthorname.Text == string.Empty && dlCategory.SelectedValue == "-Select-")
        {

        }
        else
        {

            try
            {
                con = new SqlConnection(str);
                con.Open();
                SqlDataAdapter adpAll = new SqlDataAdapter("select ISBN,BookName,AuthorName,Category,Book_ID from InfoBook where BookName='" + txtBookname.Text + "' and AuthorName='" + txtAuthorname.Text + "' and Category='" + dlCategory.SelectedValue + "'", con);
                SqlDataAdapter adpBook = new SqlDataAdapter("select ISBN,BookName,AuthorName,Category,Book_ID from InfoBook where BookName='" + txtBookname.Text + "' ", con);
                SqlDataAdapter adpAuthor = new SqlDataAdapter("select ISBN,BookName,AuthorName,Category,Book_ID from InfoBook where AuthorName='" + txtAuthorname.Text + "'", con);
                SqlDataAdapter adpCat = new SqlDataAdapter("select ISBN,BookName,AuthorName,Category,Book_ID from InfoBook where Category='" + dlCategory.SelectedValue + "'", con);
                SqlDataAdapter adpBook_Author = new SqlDataAdapter("select ISBN,BookName,AuthorName,Category,Book_ID from InfoBook where BookName='" + txtBookname.Text + "' and AuthorName='" + txtAuthorname.Text + "'", con);
                SqlDataAdapter adpBook_Cat = new SqlDataAdapter("select ISBN,BookName,AuthorName,Category,Book_ID from InfoBook where BookName='" + txtBookname.Text + "' and Category='" + dlCategory.SelectedValue + "'", con);
                SqlDataAdapter adpAuthor_cat = new SqlDataAdapter("select ISBN,BookName,AuthorName,Category,Book_ID from InfoBook where AuthorName='" + txtAuthorname.Text + "' and Category='" + dlCategory.SelectedValue + "'", con);

                if (txtBookname.Text == string.Empty && txtAuthorname.Text == string.Empty && dlCategory.SelectedValue != "-Select-")
                {
                    adpCat.Fill(ds, "InfoBook");
                    grdBookList.DataSource = ds;
                    grdBookList.DataBind();
                }
                else if (txtBookname.Text == string.Empty && dlCategory.SelectedValue == "-Select-")
                {
                    adpAuthor.Fill(ds, "InfoBook");
                    grdBookList.DataSource = ds;
                    grdBookList.DataBind();
                }
                else if (txtAuthorname.Text == string.Empty && dlCategory.SelectedValue == "-Select-")
                {
                    adpBook.Fill(ds, "InfoBook");
                    grdBookList.DataSource = ds;
                    grdBookList.DataBind();
                }
                else if (txtBookname.Text != string.Empty && txtAuthorname.Text != string.Empty && dlCategory.SelectedValue != "-Select-")
                {
                    adpAll.Fill(ds, "InfoBook");
                    grdBookList.DataSource = ds;
                    grdBookList.DataBind();
                }
                else if (txtBookname.Text != string.Empty && txtAuthorname.Text != string.Empty && dlCategory.SelectedValue == "-Select-")
                {
                    adpBook_Author.Fill(ds, "InfoBook");
                    grdBookList.DataSource = ds;
                    grdBookList.DataBind();
                }
                else if (txtBookname.Text != string.Empty && txtAuthorname.Text == string.Empty && dlCategory.SelectedValue != "-Select-")
                {
                    adpBook_Cat.Fill(ds, "InfoBook");
                    grdBookList.DataSource = ds;
                    grdBookList.DataBind();
                }
                else if (txtBookname.Text == string.Empty && txtAuthorname.Text != string.Empty && dlCategory.SelectedValue != "-Select-")
                {
                    adpAuthor_cat.Fill(ds, "InfoBook");
                    grdBookList.DataSource = ds;
                    grdBookList.DataBind();
                }
                else
                {
                    con.Close();
                }
            }

            catch (Exception ex)
            {

            }
        }
    }
    protected void grdBookList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdBookList.PageIndex = e.NewPageIndex;
        grdBookList.DataBind();
    }
    protected void grdBookList_SelectedIndexChanged(object sender, EventArgs e)
    {
        name = Page.User.Identity.Name;
        string selectedbook = grdBookList.SelectedRow.Cells[5].Text;
        // ------------ checking complete profile
        if (!chkAvial("select UserName from Library_User where UserName='" + name + "'"))
        {
            lblReq.Visible = true;
            lblReq.Text = "Please Complete Your Profile First";
        }

        else if (txtDate.Text == string.Empty)
        {
            lblDateChk.Text = "Please select the return Date of this book";
            lblDateChk.Visible = true;
            lblDateChk.ForeColor = Color.Red;
            lblReq.Visible = false;
        }

        else
        {
            lblReq.Visible = true;
            lblReq.Text = "You Have Already Requested For This Book.";


            lblDateChk.Visible = false;
            string reqDate = DateTime.Now.ToShortDateString();
            con = new SqlConnection(str);
            con.Open();
            SqlDataAdapter adpSelect = new SqlDataAdapter("select BID,BookName,Available from InfoBook where Book_ID='" + selectedbook + "'", con);
            DataSet dsSelect = new DataSet();
            adpSelect.Fill(dsSelect, "InfoBook");
            bk_ID = dsSelect.Tables[0].Rows[0]["BID"].ToString();
            bk_NAME = dsSelect.Tables[0].Rows[0]["BookName"].ToString();
            con.Close();
            if (chkAvial("select BID,UserName from RequestInfo where BID='" + bk_ID + "' and UserName='" + name + "' "))
            {
                lblReq.Visible = true;
                lblReq.Text = "You Have Already Requested For This Book.";
            }
            else
            {
                grdBookList.SelectedRow.Visible = false;
                string temp = "insert into RequestInfo values('" + bk_ID + "','" + bk_NAME + "','" + name + "','" + reqDate + "','" + fdate + "')";
                if (change(temp) > 0)
                {
                    lblReq.Visible = true;
                    lblReq.Text = "Request has been forwarded to administrator";
                    lblmsg.Visible = true;
                    lblmsg.Text = "You can issue only two books at a time. Only last two selection will be consider";
                }
                else
                {
                    lblReq.Text = "Items is not available.";
                }
            }


        }
    }

    public int change(string chngQuery)
    {
        con = new SqlConnection(str);
        con.Open();
        SqlCommand insCmd = new SqlCommand(chngQuery, con);
        int i = insCmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public bool chkAvial(string query)
    {
        con = new SqlConnection(str);
        con.Open();
        SqlCommand cmdChk = new SqlCommand(query, con);
        SqlDataReader dr = cmdChk.ExecuteReader();
        if (dr.Read())
        {
            con.Close();
            return true;
        }
        else
        {
            con.Close();
            return false;
        }
    }
    protected void txtDate_TextChanged(object sender, EventArgs e)
    {
        if (txtDate.Text != string.Empty)
        {
            fdate = Convert.ToDateTime(txtDate.Text);
            DateTime tdate = DateTime.Now;
            DateTime cdate = tdate.AddDays(20);
            if (fdate > cdate)
            {
                txtDate.Text = "";
                lblDateChk.Text = "Date Can not be more than 20 days";
                lblDateChk.Visible = true;
                ClientScriptManager cs = Page.ClientScript;
                cs.RegisterStartupScript(this.GetType(), "startupScript", "moredate();", true);
            }
        }
    }
}
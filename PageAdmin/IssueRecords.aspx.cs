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

public partial class PageAdmin_IssueRecords : System.Web.UI.Page
{
    SqlConnection con;
    DataSet ds = new DataSet();
    string str = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    string usr_name, Bk_name, selectedBook;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetData();
        }
    }


    public void GetData()
    {
        con = new SqlConnection(str);
        con.Open();
        SqlDataAdapter daIssue = new SqlDataAdapter("select * from RequestInfo", con);
        daIssue.Fill(ds, "RequestInfo");
        gdIssue.DataSource = ds;
        gdIssue.DataBind();
        con.Close();
    }
    protected void gdIssue_SelectedIndexChanged(object sender, EventArgs e)
    {
        con = new SqlConnection(str);
        con.Open();
        DateTime today = DateTime.Now;
        DateTime mailDate = today.AddDays(20);
        selectedBook = gdIssue.SelectedRow.Cells[2].Text;
        usr_name = gdIssue.SelectedRow.Cells[4].Text;
        string req_rtrn_date = gdIssue.SelectedRow.Cells[6].Text;
        string idate = DateTime.Now.ToShortDateString();
        SqlDataAdapter daBkIssue = new SqlDataAdapter("select * from InfoBook where BID='" + selectedBook + "'", con);
        DataSet dsselect = new DataSet();
        daBkIssue.Fill(dsselect, "InfoBook");
        int bk_ID = Convert.ToInt32(selectedBook);
        Bk_name = dsselect.Tables[0].Rows[0]["BookName"].ToString();
        string bk_cat = dsselect.Tables[0].Rows[0]["Category"].ToString();
        gdIssue.SelectedRow.Visible = false;
        /////// issueing book to user 


        SqlCommand insrtInssue = new SqlCommand("insert into IssueRecords(UserName,BID,BookName,Category,IssueDate,ReturnDate,MailSendDate) values (@1,@2,@3,@4,@5,@6,@7)", con);
        insrtInssue.Parameters.AddWithValue("@1", usr_name);
        insrtInssue.Parameters.AddWithValue("@2", bk_ID);
        insrtInssue.Parameters.AddWithValue("@3", Bk_name);
        insrtInssue.Parameters.AddWithValue("@4", bk_cat);
        insrtInssue.Parameters.AddWithValue("@5", idate);
        insrtInssue.Parameters.AddWithValue("@6", req_rtrn_date);
        insrtInssue.Parameters.AddWithValue("@7", mailDate);
        int sucees = insrtInssue.ExecuteNonQuery();

        if (sucees >= 1)
        {
            lblMsg.Text = "Book has been issued the user.";
            lblMsg.Visible = true;
            lblMsg.ForeColor = Color.Green;

        }
        else
        {
            lblMsg.Text = "Book has not been issued the user.";
            lblMsg.Visible = true;
            lblMsg.ForeColor = Color.Red;
        }

        ///// updating info of issued book
        SqlCommand cmdInfoUpdate = new SqlCommand("update InfoBook set Available='false' where BID='" + bk_ID + "'", con);
        cmdInfoUpdate.ExecuteNonQuery();

        /////// deleting request of issued book
        SqlCommand cmdDelreq = new SqlCommand("delete RequestInfo where BID='" + bk_ID + "'", con);
        cmdDelreq.ExecuteNonQuery();
        con.Close();
    }
    protected void gdIssue_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        gdIssue.PageIndex = e.NewPageIndex;
        gdIssue.DataBind();
    }
}
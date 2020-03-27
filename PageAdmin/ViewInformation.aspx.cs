using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Security;
using System.Drawing;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;

public partial class PageAdmin_ViewInformation : System.Web.UI.Page
{
    string str = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    string strQuery, Pquery, Equery;
    int pn, un;
    protected void Page_Load(object sender, EventArgs e)
    {
        addYear();
        lblError.Text = "";
    }
    private void addYear()
    {

        int x = DateTime.Now.Year;
        List<string> str = new List<string>();

        for (int i = x; i >= 1975; i--)
        {

            str.Add(i.ToString());
        }

        ddBkYear.DataSource = str;
        ddBkYear.DataBind();
    }

    void getData(string query, int i)
    {
        SqlConnection con = new SqlConnection(str);
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ds.Clear();
        da.Fill(ds);
        if (i == 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        else
        {
            GridBook.DataSource = ds;
            GridBook.DataBind();
        }
        con.Close();
    }



    protected void btnUsrInfo_Click(object sender, EventArgs e)
    {
        PanelUser.Visible = true;
        PanelBook.Visible = false;
        strQuery = "select * from Library_User";
        getData(strQuery, 0);
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selname = GridView1.SelectedRow.Cells[0].Text;


        SqlConnection con = new SqlConnection(str);
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from Library_User where UserName='" + selname + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            lblName.Text = dr.GetString(1);
            lblAge.Text = dr.GetInt32(2).ToString();
            lblDesign.Text = dr.GetString(3);
            lblContact.Text = dr.GetValue(5).ToString();
            lblAdd.Text = dr.GetValue(6).ToString();

        }
        ModalPopupExtender1.Show();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string selName = GridView1.DataKeys[e.RowIndex].Value.ToString();
        SqlConnection con = new SqlConnection(str);
        con.Open();
        SqlCommand chkCmd = new SqlCommand("select * from IssueRecords where UserName='" + selName + "'", con);
        SqlDataReader dr = chkCmd.ExecuteReader();
        if (dr.Read())
        {
            lblError.Text = "Sorry , You Can't Delete This User";
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Visible = true;
        }
        else
        {
            Membership.DeleteUser(selName);
            strQuery = "delete DeleteRequest where UserName='" + selName + "'";
            change(strQuery);
            strQuery = "delete from Library_User where UserName='" + selName + "'";
            change(strQuery);
            getData("select * from Library_User ", 0);
        }
    }
    void change(string query)
    {
        SqlConnection con = new SqlConnection(str);
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.ExecuteNonQuery();
        con.Close();
    }

    protected void btnBookInfo_Click(object sender, EventArgs e)
    {
        PanelUser.Visible = false;
        PanelBook.Visible = true;
        strQuery = "select * from InfoBook";
        getData(strQuery, 1);
    }
    protected void GridBook_SelectedIndexChanged(object sender, EventArgs e)
    {
        ViewState["MyID"] = GridBook.SelectedValue.ToString();
        ModalPopupExtender2.Show();
        txtBkIsbn.Text = GridBook.SelectedRow.Cells[1].Text;
        txtBkName.Text = GridBook.SelectedRow.Cells[2].Text;
        txtBkAuthor.Text = GridBook.SelectedRow.Cells[3].Text;
        txtBkPublisher.Text = GridBook.SelectedRow.Cells[4].Text;
        ddBkCat.Text = GridBook.SelectedRow.Cells[5].Text;
        ddBkYear.Text = GridBook.SelectedRow.Cells[6].Text;
        radBkAvail.Text = GridBook.SelectedRow.Cells[7].Text;
        radBkReq.Text = GridBook.SelectedRow.Cells[8].Text;
        txtBkCopies.Text = GridBook.SelectedRow.Cells[9].Text;
    }

    protected void btnBkEdit_Click(object sender, EventArgs e)
    {
        string stQuery;
        string uname = Page.User.Identity.Name;
        int selBId = Convert.ToInt32(ViewState["MyID"].ToString());
        string newBkName, newBkIsbn, newBkAuth, newBkPub, newBkCat, newBkYear;
        string newBkAvail, newBkReq;
        int newBkCopy;
        newBkName = txtBkName.Text;
        newBkIsbn = txtBkIsbn.Text;
        newBkAuth = txtBkAuthor.Text;
        newBkPub = txtBkPublisher.Text;
        newBkCat = ddBkCat.SelectedItem.ToString();
        newBkYear = ddBkYear.SelectedItem.ToString();
        newBkAvail = radBkAvail.SelectedItem.ToString();
        newBkReq = radBkReq.SelectedItem.ToString();
        newBkCopy = Convert.ToInt32(txtBkCopies.Text);
        stQuery = "update InfoBook set ISBN='" + newBkIsbn + "',BookName='" + newBkName + "',AuthorName='" + newBkAuth + "',Publisher='" + newBkPub + "',Category='" + newBkCat + "',PublishYear='" + newBkYear + "',Available='" + newBkAvail + "',Requested='" + newBkReq + "',Copies=" + newBkCopy + " where BID=" + selBId + "";

        change(stQuery);
        stQuery = "update IssueRecords set BookName='" + newBkName + "',Category='" + newBkCat + "' where BID=" + selBId + "";

        change(stQuery);
        getData("select * from InfoBook", 1);

    }
    protected void GridBook_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
}
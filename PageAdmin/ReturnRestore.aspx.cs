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
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;

public partial class PageAdmin_ReturnRestore : System.Web.UI.Page
{

    string str = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    SqlConnection con;
    SqlCommand cmd;
    string getQuery;
    protected void Page_Load(object sender, EventArgs e)
    {
        getQuery = "select Issue_ID as 'Issue Id', IssueDate as 'Issue Date', ReturnDate as 'Return Date' , UserName as 'User Name' , BookName as 'Book Name', Category ,ActualReturnDate from IssueRecords";

        getData(getQuery, 0);
    }

    public void getData(string query, int i)
    {
        con = new SqlConnection(str);

        cmd = new SqlCommand(query, con);
        if (i == 0)
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridIssue.DataSource = ds;
            GridIssue.DataBind();
            con.Close();
        }
        else
        {
            con.Open();
            SqlDataAdapter da2 = new SqlDataAdapter(cmd);
            DataSet ds2 = new DataSet();
            da2.Fill(ds2);
            GridReturned.DataSource = ds2;
            GridReturned.DataBind();
            con.Close();
        }

    }
    protected void GridIssue_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridIssue.PageIndex = e.NewPageIndex;
        getQuery = "select Issue_ID as 'Issue Id', IssueDate as 'Issue Date', ReturnDate as 'Return Date' , UserName as 'User Name' , BookName as 'Book Name', Category ,ActualReturnDate from IssueRecords";
        getData(getQuery, 0);
    }

    protected void GridReturned_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sel_BID = GridReturned.SelectedRow.Cells[2].Text;
        string sel_IID = GridReturned.SelectedRow.Cells[1].Text;
        string sel_Uname = GridReturned.SelectedRow.Cells[3].Text;
        getQuery = "update InfoBook set Available='" + true + "',Requested='" + false + "' where BID=" + sel_BID + "";
        change(getQuery);
        getQuery = "update IssueRecords set ActualReturnDate='" + DateTime.Now.ToShortDateString() + "' where Issue_ID='" + sel_IID + "'";
        change(getQuery);
        Response.Redirect("ReturnRestore.aspx");
    }


    public int change(string query)
    {
        con = new SqlConnection(str);
        con.Open();
        cmd = new SqlCommand(query, con);
        int flag = cmd.ExecuteNonQuery();
        con.Close();

        return flag;

    }

    protected void imgPDF_Click(object sender, ImageClickEventArgs e)
    {
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=Issue_Records.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        GridIssue.AllowPaging = false;
        getQuery = "select Issue_ID as 'Issue Id', IssueDate as 'Issue Date', ReturnDate as 'Return Date' , UserName as 'User Name' , BookName as 'Book Name', Category ,ActualReturnDate from IssueRecords";

        getData(getQuery, 0);
        GridIssue.RenderControl(hw);
        GridIssue.HeaderRow.Style.Add("width", "15%");
        GridIssue.HeaderRow.Style.Add("font-size", "10px");
        GridIssue.HeaderRow.Style.Add("HorizontalAlign", "Center");
        GridIssue.Style.Add("text-decoration", "none");
        GridIssue.Style.Add("font-family", "Arial, Helvetica, sans-serif;");
        GridIssue.Style.Add("font-size", "8px");
        StringReader sr = new StringReader(sw.ToString());
        Document pdfDoc = new Document(PageSize.A2, 7f, 7f, 7f, 0f);
        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        htmlparser.Parse(sr);
        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();
    }
    protected void imgExcel_Click(object sender, ImageClickEventArgs e)
    {


        Response.ClearContent();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Issue_Records.xls"));
        Response.ContentType = "application/ms-excel";
        StringWriter sw = new StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(sw);
        GridIssue.AllowPaging = false;
        getQuery = "select Issue_ID as 'Issue Id', IssueDate as 'Issue Date', ReturnDate as 'Return Date' , UserName as 'User Name' , BookName as 'Book Name', Category ,ActualReturnDate from IssueRecords";
        getData(getQuery, 0);
        GridIssue.RenderControl(htw);
        Response.Write(sw.ToString());
        Response.End();

    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }
}
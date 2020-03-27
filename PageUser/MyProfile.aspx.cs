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
using System.Web.Security;

public partial class PageUser_MyProfile : System.Web.UI.Page
{
    SqlConnection con;

    SqlCommand cmd;

    string str = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;

    string email, uname;

    string chk;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            chkProfile();
        }
    }

    private void chkProfile()
    {

        uname = Page.User.Identity.Name;
        con = new SqlConnection(str);
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from Library_User where UserName='" + uname + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            txtName.Text = dr.GetString(1);
            txtAge.Text = dr.GetInt32(2).ToString();
            txtDesign.Text = dr.GetString(3).ToString();
            txtContact.Text = dr.GetSqlValue(5).ToString();
            txtAddress.Text = dr.GetString(6).ToString();

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        uname = Page.User.Identity.Name;
        email = Membership.GetUser(uname).Email;

        con = new SqlConnection(str);
        SqlConnection conchk = new SqlConnection(str);
        conchk.Open();
        con.Open();
        try
        {
            SqlCommand cmdChk = new SqlCommand("select * from Library_User where UserName='" + uname + "'", conchk);
            SqlDataReader drChk = cmdChk.ExecuteReader();

            if (!drChk.Read())
            {
                cmd = new SqlCommand("insert into Library_User (UserName,Fullname,Age,Designation,EmailID,ContactNo,Address) values (@1,@2,@3,@4,@5,@6,@7)", con);
                cmd.Parameters.AddWithValue("@1", uname);
                cmd.Parameters.AddWithValue("@2", txtName.Text);
                cmd.Parameters.AddWithValue("@3", int.Parse(txtAge.Text));
                cmd.Parameters.AddWithValue("@4", txtDesign.Text);
                cmd.Parameters.AddWithValue("@5", email);
                cmd.Parameters.AddWithValue("@6", long.Parse(txtContact.Text));
                cmd.Parameters.AddWithValue("@7", txtAddress.Text);
                Label1.Text = "Record Inserted Successfully";
            }
            else
            {
                cmd = new SqlCommand("update Library_User set Fullname='" + txtName.Text + "' , age='" + int.Parse(txtAge.Text) + "',Designation='" + txtDesign.Text + "',ContactNo='" + int.Parse(txtContact.Text) + "',Address='" + txtAddress.Text + "' ", con);

                Label1.Text = "Profile Updated Successfully";
            }

            conchk.Close();
            cmd.ExecuteNonQuery();
        }
        catch (Exception exp)
        {
            Label1.Text = exp.Message;
        }
        con.Close();

    }
}
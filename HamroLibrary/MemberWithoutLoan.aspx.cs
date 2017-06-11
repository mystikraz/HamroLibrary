using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace HamroLibrary
{
    public partial class MemberWithoutLoan : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HamroLibraryDb"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userType"] == null || Convert.ToString(Session["userType"]) == "normal")
            {
                Response.Redirect("login.aspx");

            }
            if (!this.IsPostBack)
            {
                this.BindGridView();
            }
        }

        private void BindGridView()
        {
            con.Open();
            DateTime oneMonth = DateTime.Today.AddDays(-31);
            SqlDataAdapter da = new SqlDataAdapter("Select member.Id,member.fname, member.lname, member.address, Loan_Issue.issue_date, book.name as BookTitle from member,book,Loan_Issue where member.Id NOT IN(SELECT m_id from Loan_Issue where Convert(Datetime,issue_date, 103)>=Convert(Datetime,'" + oneMonth + "',103))", con);
            //SqlDataAdapter da = new SqlDataAdapter("Select Id, name as BookTitle from book where Id NOT IN(SELECT book_Id from Loan_Issue where Convert(Datetime,issue_date,103)>=Convert(Datetime,'" + oneMonth + "',103))", con);

            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                //message.Visible = true;
                //message.Text = "Sorry! The Book You Searched For Doesnot Exist in our Library!";
                //lblbook.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
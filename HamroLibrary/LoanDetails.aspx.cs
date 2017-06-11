using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Web.UI.WebControls;

namespace HamroLibrary
{
    public partial class LoanDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HamroLibraryDb"].ConnectionString);


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userType"] == null)
            {
                Response.Redirect("login.aspx");

            }
            if (!IsPostBack)
            {
                gvbind();
            }
            if (!this.IsPostBack)
            {
                this.BindGridView();
            }

        }

        private void BindGridView()
        {
            string val = txt_search.Text.Trim();
            con.Open();
            DateTime previousMonth=DateTime.Today.AddMonths(-1);
            SqlDataAdapter da = new SqlDataAdapter("SELECT Loan_Issue.Id, member.Id as mId, { fn CONCAT(member.fname, member.lname) } AS Renter, book.Id as BookId, book.name AS BookTitle, Loan_Issue.issue_date, Loan_Issue.due_date, member.m_type, Loan_Issue.return_id FROM book INNER JOIN Loan_Issue ON book.Id = Loan_Issue.book_id INNER JOIN member ON Loan_Issue.m_id = member.Id where member.fname Like '%" + val + "%' ", con);
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
                search_error.Visible = true;
                search_error.Text = "Sorry! The Book You Searched For Doesnot Exist in our Library!";
                //lblbook.ForeColor = System.Drawing.Color.Red;
            }
        }
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGridView();
        }

        protected void GridView1_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Text = Regex.Replace(e.Row.Cells[0].Text, txt_search.Text.Trim(), delegate (Match match)
                {
                    return string.Format("<span style = 'background-color:#D9EDF7'>{0}</span>", match.Value);
                }, RegexOptions.IgnoreCase);
            }
        }

        private void gvbind()
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT Loan_Issue.Id, member.Id as mId, { fn CONCAT(member.fname, member.lname) } AS Renter, book.Id as BookId, book.name AS BookTitle, Loan_Issue.issue_date, Loan_Issue.due_date, member.m_type, Loan_Issue.return_id FROM book INNER JOIN Loan_Issue ON book.Id = Loan_Issue.book_id INNER JOIN member ON Loan_Issue.m_id = member.Id", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else
            {
                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                GridView1.DataSource = ds;
                GridView1.DataBind();
                int columncount = GridView1.Rows[0].Cells.Count;
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
                GridView1.Rows[0].Cells[0].Text = "No Records Found";
            }

        }
      
        protected void AddNewRenter_Click(object sender, EventArgs e)
        {
            Response.Redirect("Loan.aspx");
        }

        protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {

        }

        protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            Label lbl_ID = (Label)GridView1.Rows[e.RowIndex].FindControl("lblID");
            Label book_id= (Label)GridView1.Rows[e.RowIndex].FindControl("lblBookId");
            Label lblIssueDate= (Label)GridView1.Rows[e.RowIndex].FindControl("lblissue_date");
            con.Open();
            string cmdstr = "delete from Loan_Issue where id=@Id";
            SqlCommand cmd = new SqlCommand(cmdstr, con);
            cmd.Parameters.AddWithValue("@Id", lbl_ID.Text);
            int rowsAffected = cmd.ExecuteNonQuery();
            if (rowsAffected == 1)
            {
                //Adding book back to stock
                SqlDataAdapter stock = new SqlDataAdapter("Select qty from book where Id='" + book_id.Text + "'", con);
                DataTable stockval = new DataTable();
                stock.Fill(stockval);
                int stockvalue = Convert.ToInt32(stockval.Rows[0][0].ToString()) + 1;
                SqlCommand updatecommand = new SqlCommand("update book set qty = " + stockvalue.ToString() + " where Id='" + book_id.Text + "'", con);
                int rowaffected = updatecommand.ExecuteNonQuery();
                if (rowaffected == 1)
                {
                    //Success notification
                    lblMesage.Visible = true;
                    lblMesage.CssClass = "alert alert-success";
                    lblMesage.Text = "Renter deleted sucessfully and Book added back to stock";
                }

               
                DateTime issue_date = Convert.ToDateTime(lblIssueDate.Text);
                int Fine=0;
                if (DateTime.Today > issue_date)
                {
                    Fine = 100;
                }

                SqlCommand insertcommand = new SqlCommand("insert into Loan_Return (Issue_Id, return_date, Fine) values('"+ lbl_ID.Text +"','"+DateTime.Today+"', '"+ Fine + "')", con);
                int rowsaffected = updatecommand.ExecuteNonQuery();
                if (rowsaffected == 1)
                {
                    //Success notification
                    lblMesage1.Visible = true;
                    lblMesage1.CssClass = "alert alert-danger";
                    if (Fine > 0)
                    {
                        lblMesage1.Text = "Book submitted Late! Charge Rs.100!";

                    }
                }



            }
            else
            {
                //Error notification
                lblMesage.Visible = true;
                lblMesage.CssClass = "alert alert-danger";
                lblMesage.Text = "Sorry! Couldn't add into Loan return";
            }

            con.Close();
            gvbind();
        }

        protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {

        }

        protected void btn_search_member_Click(object sender, EventArgs e)
        {

        }
    }
}
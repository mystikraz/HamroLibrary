using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace HamroLibrary
{
    public partial class Loan1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HamroLibraryDb"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userType"] == null)
            {
                Response.Redirect("login.aspx");

            }
            lblInfo.Visible = false;
            lblMoreInfo.Visible = false;
            //this.CheckCount_Click(object sender, EventArgs e);
            
        }

        protected void CheckCount_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("select count(*) from Loan_Issue where m_id ='" + member.SelectedValue.ToString() + "' and return_id='not returned' ", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                int count = Convert.ToInt32(dt.Rows[0][0].ToString());
                PreviousBook.Text = count.ToString();
                con.Close();


            }
            catch (Exception ex)
            {
                lblInfo.Visible = true;
                lblInfo.Text = ex.ToString();
            }
        }

        protected void IssueBook_Click(object sender, EventArgs e)
        {
            string book_id = book.SelectedValue.ToString();
            string member_id = member.SelectedValue.ToString();
            string issueDate = issue_date.SelectedDate.ToString("yyyy-MM-dd");
            string dueDate = due_date.SelectedDate.ToString("yyyy-MM-dd");
            int count = Convert.ToInt32(PreviousBook.Text);

            DateTime myDate1 = DateTime.Parse(issueDate);
            DateTime myDate2 = DateTime.Parse(dueDate);

            SqlDataAdapter stock1 = new SqlDataAdapter("Select qty from book where Id='" + book_id + "'", con);
            DataTable stockval1 = new DataTable();
            stock1.Fill(stockval1);
            int stockvalue1 = Convert.ToInt32(stockval1.Rows[0][0].ToString());
            if (stockvalue1 <= 0)
            {
                lblInfo.Visible = true;
                lblInfo.Text = "Sorry! The book is not in stock";
            }
            else
            {


                try
                {
                    lblCalValidator1.Text = issue_date.SelectedDate.ToShortDateString();
                    lblCalValidator2.Text = due_date.SelectedDate.ToShortDateString();

                    if (lblCalValidator1.Text == "" || lblCalValidator2.Text == "")
                    {
                        lblInfo.Visible = true;
                        lblInfo.Text = "Check both issue and due dates!";
                    }
                    else if (myDate1 != DateTime.Today)
                    {
                        lblInfo.Visible = true;
                        lblInfo.Text = "Please check today's date";
                    }
                    else if (myDate2 < DateTime.Today.AddDays(30))
                    {
                        lblInfo.Visible = true;
                        lblInfo.Text = "Return day must be 30 days from today!";
                    }

                    else
                    {

                        con.Open();
                        SqlDataAdapter da = new SqlDataAdapter("Select restriction_level from book where Id='" + book_id + "'", con);
                        SqlDataAdapter da1 = new SqlDataAdapter("Select m_type from member where Id='" + member_id + "'  ", con);
                        SqlDataAdapter da2 = new SqlDataAdapter("Select dob from member where Id='" + member_id + "'  ", con);
                        DataTable dt = new DataTable();
                        DataTable dt1 = new DataTable();
                        DataTable dt2 = new DataTable();
                        da.Fill(dt);
                        da1.Fill(dt1);
                        da2.Fill(dt2);
                        string restrictionlevel = dt.Rows[0][0].ToString();
                        string membertype = dt1.Rows[0][0].ToString();
                        string dob = dt2.Rows[0][0].ToString();

                        int tday= Convert.ToInt32(DateTime.Today.Year);
                        DateTime dob1= Convert.ToDateTime(dob);
                        int dob2=dob1.Year;
                        int age = tday - dob2;
                        con.Close();
                        if (membertype == "Premium" && restrictionlevel == "PG")
                        {
                            if (count > 3)
                            {
                                lblInfo.Visible = true;
                                lblInfo.Text = "Already taken 4 books! Not allowed to loan any more books!";
                            }
                            else
                            {
                                insert();
                                lblMoreInfo.Visible = true;
                                lblMoreInfo.Text = "Done with normal book @ Premium User";
                            }
                        }
                        else if (membertype == "Premium" && restrictionlevel == "Adult")
                        {
                            if (count > 3)
                            {
                                lblInfo.Visible = true;
                                lblInfo.Text = "Already taken 4 books! Not allowed to loan any more books!";
                            }
                            else if (age < 18)
                            {
                                lblInfo.Visible = true;
                                lblInfo.Text = "Age restricted book. Member is under 18!";

                            }
                            else
                            {
                                insert();
                                lblMoreInfo.Visible = true;
                                lblMoreInfo.Text = "Done with restricted book @ Premium User";
                            }
                        }
                        else if (membertype == "Normal" && restrictionlevel == "PG")
                        {
                            if (count > 2)
                            {
                                lblInfo.Visible = true;
                                lblInfo.Text = "Already taken 2 books! Not allowed to loan any more books!";
                            }
                            else
                            {
                                insert();
                                lblInfo.Visible = true;
                                lblMoreInfo.Text = "Done with normal book @ Normal User";

                            }
                        }
                        else if(membertype == "Normal" && restrictionlevel == "Adult")
                        {
                            if (count > 2)
                            {
                                lblMoreInfo.Visible = true;
                                lblInfo.Text = "Already taken 3 books! Not allowed to loan any more books!";

                            }
                            else if (age < 18)
                            {
                                lblInfo.Visible = true;
                                lblInfo.Text = "Age restricted book. Member is under 18!";

                            }
                            else
                            {
                                insert();
                                lblInfo.Visible = true;
                                lblMoreInfo.Text = "Done with restricted book @ Normal User";

                            }

                        }
                    }

                }
                catch (Exception ex)
                {
                    lblInfo.Visible = true;
                    lblInfo.Text = ex.ToString();
                    Response.Write(ex.Message);
                }

            }
        }
        private void insert()
        {
            string bid = book.SelectedValue.ToString();
            string mid = member.SelectedValue.ToString();
            string issuedate = issue_date.SelectedDate.ToString("yyyy-MM-dd");
            string duedate = due_date.SelectedDate.ToString("yyyy-MM-dd");
            string returnid = "not returned";
            con.Open();
            
                SqlCommand insertcommand = new SqlCommand("Insert into Loan_Issue Values(@book_id,@m_id,@issue_date,@due_date,@return_id)", con);
                insertcommand.Parameters.AddWithValue("@book_id", bid);
                insertcommand.Parameters.AddWithValue("@m_id", mid);
                insertcommand.Parameters.AddWithValue("@issue_date", issuedate);
                insertcommand.Parameters.AddWithValue("@due_date", duedate);
                insertcommand.Parameters.AddWithValue("@return_id", returnid);
                try
                {
                    int rowsAffected = insertcommand.ExecuteNonQuery();
                    if (rowsAffected == 1)
                    {
                        //Success notification
                        lblMoreInfo.Visible = true;
                        lblMoreInfo.CssClass = "alert alert-success";
                        lblMoreInfo.Text = "New User added sucessfully";
                    }
                    else
                    {
                        //Error notification
                        lblInfo.Visible = true;
                        lblInfo.CssClass = "alert alert-danger";
                        lblInfo.Text = "Sorry! Couldn't add user";
                    }
                }
                catch (Exception e)
                {

                    lblInfo.Visible = true;
                    lblInfo.CssClass = "alert alert-danger";
                    lblInfo.Text = "Sorry! Couldn't add user";
                    Response.Write(e.Message);
                }



                SqlDataAdapter stock = new SqlDataAdapter("Select qty from book where Id='" + bid + "'", con);
                DataTable stockval = new DataTable();
                stock.Fill(stockval);
                int stockvalue = Convert.ToInt32(stockval.Rows[0][0].ToString()) - 1;
                SqlCommand updatecommand = new SqlCommand("update book set qty = " + stockvalue.ToString() + " where Id='" + bid + "'", con);
                updatecommand.ExecuteNonQuery();
                con.Close();
                // GridView1.DataBind();
                lblInfo.Visible = true;
                lblInfo.Text = "Issue Recorded Successfully With:";
                //System.Threading.Thread.Sleep(5000);
                //Response.Redirect("LoanDetails.aspx");
           
        }
       
    }
}
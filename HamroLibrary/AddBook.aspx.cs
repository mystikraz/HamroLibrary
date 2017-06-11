using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace HamroLibrary
{
    public partial class AddBook : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HamroLibraryDb"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userType"] == null)
            {
                Response.Redirect("login.aspx");

            }

        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            try
            {

                con.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "INSERT INTO [book](name,isbn,qty,shelfno,published_date,edition,author_id,restriction_level,publisher_id) Values (@name,@isbn,@qty,@shelfno,@published_date,@edition,@author_id,@restriction_level,@publisher_id)";
                    cmd.Parameters.AddWithValue("@name", TextTitle.Text);
                    cmd.Parameters.AddWithValue("@isbn", TextIsbn.Text);
                    cmd.Parameters.AddWithValue("@qty", TextQuantity.Text);
                    cmd.Parameters.AddWithValue("@shelfno", TextShelfNo.Text);
                    cmd.Parameters.AddWithValue("@published_date", TextPublishedDate.Text);
                    cmd.Parameters.AddWithValue("@edition", TextEdition.Text);
                    cmd.Parameters.AddWithValue("@author_id", TextAuthor.Text);
                    cmd.Parameters.AddWithValue("@restriction_level", textRestriction_level.Text);
                    cmd.Parameters.AddWithValue("@publisher_id", TextPublisher.Text);

                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected == 1)
                    {
                        //Success notification
                        message.Visible = true;
                        message.CssClass = "alert alert-success";
                        message.Text = "New Book added sucessfully";
                    }
                    else
                    {
                        //Error notification
                        message.Visible = true;
                        message.CssClass = "alert alert-danger";
                        message.Text = "Sorry! Couldn't add book";
                    }
                }
            }
            catch (SqlException ex)
            {
                //log error 
                //display friendly error to user
                message.Visible = true;
                message.CssClass = "alert alert-danger";
                message.Text = ex.Message;
                // Response.Write(ex.Message);
            }
            finally
            {
                if (con != null)
                {
                    //cleanup connection i.e close 
                    con.Close();
                }
            }
        }

        protected void ResetBtn_Click(object sender, EventArgs e)
        {
            TextTitle.Text="";
            TextIsbn.Text="";
           TextQuantity.Text="";
            TextShelfNo.Text="";
             TextPublishedDate.Text="";
            TextEdition.Text="";
           TextAuthor.Text="";
            textRestriction_level.Text="";
            TextPublisher.Text="";

        }
    }
}
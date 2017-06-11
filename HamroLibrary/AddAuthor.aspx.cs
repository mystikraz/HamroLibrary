using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace HamroLibrary
{
    public partial class AddAuthor : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HamroLibraryDb"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userType"] == null)
            {
                Response.Redirect("login.aspx");

            }
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            try
            {

                con.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "INSERT INTO [author](lname,fname) Values (@lname,@fname)";
                    cmd.Parameters.AddWithValue("@lname", lname.Text);
                    cmd.Parameters.AddWithValue("@fname", fname.Text);
                    
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected == 1)
                    {
                        //Success notification
                        message.Visible = true;
                        message.CssClass = "alert alert-success";
                        message.Text = "New Author added sucessfully";
                        Response.Redirect("Author.aspx");
                    }
                    else
                    {
                        //Error notification
                        message.Visible = true;
                        message.CssClass = "alert alert-danger";
                        message.Text = "Sorry! Couldn't add Author";
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
    }
}
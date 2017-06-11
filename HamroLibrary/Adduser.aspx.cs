using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace HamroLibrary
{
    public partial class Adduser : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HamroLibraryDb"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            AddUserMessage.Visible = false;
            if (Session["userType"] == null)
            {
                Response.Redirect("login.aspx");

            }
        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            // Scrub user data
           
            //SqlConnection con = null;
            try
            {

                con.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "INSERT INTO [user](name,password,email,address,mobile,dob,created_at,update_at,user_type) Values (@name,@pass,@email,@add,@mob,@dob,@create,@update,@user)";
                    cmd.Parameters.AddWithValue("@name", Name.Text);
                    cmd.Parameters.AddWithValue("@pass", Security.HashSHA1(Password.Text));
                    cmd.Parameters.AddWithValue("@email", Email.Text);
                    cmd.Parameters.AddWithValue("@add", Address.Text);
                    cmd.Parameters.AddWithValue("@mob", Mobile.Text);
                    cmd.Parameters.AddWithValue("@dob", DOB.Text);
                    cmd.Parameters.AddWithValue("@create", DateTime.Today);
                    cmd.Parameters.AddWithValue("@update", DateTime.Today);
                    cmd.Parameters.AddWithValue("@user", UserType.SelectedItem.Text);
                    
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected == 1)
                    {
                        //Success notification
                        AddUserMessage.Visible = true;
                        AddUserMessage.CssClass = "alert alert-success";
                        AddUserMessage.Text = "New User added sucessfully";
                    }
                    else
                    {
                        //Error notification
                        AddUserMessage.Visible = true;
                        AddUserMessage.CssClass = "alert alert-danger";
                        AddUserMessage.Text = "Sorry! Couldn't add user";
                    }
                }
            }
            catch (SqlException ex)
            {
                //log error 
                //display friendly error to user
                AddUserMessage.Visible = true;
                AddUserMessage.CssClass = "alert alert-danger";
                AddUserMessage.Text = ex.Message;
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
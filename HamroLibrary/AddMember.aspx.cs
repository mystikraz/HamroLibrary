using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace HamroLibrary
{
    public partial class AddMember : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HamroLibraryDb"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!this.IsPostBack)
            //{
            //    this.Add_Member();
            //}
        }

        private void Add_Member()
        {
           
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
                    cmd.CommandText = "INSERT INTO [member](fname,lname,address,gender,dob,phone,mobile,email,m_type) Values (@fname,@lname,@address,@gender,@dob,@phone,@mobile,@email,@m_type)";
                    cmd.Parameters.AddWithValue("@fname", fname.Text);
                    cmd.Parameters.AddWithValue("@lname", lname.Text);
                    cmd.Parameters.AddWithValue("@address", address.Text);
                    cmd.Parameters.AddWithValue("@gender", gender.Text);
                    cmd.Parameters.AddWithValue("@dob", dob.Text);
                    cmd.Parameters.AddWithValue("@phone", phone.Text);
                    cmd.Parameters.AddWithValue("@mobile", mobile.Text);
                    cmd.Parameters.AddWithValue("@email", Email.Text);
                    cmd.Parameters.AddWithValue("@m_type", Member_Type.SelectedItem.Text);

                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected == 1)
                    {
                        //Success notification
                        message.Visible = true;
                        message.CssClass = "alert alert-success";
                        message.Text = "Member added";
                        Response.Redirect("Member.aspx");
                        
                    }
                    else
                    {
                        //Error notification
                        message.Visible = true;
                        message.CssClass = "alert alert-failure";
                        message.Text = "Sorry member Not Addded";
                        //Response.Redirect("Member.aspx");


                    }
                }
            }
            catch (SqlException ex)
            {
                //log error 
                //display friendly error to user
                message.Visible = true;
                message.CssClass="alert alert-failure";
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
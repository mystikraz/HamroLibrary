using System;
using System.Configuration;
using System.Data.SqlClient;

namespace HamroLibrary
{
    public partial class Login : System.Web.UI.Page
    {
        
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HamroLibraryDb"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            lblwarning.Visible = false;
           

        }

        protected void BtnlogIn_Click(object sender, EventArgs e)
        {
            
            con.Open();
            string checkuser = "Select Count(*) from [user] where name ='" + txtUname.Text + "' ";

            SqlCommand cmd = new SqlCommand(checkuser, con);
            string results = cmd.ExecuteScalar().ToString();

            int val = Convert.ToInt16(results);
            con.Close();

            if (val == 1)
            {
                con.Open();
                string checkpass = "Select password from [user] where name='" + txtUname.Text + "'";
                SqlCommand cmdd = new SqlCommand(checkpass, con);
                string password = cmdd.ExecuteScalar().ToString().Replace(" ", "");
                con.Close();

                if (password == Security.HashSHA1(txtPassword.Text))
                {
                    con.Open();


                    string user_type = "Select user_type from [user] where name ='" + txtUname.Text + "' ";
                    SqlCommand cmd1 = new SqlCommand(user_type, con);
                    string userType = cmd1.ExecuteScalar().ToString().Replace(" ", "");

                    string userName = "Select name from [user] where name ='" + txtUname.Text + "' ";
                    SqlCommand cmd2 = new SqlCommand(userName, con);
                    string user = cmd2.ExecuteScalar().ToString().Replace(" ", "");

                    Session["userType"] = userType;
                    Session["user"] = user;
                    Response.Redirect("Default.aspx");
                    txtUname.Text = "";
                    txtPassword.Text = "";
                    con.Close();

                }
                else
                {
                    lblwarning.Visible = true;
                    lblwarning.Text = "User doesnot exist";
                    txtUname.Text = "";
                    txtPassword.Text = "";
                }
            }
            con.Close();

        }



    }
    
}
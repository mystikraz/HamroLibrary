using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace HamroLibrary
{
    public partial class Editmember : System.Web.UI.Page
    {
        StringBuilder table = new StringBuilder();

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HamroLibraryDb"].ConnectionString);
             

        protected void Page_Load(object sender, EventArgs e)
        {
            int str = Convert.ToInt16(Request.QueryString["id"]);


            //Response.Write(str);

            try
            {

                con.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT member.fname, member.lname, member.address, member.gender, member.dob, member.phone, member.mobile, member.email, member.user_name, membertype.type, membertype.charge, membertype.totalLoans FROM member INNER JOIN membertype ON member.Id = membertype.member_id where member.Id="+ str;
                    
                    string results = cmd.ExecuteScalar().ToString();

                    SqlDataReader rd = cmd.ExecuteReader();
                    if (rd.HasRows)
                    {
                        while (rd.Read())
                        {
                            lblId.Text= Convert.ToString(rd[0]);
                            fname.Text = Convert.ToString(rd[0]);
                            lname.Text = Convert.ToString(rd[1]);
                            address.Text = Convert.ToString(rd[2]);
                            gender.Text = Convert.ToString(rd[3]);
                            dob.Text = Convert.ToString(rd[4]);
                            phone.Text = Convert.ToString(rd[5]);
                            mobile.Text = Convert.ToString(rd[6]);
                            email.Text = Convert.ToString(rd[7]);
                            UserName.Text = Convert.ToString(rd[8]);
                            MemberType.SelectedItem.Text = Convert.ToString(rd[9]);
                            charge.Text = Convert.ToString(rd[10]);
                            totalLoans.Text = Convert.ToString(rd[11]);
                            
                            
                        }

                    }

                    else
                    {
                        //Error notification
                        Response.Write("member name not found");

                    }

                    rd.Close();

                }
            }
            catch (SqlException ex)
            {
                //log error 
                //display friendly error to user

                Response.Write(ex.Message);
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

        protected void member_delete_Click(object sender, EventArgs e)
        {
            
        }

        protected void member_Update_Click(object sender, EventArgs e)

        {

            try
            {

                con.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    int str = Convert.ToInt16(Request.QueryString["id"]);

                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    //"Select Count(*) from [user] where name ='" + txtUname.Text + "' ";
                    //string UpdateQuery = "UPDATE [member] SET [fname] = '" + fname.Text + "', [Department] = '" + dept + "', [Age] = '" + age + "', [Address] = '" + address + "' WHERE [EmpID] = '" + empid + "'";
                    cmd.CommandText = "UPDATE member set fname='"+fname.Text+"', lname= '"+ lname.Text + "',address= '"+ address.Text + "', gender='" + gender.Text + "',dob='"+ dob.Text + "',phone='"+ phone.Text + "',mobile='" + mobile.Text + "',email='" + email.Text + "',user_name='" + UserName.Text + "' where Id='"+ str+"'";
                    cmd.ExecuteNonQuery();
                    Response.Write("success");

                }
            }
            catch (SqlException ex)
            {
                //log error 
                //display friendly error to user

                Response.Write(ex.Message);
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
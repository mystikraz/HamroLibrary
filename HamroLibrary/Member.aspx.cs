using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;

namespace HamroLibrary
{
    public partial class Member : System.Web.UI.Page
    {
        StringBuilder table = new StringBuilder();

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HamroLibraryDb"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userType"] == null)
            {
                Response.Redirect("login.aspx");

            }
            //try
            //{

            //    con.Open();
            //    using (SqlCommand cmd = new SqlCommand())
            //    {
            //        cmd.Connection = con;
            //        cmd.CommandType = CommandType.Text;
            //        cmd.CommandText = "SELECT member.Id, member.fname, member.lname, member.address, member.gender, member.dob, member.phone, member.mobile, member.email, member.user_name, membertype.type, membertype.charge, membertype.totalLoans FROM member INNER JOIN membertype ON member.Id = membertype.member_id";
            //        //cmd.CommandText = "INSERT INTO [member](fname,lname,address,gender,dob,phone,mobile,email,password,user_name) Values (@fname,@lname,@add,@gender,@dob,@phone,@mobile,@email,@password,@user_name)";
            //        //cmd.Parameters.AddWithValue("@fname", fna.Text);
            //        //cmd.Parameters.AddWithValue("@lname", Security.HashSHA1(Password.Text));
            //        //cmd.Parameters.AddWithValue("@address", Email.Text);
            //        //cmd.Parameters.AddWithValue("@gender", Address.Text);
            //        //cmd.Parameters.AddWithValue("@dob", DOB.Text);
            //        //cmd.Parameters.AddWithValue("@phone", DateTime.Today);
            //        //cmd.Parameters.AddWithValue("@mobile", DateTime.Today);
            //        //cmd.Parameters.AddWithValue("@email", UserType.Text);
            //        //cmd.Parameters.AddWithValue("@password", UserType.Text);
            //        //cmd.Parameters.AddWithValue("@user_name", UserType.Text);

            //        //int rowsAffected = cmd.ExecuteNonQuery();
            //        string results = cmd.ExecuteScalar().ToString();

            //        SqlDataReader rd = cmd.ExecuteReader();
            //        if (rd.HasRows)
            //        {
            //            while (rd.Read())
            //            {
            //                table.Append("<tr>");
            //                table.Append("<tr><td>"
            //                    + rd[0] + "</td><td>" 
            //                    + rd[1] + "</td><td>" 
            //                    + rd[2] + "</td><td>"
            //                    + rd[3] + "</td><td>"
            //                    + rd[4] + "</td><td>" 
            //                    + rd[5] + "</td><td>" 
            //                    + rd[6] + "</td><td>" 
            //                    + rd[7] + "</td><td>" 
            //                    + rd[8] + "</td><td>" 
            //                    + rd[9] + "</td><td>" 
            //                    + rd[10] + "</td><td>"
            //                    + rd[11] + "</td><td>" 
            //                    + rd[12] + "</td><td><a href="+"EditMember.aspx?id="+rd[0]+ ">Edit</a></td>");
            //                table.Append("</tr>");


            //                //mId.InnerText = Convert.ToString(rd[0]);
            //                //fname.InnerText = Convert.ToString(rd[1]);
            //                //lname.InnerText = Convert.ToString(rd[2]);
            //                //address.InnerText = Convert.ToString(rd[3]);
            //                //gender.InnerText = Convert.ToString(rd[4]);
            //                //dob.InnerText = Convert.ToString(rd[5]);
            //                //phone.InnerText = Convert.ToString(rd[6]);
            //                //mobile.InnerText = Convert.ToString(rd[7]);
            //                //email.InnerText = Convert.ToString(rd[8]);
            //                //user_name.InnerText = Convert.ToString(rd[9]);
            //                //member_type.InnerText = Convert.ToString(rd[10]);
            //                //charge.InnerText = Convert.ToString(rd[11]);
            //                //totalLoans.InnerText = Convert.ToString(rd[12]);
            //                //edit.HRef = "EditMember.aspx" + "?id=" + mId.InnerText
            //                //   + "&" + "fname=" + fname.InnerText
            //                //    + "&" + "lname=" + lname.InnerText
            //                //    + "&" + "address=" + address.InnerText
            //                //    + "&" + "gender=" + gender.InnerText
            //                //    + "&" + "dob=" + dob.InnerText
            //                //    + "&" + "phone=" + phone.InnerText
            //                //    + "&" + "mobile=" + mobile.InnerText
            //                //    + "&" + "email=" + email.InnerText
            //                //    + "&" + "user_name=" + user_name.InnerText
            //                //    + "&" + "member_type=" + member_type.InnerText
            //                //    + "&" + "totalLoans=" + totalLoans.InnerText;
            //                //table.Append("<tr>");
            //                //table.Append("<tr><td>" + rd[0] + "</td>" + "<td>" + rd[1] + "</td>" + "<td>" + rd[2] + "</td>");
            //                //table.Append("</tr>");

            //                //search_result.InnerHtml = "<li>" + rd[0] + " "+ rd[1]+ "</li>";

            //            }

            //        }

            //        else
            //        {
            //            //Error notification
            //            Response.Write("member name not found");

            //        }
            //        table.Append("</table>");
            //        //PlaceHolder.Controls.Add(new Literal { Text = table.ToString() });

            //        rd.Close();

            //    }
            //}
            //catch (SqlException ex)
            //{
            //    //log error 
            //    //display friendly error to user

            //    Response.Write(ex.Message);
            //}
            //finally
            //{
            //    if (con != null)
            //    {
            //        //cleanup connection i.e close 
            //        con.Close();
            //    }
            //}

        }

        protected void AddMember_Click(object sender, EventArgs e)
        {
            //redirect to AddMember page

            Response.Redirect("AddMember.aspx");
           
        }

        protected void MemberWithoutLoan_Click(object sender, EventArgs e)
        {
            //redirect to MemberWitoutLoan page
            Response.Redirect("MemberWithoutLoan.aspx");

        }
    }
}
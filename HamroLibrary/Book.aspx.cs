using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI.WebControls;

namespace HamroLibrary
{
    public partial class Book : System.Web.UI.Page
    {
        StringBuilder table = new StringBuilder();

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HamroLibraryDb"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userType"] == null)
            {
                Response.Redirect("login.aspx");
                
            }
            if (!this.IsPostBack)
            {
                //this.BindListView();
            }


            
        }

        private void BindListView()
        {
            con.Open();
            string book_list = "Select book.Id, book.name, isbn,qty,shelfno,published_date,edition,restriction_level,publisher.name, author.fname as author from book INNER JOIN author on book.author_id=author.Id INNER JOIN publisher on book.publisher_id=publisher.Id";

            SqlCommand cmd = new SqlCommand(book_list, con);

            string results = cmd.ExecuteScalar().ToString();
            SqlDataReader rd = cmd.ExecuteReader();
            table.Append("<table border='1' class='table'>");
            table.Append("<tr><th>Book ID</th><th>Book Name</th><th>Author</th>");
            table.Append("</tr>");

            if (rd.HasRows)
            {
                while (rd.Read())
                {
                    table.Append("<tr>");
                    table.Append("<tr><td>" + rd[0] + "</td><td>" + rd[1] + "</td><td>" + rd[2]+"</td>");
                    table.Append("</tr>");

                    //search_result.InnerHtml = "<li>" + rd[0] + " "+ rd[1]+ "</li>";

                }

            }
            else
            {
                Response.Write("book name not found");
                //table.Append("<tr>");
                //table.Append("<tr><td>Nothing found</td>");
                //table.Append("</tr>");
            }
            table.Append("</table>");
            PlaceHolderBook.Controls.Add(new Literal { Text = table.ToString() });
            rd.Close();

            //foreach (var result in results)
            //{
            //    search_result.InnerText ="<li>"+result+"</li>";
            //}
            con.Close();

        }

        protected void AddNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddBook.aspx");
        }

        protected void CheckOldBooks_Click(object sender, EventArgs e)
        {
            Response.Redirect("OldBook.aspx");
        }

        protected void BookWithoutLoan_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookWithoutLoan.aspx");

        }
    }
}
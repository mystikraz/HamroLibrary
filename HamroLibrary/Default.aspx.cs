using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HamroLibrary
{
    public partial class _Default : Page
    {
        StringBuilder table = new StringBuilder();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HamroLibraryDb"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userType"] != null)
            {
                //InnerMen.Visible = true;
                //welcomeText.InnerText = "Welcome "+ Session["userType"];
            }
            search_error.Visible = false;
            if (!this.IsPostBack)
            {
                this.BindGridView();
            }
            search_error.Visible = false;
        }

        private void BindGridView()
        {
            string val = txt_search.Text.Trim();
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("Select Id, name, qty, shelfno, restriction_level from book where name Like '%" + val + "%'", con);
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

        protected void btn_search_Click(object sender, EventArgs e)
        {
            this.BindGridView();

            //try
            //{
            //    con.Open();
            //    //string checkuser = "Select Count(*) from [user] where name ='" + txtUname.Text + "' ";

            //    string searchString = "Select book.Id, book.name, author.fname as author from book INNER JOIN author on book.author_id=author.id where book.name='" + txt_search.Text + "'";

            //    SqlCommand cmd = new SqlCommand(searchString, con);
            //    //int val = Convert.ToInt16(cmd.ExecuteScalar().ToString());
            //    try
            //    {
            //        string results = cmd.ExecuteScalar().ToString();
            //    }
            //    catch (Exception)
            //    {
            //        search_error.Visible = true;

            //       search_error.Text = "Book not found";
            //      // Response.Write(ViewState["error"]);
            //    }
            //    SqlDataReader rd = cmd.ExecuteReader();
            //    table.Append("<table border='1' class='table'>");
            //    table.Append("<tr><th>Book ID</th><th>Book Name</th><th>Author</th>");
            //    table.Append("</tr>");

            //    if (rd.HasRows)
            //    {
            //        search_table.Visible = true;
            //        while (rd.Read())
            //        {
            //            txt_id.Text = Convert.ToString(rd[0]);
            //            txt_title.Text = Convert.ToString(rd[1]);
            //            txt_author.Text = Convert.ToString(rd[2]);
            //            //table.Append("<tr>");
            //            //table.Append("<tr><td>" + rd[0] + "</td>" + "<td>" + rd[1] + "</td>" + "<td>" + rd[2] + "</td>");
            //            //table.Append("</tr>");

            //            //search_result.InnerHtml = "<li>" + rd[0] + " "+ rd[1]+ "</li>";

            //        }

            //    }

            //    //table.Append("</table>");
            //    //PlaceHolderSearch.Controls.Add(new Literal { Text = table.ToString() });
            //    rd.Close();

            //    //foreach (var result in results)
            //    //{
            //    //    search_result.InnerText ="<li>"+result+"</li>";
            //    //}
            //    con.Close();
            //}
            //catch (SqlException ex)
            //{
            //    ex.ToString();
            //}

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
    }
}
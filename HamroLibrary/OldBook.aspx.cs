using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace HamroLibrary
{
    public partial class OldBook : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HamroLibraryDb"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userType"] == null)
            {
                Response.Redirect("login.aspx");

            }
            if (!IsPostBack)
            {
                gvbind();
            }
            lblMesage.Visible = false;
        }

        private void gvbind()
        {
            con.Open();
            DateTime oneYear = DateTime.Today.AddYears(-1);

            SqlCommand cmd = new SqlCommand("SELECT Id, name as BookTitle, qty as AvailableStock, published_date from book where convert(date,published_date, 103)<=convert(date,'" + oneYear+ "', 103 )", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else
            {
                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                GridView1.DataSource = ds;
                GridView1.DataBind();
                int columncount = GridView1.Rows[0].Cells.Count;
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
                GridView1.Rows[0].Cells[0].Text = "No Records Found";
            }
        }

        protected void GridView1_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            Label lbl_ID = (Label)GridView1.Rows[e.RowIndex].FindControl("lblID");
           
            con.Open();
            string cmdstr = "delete from book where id=@Id";
            SqlCommand cmd = new SqlCommand(cmdstr, con);
            cmd.Parameters.AddWithValue("@Id", lbl_ID.Text);
            int rowsAffected = cmd.ExecuteNonQuery();
            if (rowsAffected == 1)
            {
                //Adding book back to stock
                lblMesage.Visible = true;
                lblMesage.CssClass = "alert alert-success";
                lblMesage.Text = "Old Books more than 1 years deleted!";
                



            }
            else
            {
                //Error notification
                lblMesage.Visible = true;
                lblMesage.CssClass = "alert alert-danger";
                lblMesage.Text = "Sorry! Couldn't delete old books";
            }

            con.Close();
            gvbind();
        }
    }
}
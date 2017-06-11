using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace HamroLibrary
{
    public partial class Profile : System.Web.UI.Page
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
                GvBindProfile();
            }

        }

        private void GvBindProfile()
        {
            con.Open();
            string userName = Convert.ToString(Session["user"]);
            string user_type = Convert.ToString(Session["userType"]);
            if (user_type == "Manager")
            {
                SqlCommand cmd1 = new SqlCommand("SELECT Id, name, password, email, address, mobile, dob from [user]", con);
                SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
                DataSet ds1 = new DataSet();
                da1.Fill(ds1);
                con.Close();
                if (ds1.Tables[0].Rows.Count > 0)
                {
                    GridView1.DataSource = ds1;
                    GridView1.DataBind();
                }
                else
                {
                    ds1.Tables[0].Rows.Add(ds1.Tables[0].NewRow());
                    GridView1.DataSource = ds1;
                    GridView1.DataBind();
                    int columncount = GridView1.Rows[0].Cells.Count;
                    GridView1.Rows[0].Cells.Clear();
                    GridView1.Rows[0].Cells.Add(new TableCell());
                    GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
                    GridView1.Rows[0].Cells[0].Text = "No Records Found";
                }
            }
            else
            {
                SqlCommand cmd = new SqlCommand("SELECT Id, name, password, email, address, mobile, dob from [user] where name='" + userName + "' ", con);
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
            
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GvBindProfile();

            //GridView1.DataBind();

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            //TextBox txtId = (TextBox)GridView1.Rows[e.RowIndex].FindControl("lblID");
            //TextBox txtName = (TextBox)GridView1.Rows[e.RowIndex].FindControl("lblname");
            //TextBox txtPassword = (TextBox)GridView1.Rows[e.RowIndex].FindControl("lblPassword");
            //TextBox txtEmail = (TextBox)GridView1.Rows[e.RowIndex].FindControl("lblEmail");
            //TextBox txtAddress = (TextBox)GridView1.Rows[e.RowIndex].FindControl("lblAddress");
            //TextBox txtMobile = (TextBox)GridView1.Rows[e.RowIndex].FindControl("lblMobile");
            //TextBox txtDob = (TextBox)GridView1.Rows[e.RowIndex].FindControl("lbldob");
            //con.Open();

            //SqlCommand cmd = new SqlCommand("UPDATE user SET id ='" + txtId.Text + "',name ='" + txtName.Text + "',password ='" + Security.HashSHA1(txtPassword.Text) + "',email ='" + txtEmail.Text + "',address ='" + txtAddress.Text + "',mobile ='" + txtMobile.Text + "',dob ='" + txtDob.Text + "'  WHERE id='" + txtId.Text + "'");


            int userid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            Label lblID = (Label)row.FindControl("lblID");
            TextBox txtName = (TextBox)row.Cells[0].FindControl("lblname");
            TextBox txtEmail = (TextBox)row.Cells[1].FindControl("lblPassword");
            TextBox txtPassword = (TextBox)row.Cells[2].FindControl("lblEmail");
            TextBox txtAddress = (TextBox)row.Cells[3].FindControl("lblAddress");
            TextBox txtMobile = (TextBox)row.Cells[4].FindControl("lblMobile");
            TextBox txtDob = (TextBox)row.Cells[5].FindControl("lblEmail");


            GridView1.EditIndex = -1;
            con.Open();
            //SqlCommand cmd = new SqlCommand("SELECT * FROM detail", conn);
            //SqlCommand cmd = new SqlCommand("update detail set name='" + textName.Text + "',address='" + textadd.Text + "',country='" + textc.Text + "'where id='" + userid + "'", conn);
            SqlCommand cmd = new SqlCommand("UPDATE user SET id ='" + lblID.Text + "',name ='" + txtName.Text + "',password ='" + Security.HashSHA1(txtPassword.Text) + "',email ='" + txtEmail.Text + "',address ='" + txtAddress.Text + "',mobile ='" + txtMobile.Text + "',dob ='" + txtDob.Text + "'  WHERE id='" + userid + "'");


            cmd.ExecuteNonQuery();
            GvBindProfile();
            con.Close();

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GvBindProfile();
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GvBindProfile();
        }
    }
}
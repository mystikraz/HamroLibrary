using System;

namespace HamroLibrary
{
    public partial class Author : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userType"] == null)
            {
                Response.Redirect("login.aspx");

            }
        }

        protected void AddNewAuthor_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddAuthor.aspx");
        }
    }
}
using System;

namespace HamroLibrary
{
    public partial class Publisher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userType"] == null)
            {
                Response.Redirect("login.aspx");

            }
        }

       
        protected void AddNewPublisher_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddPublisher.aspx");

        }
    }
}
using System;

namespace HamroLibrary
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["userType"] = null;
            Response.Redirect("default.aspx");
        }
    }
}
using System;

namespace HamroLibrary
{
    public partial class User : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("Adduser");
           
        }
    }
}
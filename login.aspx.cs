using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace dbms
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            user usr = connectionclass.LoginUser(txtLogin.Text, txtPassword.Text);

            if (usr != null)
            {
                Session["login"] = usr.Name;
                Session["type"] = usr.Type;

                Response.Redirect("home.aspx");
            }
            else
            {
                lblError.Text = "Login failed";
            }
        }
    }
}
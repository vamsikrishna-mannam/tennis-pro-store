using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace dbms
{
    public partial class manage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["login"] != null)
            {
                Label1.Text = "Welcome " + Session["login"];
                Label1.Visible = true;
                LinkButton1.Text = "Logout";
            }
            else
            {
                Label1.Visible = false;
                LinkButton1.Text = "Login";
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (LinkButton1.Text == "Login")
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                Session.Clear();
                Response.Redirect("home.aspx");
            }
        }
    }
}
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace dbms
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            user usr = new user(txtName.Text, txtPassword.Text, txtEmail.Text, "user");

            lblResult.Text = connectionclass.RegisterUser(usr);
        }
    }
}
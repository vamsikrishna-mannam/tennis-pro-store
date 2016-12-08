using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace dbms
{
    public partial class ordersdetailed : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["type"] != "administrator")
            {
                Response.Redirect("login.aspx");
            }
            Label2.Text = string.Format("<h2>Client: {0}<br />Date: {1}</h2>", Request.QueryString["client"], Request.QueryString["date"]);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string client = Request.QueryString["client"];
            DateTime date = Convert.ToDateTime(Request.QueryString["date"]);

            user usr = connectionclass.GetUserDetails(client);
            ArrayList orderList = connectionclass.GetDetailedOrders(client, date);

            connectionclass.UpdateOrders(client, date);
            SendEmail(usr.Name, usr.Email, orderList);
            Response.Redirect("orders_list.aspx");
        }



        private void SendEmail(string client, string email, ArrayList orderList)
        {
            System.Net.Mail.MailAddress to = new MailAddress(email);

            MailAddress from = new MailAddress("mannamvamsikrishna9@gmail.com");
            string body = string.Format(
                @"Hello {0},
                We are happy to say that your order placed on {1} has been shipped and shipment tracking will be provided within one day.

                Your ordered products:
                {2}

                Thank you for shopping at our store.

                Kind regards
                Vamsikrishna", client, Request.QueryString["date"], GenerateOrderedItems(orderList));

            MailMessage mail = new MailMessage(from, to);
            mail.Body = body;
            mail.Subject = "Your order has been prepared";

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;

            smtp.Credentials = new NetworkCredential("mannamvamsikrishna9@gmail.com", "r4db1usu16");
            smtp.EnableSsl = true;

            smtp.Send(mail);
        }



        private string GenerateOrderedItems(ArrayList orderList)
        {
            string result = "";
            double totalAmount = 0;

            foreach (order odr in orderList)
            {
                result += string.Format(@"
                    - {0} ({1} $)           X {2}                 = {3} $",
                    odr.Product, odr.Price, odr.Amount, (odr.Amount * odr.Price));
                    totalAmount += (odr.Amount * odr.Price);
            }

            result += string.Format(@"

Total Amount: {0} $", totalAmount);
            return result;
        }

    }
}
using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace dbms
{
    public partial class orders_list : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label2.Visible = false;
            if ((string)Session["type"] != "administrator")
                Response.Redirect("login.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Label2.Visible = true;
            GenerateOrders(false, TextBox1.Text, TextBox2.Text);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Label2.Visible = true;
            GenerateOrders(true, TextBox1.Text, TextBox2.Text);
        }

        private void GenerateOrders(bool shipped, string beginDate, string endDate)
        {
            StringBuilder sb = new StringBuilder();
            DateTimeFormatInfo info = new CultureInfo("en-US", false).DateTimeFormat;
            string shippedString = shipped ? "Completed" : "Open";
            DateTime date1 = Convert.ToDateTime(beginDate, info);
            DateTime date2 = Convert.ToDateTime(endDate, info);
            DateTime incrementalDate = date1;
            while (incrementalDate <= date2)
            {
                sb.Append(string.Format(@"<b>{0} orders for {1} {2}</b><br />", shippedString, info.GetMonthName(incrementalDate.Month), incrementalDate.Year));
                ArrayList orderList = connectionclass.GetGroupedOrders(incrementalDate, date2, shipped);

                if (orderList.Count == 0)
                {
                    sb.Append("No orders for this period<br/><br/>");
                }
                else
                {
                    sb.Append(@"<table class='orderTable'>
                                <tr><th>Date</th><th>Client</th><th>Total</th></tr>");

                    foreach (groupedorder grpodr in orderList)
                    {
                        sb.Append(string.Format("<tr><td>{0}</td><td>{1}</td><td>$ {2}</td><td>{3}</td><td>{4}</td></tr>",
                                                grpodr.Date, grpodr.Client, grpodr.Total,
                                                string.Format("<a href='pdf.aspx?client={0}&date={1}'>Invoice</a>", grpodr.Client,grpodr.Date),
                                                string.Format("<a href='ordersdetailed.aspx?client={0}&date={1}'>View Detail</a>", grpodr.Client, grpodr.Date)));
                    }
                    sb.Append("</table>");
                }

                incrementalDate = incrementalDate.AddMonths(1);
                incrementalDate = new DateTime(incrementalDate.Year, incrementalDate.Month, 1);
            }

            if (shipped == false)
                Label2.Text = sb.ToString();
            else
                Label2.Text = sb.ToString();
        }
    }
}
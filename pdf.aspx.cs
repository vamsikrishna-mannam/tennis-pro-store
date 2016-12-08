using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.xml.simpleparser;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;
using System.Text;
using iTextSharp.tool.xml;

namespace dbms
{
    public partial class pdf : System.Web.UI.Page
    {
        private static SqlConnection con;
        private static SqlCommand cmd;

        private DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

            if ((string)Session["type"] != "administrator")
            {
                Response.Redirect("login.aspx");
            }
            Label2.Text = string.Format("<h2>Invoice for <br />Client: {0}<br />Date: {1}</h2>", Request.QueryString["client"], Request.QueryString["date"]);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["tennisConnectionString"].ToString();
            con = new SqlConnection(connectionString);
            string client = Request.QueryString["client"];
            string date = Request.QueryString["date"];
            string query = "select id, product, sum(amount) as amount, price, sum(amount*price) as total from orders where client='" + client + "' and date='" + date + "' group by id,product, price";
            cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();
            da.Dispose();
            

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    StringBuilder sb = new StringBuilder();

                    sb.Append("<table width='100%' cellspacing='0' cellpadding='2'>");
                    sb.Append("<tr><td align='center' style='background-color: red' colspan = '2'><b>Order Sheet</b></td></tr>");
                    sb.Append("<tr><td colspan = '2'></td></tr>");
                    sb.Append("</td><td align = 'right'><b>Date: </b>");
                    sb.Append(DateTime.Now);
                    sb.Append(" </td></tr>");
                    sb.Append("<tr><td colspan = '2'><b>Company Name: </b>");
                    sb.Append("Tennis Pro Store");
                    sb.Append("</td></tr>");
                    sb.Append("</table>");
                    sb.Append("<br />");

                    sb.Append("<table border = '1'>");
                    sb.Append("<tr>");
                    sb.Append("<th>");
                    sb.Append("Order no:");
                    sb.Append("</th>");
                    sb.Append("<th>");
                    sb.Append("Product:");
                    sb.Append("</th>");
                    sb.Append("<th>");
                    sb.Append("Quantity:");
                    sb.Append("</th>");
                    sb.Append("<th>");
                    sb.Append("Price:");
                    sb.Append("</th>");
                    sb.Append("<th>");
                    sb.Append("Total:");
                    sb.Append("</th>");
                    sb.Append("</tr>");
                    foreach (DataRow row in dt.Rows)
                    {
                        sb.Append("<tr>");
                        foreach (DataColumn column in dt.Columns)
                        {
                            sb.Append("<td>");
                            sb.Append(row[column]);
                            sb.Append("</td>");
                        }
                        sb.Append("</tr>");
                    }
                    sb.Append("<tr><td align = 'right' colspan = '");
                    sb.Append(dt.Columns.Count - 1);
                    sb.Append("'>Total</td>");
                    sb.Append("<td>");
                    sb.Append(dt.Compute("sum(Total)", ""));
                    sb.Append("</td>");
                    sb.Append("</tr></table>");

                    StringReader sr = new StringReader(sb.ToString());
                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                   // XMLWorker htmlparser = new XMLWorker(pdfDoc);
                    PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    pdfDoc.Open();
                    htmlparser.Parse(sr);
                    pdfDoc.Close();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=Invoice_" + client + ".pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Write(pdfDoc);
                    Response.End();
                }
            }




        }
    }
}
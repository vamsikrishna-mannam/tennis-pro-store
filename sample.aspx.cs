using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace dbms
{
    public partial class sample : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            fill();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            fill();
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            fill();
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            fill();
        }

        protected void fill()
        {
            ArrayList productList = new ArrayList();
            if (!IsPostBack)
            {
               productList = connectionclass.getproducts("%","%","%");

            }
            else
            {
                string a = DropDownList1.SelectedValue.ToString();
                string b = a.Trim();
                string c = DropDownList2.SelectedValue.ToString();
                string d = c.Trim();
                string e = DropDownList3.SelectedValue.ToString();
                string f = e.Trim();

                productList = connectionclass.getproducts(b, d, f);
            }

            StringBuilder sb = new StringBuilder();
            foreach (product prd in productList)
            {
                sb.Append(
                    string.Format(
                        @"<table class='tennisTable'>
            <tr>
                <th rowspan='6' width='150px'><img runat='server' src='{5}' /></th>
                <th width='50px'>Name: </td>
                <td>{0}</td>
            </tr>

            <tr>
                <th>Type: </th>
                <td>{1}</td>
            </tr>

            <tr>
                <th>Price: </th>
                <td>{2} $</td>
            </tr>

            <tr>
                <th>Origin: </th>
                <td>{3}</td>
            </tr>

            <tr>
                <th>Gender: </th>
                <td>{4}</td>
            </tr>

            <tr>
                <td colspan='2'>{6}</td>
            </tr>           
            
           </table>",

                        prd.Name, prd.Type, prd.Price, prd.Country, prd.Gender,prd.Image, prd.Review));
                        Label2.Text = sb.ToString();
                

            }
            if(productList.Count==0)
            {
                Label2.Text = "No Products To Display";
            }
         


        }


       
    }
}
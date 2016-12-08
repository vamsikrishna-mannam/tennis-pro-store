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
    public partial class tennis1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            fill();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            fill();
        }

        protected void fill()
        {
            ArrayList tennisList = new ArrayList();
            if(!IsPostBack)
            {
                tennisList = connectionclass.GetCoffeeByType("%");

            }
            else
            {
                tennisList = connectionclass.GetCoffeeByType(DropDownList1.SelectedValue);
            }
                
            StringBuilder sb = new StringBuilder();
            foreach (tennis tns in tennisList)
            {
                sb.Append(
                    string.Format(
                        @"<table class='tennisTable'>
            <tr>
                <th rowspan='6' width='150px'><img runat='server' src='{6}' /></th>
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
                <th>Power: </th>
                <td>{3}</td>
            </tr>

            <tr>
                <th>Origin: </th>
                <td>{4}</td>
            </tr>

            <tr>
                <td colspan='2'>{5}</td>
            </tr>           
            
           </table>",

                        tns.Name, tns.Type, tns.Price, tns.Power, tns.Country, tns.Review, tns.Image));

                Label1.Text = sb.ToString();

            }
        }
    }
}
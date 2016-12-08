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
    public partial class shop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            GenerateControls();
        }
        protected void btnOk_Click(object sender, EventArgs e)
        {


            
            Authenticate();
            SendOrder();

            lblResult.Text = "Your order has been placed, thank you for shopping at our store";
            btnOk.Visible = false;
            btnCancel.Visible = false;
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session["orders"] = null;
            btnOk.Visible = false;
            btnCancel.Visible = false;
            lblResult.Visible = false;

        }
        protected void btnOrder_Click(object sender, EventArgs e)
        {
            Authenticate();
            GenerateReview();
        }



        private void GenerateControls()
        {
            ArrayList productList = connectionclass.getproducts("%", "%", "%");

            foreach (product prd in productList)
            {
                string s = prd.Image;
                string s1 = s.Trim();
                Panel coffeePanel = new Panel();
                Image image = new Image { ImageUrl = s1, CssClass = "ProductsImage" };
                Literal literal = new Literal { Text = "<br />" };
                Literal literal2 = new Literal { Text = "<br />" };
                Label lblName = new Label { Text = prd.Name, CssClass = "ProductsName" };
                Label lblPrice = new Label
                {
                    Text = String.Format("{0:0.00}", prd.Price +"$"+ "<br />"),
                    CssClass = "ProductsPrice"
                };
                TextBox textBox = new TextBox
                {
                    ID = prd.Id.ToString(),
                    CssClass = "ProductsTextBox",
                    Width = 60,
                    Text = "0"
                };
                RegularExpressionValidator regex = new RegularExpressionValidator
                {
                    ValidationExpression = "^[0-9]*",
                    ControlToValidate = textBox.ID,
                    ErrorMessage = "Please enter a number."
                };
                coffeePanel.Controls.Add(image);
                coffeePanel.Controls.Add(literal);
                coffeePanel.Controls.Add(lblName);
                coffeePanel.Controls.Add(literal2);
                coffeePanel.Controls.Add(lblPrice);
                coffeePanel.Controls.Add(textBox);
                coffeePanel.Controls.Add(regex);

                pnlProducts.Controls.Add(coffeePanel);
            }
        }




        private ArrayList GetOrders()
        {
            ContentPlaceHolder cph = (ContentPlaceHolder)Master.FindControl("contentplaceholder1");
           ControlFinder<TextBox> cf = new ControlFinder<TextBox>();
           cf.FindChildControlsRecursive(cph);
          var textBoxList = cf.FoundControls;
            ArrayList orderList = new ArrayList();

            foreach (TextBox textBox in textBoxList)
            {
                if (textBox.Text != "")
                {
                   int orders = Convert.ToInt32(textBox.Text);

                    if (orders > 0)
                    {
                        product prd = connectionclass.GetProductById(Convert.ToInt32(textBox.ID));
                      order odr = new order(
                            Session["login"].ToString(), prd.Name, orders, prd.Price, DateTime.Now, false);

                     
                       orderList.Add(odr);
                    }
                }
            }
            return orderList;
        }



        private void GenerateReview()
        {
            double totalAmount = 0;
            ArrayList orderList = GetOrders();
            Session["orders"] = orderList;

            StringBuilder sb = new StringBuilder();
            sb.Append("<table>");
            sb.Append("<h3>Please review your order</h3>");

            foreach (order odr in orderList)
            {
                double totalRow = odr.Price * odr.Amount;
                sb.Append(String.Format(@"<tr>
                                            <td width = '50px'>{0} X </td>
                                            <td width = '200px'>{1} ({2})</td>
                                            <td>{3}</td><td>$</td>
                                        </tr>", odr.Amount, odr.Product, odr.Price, String.Format("{0:0.00}", totalRow)));
                totalAmount = totalAmount + totalRow;
            }

            sb.Append(String.Format(@"<tr>
                                        <td><b>Total: </b></td>
                                        <td><b>{0} $ </b></td>
                                      </tr>", totalAmount));
            sb.Append("</table>");

           
                lblResult.Text = sb.ToString();
                lblResult.Visible = true;
                btnOk.Visible = true;
                btnCancel.Visible = true;
            
        }




        private void SendOrder()
        {
            ArrayList orderList = (ArrayList)Session["orders"];
            connectionclass.AddOrders(orderList);
            Session["orders"] = null;
        }

        private void Authenticate()
        {
            if (Session["login"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }







    }
}
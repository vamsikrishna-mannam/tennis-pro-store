using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace dbms
{
    public partial class tennis_add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string selectedValue = ddlImage.SelectedValue;
            ShowImages();
            ddlImage.SelectedValue = selectedValue;
        }

        protected void btnUploadImage_Click(object sender, EventArgs e)
        {
            try
            {
                string filename = Path.GetFileName(FileUpload1.FileName);
                FileUpload1.SaveAs(Server.MapPath("images/") + filename);
                lblResult.Text = "Image " + filename + " succesfully uploaded!";
                Page_Load(sender, e);
            }
            catch (Exception)
            {
                lblResult.Text = "Upload failed!";
            }

        }
        private void ShowImages()
        {
            string[] images = Directory.GetFiles(Server.MapPath("~/images/"));

            ArrayList imageList = new ArrayList();

            foreach (string image in images)
            {
                string imageName = image.Substring(image.LastIndexOf(@"\") + 1);
                imageList.Add(imageName);
            }
            ddlImage.DataSource = imageList;
            ddlImage.DataBind();
        }
        private void Clear()
        {
            txtCountry.Text = "";
            txtName.Text = "";
            txtPrice.Text = "";
            txtReview.Text = "";
            txtCategory.Text = "";
            txtType.Text = "";
            txtBrand.Text = "";
            txtGender.Text = "";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string name = txtName.Text;
                string type = txtType.Text;
                int price = Convert.ToInt32(txtPrice.Text);
                string gender = txtGender.Text;
                string category = txtCategory.Text;
                string brand = txtBrand.Text;
                string country = txtCountry.Text;
                string image = "../images/" + ddlImage.SelectedValue;
                string review = txtReview.Text;

                product prd = new product(name, type, price, country, gender, image, review, category, brand);
                connectionclass.addproduct(prd);
                lblResult.Text = "Upload succesful!";
                Clear();
            }
            catch (Exception)
            {
                lblResult.Text = "Upload failed!";
            }
        }

        protected void txtName_TextChanged(object sender, EventArgs e)
        {


        }
    }
}
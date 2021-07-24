using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CateringSystemWebApp.URL;

namespace CateringSystemWebApp.ui
{
    public partial class add_admin : System.Web.UI.Page
    {
        private Function func;
        Random random=new Random();
        public add_admin()
        {
            func = Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void createButton_OnClick(object sender, EventArgs e)
        {
            string pic = "";
            string ran = random.Next(111111, 9999999).ToString();
            if (fileImage.HasFile)
            {
                string imagePath = Server.MapPath("/photos/") + ran + fileImage.FileName + ".png";
                fileImage.PostedFile.SaveAs(imagePath);
                pic = "/photos/" + ran + fileImage.FileName + ".png";
            }
            bool result = Registration(txtName.Value, txtName.Value, txtMobileNo.Value, ddlType.SelectedValue,
                     ddlGender.SelectedItem.ToString(), txtDob.Text, "0", "0", txtNewPass.Value, pic, "A", "", "", "0");
            if (result)
            {
                func.AlertWithRedirect(this, "Added successfully", "/web/home.aspx");
            }
            else
            {
                func.PopAlert(this, "failed to add");
            }

        }
        private bool Registration(string name, string email, string mobile, string type, string gender, string dob, string district, string thana, string pass, string pic, string status, string bkash, string trans, string amount)
        {
            bool ans = false;
            try
            {
                ans = func.Execute(
                     $@"INSERT INTO Register(Name,Email,MobileNo,Type,Gender,Dob,District,Thana,Password,Picture,Status,BkashNo,TransNo,Amount,Intime) VALUES('{name}','{email}','{mobile}','{type}','{gender}','{dob}','{district}','{thana}','{pass}','{pic}','{status}','{bkash}','{trans}','{amount}','{func.Date()}')");

            }
            catch (Exception ex)
            {

            }
            return ans;
        }
        private void Refresh()
        {
            txtName.Value = txtEmail.Value = txtMobileNo.Value = txtDob.Text = "";
            ddlGender.SelectedIndex = ddlType.SelectedIndex = -1;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CateringSystemWebApp.URL;

namespace CateringSystemWebApp.web
{
    public partial class profile : System.Web.UI.Page
    {
        private Function func;
        Random ran = new Random();

        public profile()
        {
            func = Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }
        private void LoadData()
        {
            profileImage.ImageUrl =
                    func.IsExist($"SELECT Picture FROM Register WHERE RegId='{func.UserIdCookie()}'");
            ViewState["picture"] =
                     func.IsExist($"SELECT Picture FROM Register WHERE RegId='{func.UserIdCookie()}'");

            nameLabel.Text = txtName.Text =
                    func.IsExist($"SELECT Name FROM Register WHERE RegId='{func.UserIdCookie()}'");

            lblEmail.Text = func.EmailCookie();
            lblMobile.Text = txtMobile.Text =
                    func.IsExist($"SELECT MobileNo FROM Register WHERE RegId='{func.UserIdCookie()}'");

            lblGender.Text =
                ddlGender.Text =
                    func.IsExist($"SELECT Gender FROM Register WHERE RegId='{func.UserIdCookie()}'");

            lblDob.Text = txtDob.Text =
                    func.IsExist($"SELECT Dob FROM Register WHERE RegId='{func.UserIdCookie()}'");
            txtPass.Text = func.IsExist($"SELECT Password FROM Register WHERE RegId='{func.UserIdCookie()}'");

        }
        protected void btnEdit_OnServerClick(object sender, EventArgs e)
        {
            VisibleElements(false, true);
        }
        private void VisibleElements(bool first, bool second)
        {
            fileProfile.Visible = txtName.Visible = txtMobile.Visible = ddlGender.Visible = txtDob.Visible = txtPass.Visible = lnkUpdate.Visible = second;
            nameLabel.Visible =
                lblMobile.Visible =
                    lblGender.Visible =
                        lblDob.Visible = lblPass.Visible = btnEdit.Visible = first;

        }
        private bool IsMobileExist()
        {
            bool ans = false;
            string x = func.IsExist($"SELECT MobileNo FROM Register WHERE MobileNo='{txtMobile.Text}' AND RegId!='{func.UserIdCookie()}'");
            if (x != "")
            {
                ans = true;
            }
            return ans;
        }
        protected void lnkUpdate_OnClick(object sender, EventArgs e)
        {
            if (txtName.Text == "")
            {
                func.PopAlert(this, "Name is required");
            }
            else if (txtMobile.Text == "")
            {
                func.PopAlert(this, "Mobile no is required");
            }
            else if (IsMobileExist())
            {
                func.PopAlert(this, "Mobile no already exist");
            }
            else if (txtPass.Text == "")
            {
                func.PopAlert(this, "Password is required");
            }
            else
            {
                string pic = "";
                if (fileProfile.HasFile)
                {
                    string imagePath = Server.MapPath("/photos/") + ran + fileProfile.FileName + ".png";
                    fileProfile.PostedFile.SaveAs(imagePath);
                    pic = "/photos/" + ran + fileProfile.FileName + ".png";
                }
                else
                {
                    pic = ViewState["picture"].ToString();
                }
                bool ans =
                    func.Execute(
                        $@"UPDATE Register SET Name='{txtName.Text}',MobileNo='{txtMobile.Text}',Gender='{
                            ddlGender.SelectedItem.ToString()}',Dob='{txtDob.Text}',District='',Thana='',Password='{txtPass.Text}',Picture='{pic}' WHERE RegId='{func.UserIdCookie()}'");
                if (ans)
                {
                    VisibleElements(true, false);
                    LoadData();
                    func.Logout();
                }
                else
                {
                    func.PopAlert(this, "Updation failed");
                }
            }
        }
    }
}
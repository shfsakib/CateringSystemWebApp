using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CateringSystemWebApp.URL;

namespace CateringSystemWebApp
{
    public partial class log_in : System.Web.UI.Page
    {
        private Function func;
        Random random = new Random();
        private HttpCookie cookie = Function.GetCookie();
        public log_in()
        {
            func = Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { 
                if (cookie != null)
                {
                    if (cookie["Type"] == "Cust")
                    {
                        Response.Redirect("/web/home.aspx");
                    }
                    else if (cookie["Type"] == "Cate")
                    {
                        Response.Redirect("/ui/index.aspx");
                    }
                    else if (cookie["Type"] == "Admin" || cookie["Type"] == "Moderator")
                    {
                        Response.Redirect("/ui/index.aspx");
                    }
                }
                else
                {

                    txtlogEmail.Focus();
                    func.BindDropDown(ddlDis, "DIstrict", $@"SELECT District Name, Id FROM District ORDER BY Name ASC");
                    func.BindDropDown(ddlThana, "Thana", $@"SELECT DISTINCT Thana Name,Id FROM Thana ORDER BY Name ASC");
                }
            }
        }
        protected void btnCatReg_OnClick(object sender, EventArgs e)
        {
            if (txtCatName.Value == "")
            {
                func.PopAlert(this, "Name is required");
            }
            else if (txtCatEmail.Value == "")
            {
                func.PopAlert(this, "Email is required");
            }
            else if (txtCatMobile.Value == "")
            {
                func.PopAlert(this, "Mobile no is required");
            }
            else if (ddlDis.SelectedIndex == -1)
            {
                func.PopAlert(this, "District is required");
            }
            else if (ddlThana.SelectedIndex == -1)
            {
                func.PopAlert(this, "Thana is required");
            }
            else if (txtCatPass.Value == "")
            {
                func.PopAlert(this, "Password is required");
            }
            else
            {
                string pic = "";
                string ran = random.Next(111111, 9999999).ToString();
                if (fileCat.HasFile)
                {
                    string imagePath = Server.MapPath("/photos/") + ran + fileCat.FileName + ".png";
                    fileCat.PostedFile.SaveAs(imagePath);
                    pic = "/photos/" + ran + fileCat.FileName + ".png";
                }
                bool result = Registration(txtCatName.Value, txtCatEmail.Value, txtCatMobile.Value, "Cate",
                     "", "", ddlDis.SelectedValue, ddlThana.SelectedValue, txtCatPass.Value, pic, "W", txtCatBkash.Value, txtCatTrans.Value, "200");
                if (result)
                {
                    func.AlertWithRedirect(this, "Registered successfully. Please wait for admin approval. We will notify you after approval.", "/web/home.aspx");
                }
                else
                {
                    func.PopAlert(this, "failed to register");
                }
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

        protected void btnCusReg_OnClick(object sender, EventArgs e)
        {
            if (txtCusName.Value == "")
            {
                func.PopAlert(this, "Name is required");
            }
            else if (txtCusEmail.Value == "")
            {
                func.PopAlert(this, "Email is required");
            }
            else if (txtCusMobile.Value == "")
            {
                func.PopAlert(this, "Mobile no is required");
            }
            else if (txtCusDOB.Value == "")
            {
                func.PopAlert(this, "Date of birth is required");
            }
            else if (txtCusPass.Value == "")
            {
                func.PopAlert(this, "Password is required");
            }
            else if (ddlGender.SelectedIndex == -1)
            {
                func.PopAlert(this, "Gender is required");
            }
            else
            {
                string pic = "";
                string ran = random.Next(111111, 9999999).ToString();
                if (fileCus.HasFile)
                {
                    string imagePath = Server.MapPath("/photos/") + ran + fileCus.FileName + ".png";
                    fileCus.PostedFile.SaveAs(imagePath);
                    pic = "/photos/" + ran + fileCus.FileName + ".png";
                }
                bool result = Registration(txtCusName.Value, txtCusEmail.Value, txtCusMobile.Value, "Cust",
                     ddlGender.SelectedItem.ToString(), txtCusDOB.Value, "0", "0", txtCusPass.Value, pic, "A", "", "", "0");
                if (result)
                {
                    func.AlertWithRedirect(this, "Registered successfully", "/web/home.aspx");
                }
                else
                {
                    func.PopAlert(this, "failed to register");
                }
            }
        }

        protected void btnLogin_OnServerClick(object sender, EventArgs e)
        {
            if (txtlogEmail.Value == "")
            {
                func.PopAlert(this, "Email is required");
            }
            else if (!func.EmailValidation(txtlogEmail.Value))
            {
                func.PopAlert(this, "Enter valid email");
            }
            else if (txtlogPassword.Value == "")
            {
                func.PopAlert(this, "Password is required");
            }
            else
            {
                string password =
                    func.IsExist(
                        $"SELECT Password FROM Register WHERE Email='{txtlogEmail.Value}' AND Password='{txtlogPassword.Value}' AND Status='A' COLLATE Latin1_General_CS_AI");
                if (password == txtlogPassword.Value.Trim())
                {
                    HttpCookie cookie = Function.CreateCookie();
                    cookie.Expires = DateTime.Now.AddDays(-1);
                    HttpContext.Current.Response.Cookies.Add(cookie);
                    cookie["Name"] = func.IsExist($"SELECT Name FROM Register WHERE Email='{txtlogEmail.Value}'");
                    cookie["Type"] = func.IsExist($"SELECT Type FROM Register WHERE Email='{txtlogEmail.Value}'");
                    cookie["UserId"] = func.IsExist($"SELECT RegId FROM Register WHERE Email='{txtlogEmail.Value}'");
                    cookie["Email"] = func.IsExist($"SELECT Email FROM Register WHERE Email='{txtlogEmail.Value}'");
                    cookie["Picture"] = func.IsExist($"SELECT Picture FROM Register WHERE Email='{txtlogEmail.Value}'");
                    cookie["Mobile"] = func.IsExist($"SELECT MobileNo FROM Register WHERE Email='{txtlogEmail.Value}'");
                    cookie.Expires = DateTime.Now.AddDays(300);
                    Response.Cookies.Add(cookie);
                    if (cookie["Type"] == "Cust")
                    {
                        Response.Redirect("/web/home.aspx");
                    }
                    else if (cookie["Type"] == "Cate")
                    {
                        Response.Redirect("/ui/index.aspx");
                    }
                    else if (cookie["Type"] == "Admin" || cookie["Type"] == "Moderator")
                    {
                        Response.Redirect("/ui/index.aspx");
                    }
                }
                else
                {
                    func.PopAlert(this, "Please use valid email or password");
                }
            }
        }

        protected void OnServerClick(object sender, EventArgs e)
        {
            if (txtForgotEmail.Value == "")
            {
                func.PopAlert(this, "Type your email first");
            }
            else
            {
                string pass = func.IsExist($"SELECT Password FROM Register WHERE Email='{txtForgotEmail.Value}'");
                if (pass == "")
                {
                    func.PopAlert(this, "Email id does not exist");
                }
                else
                {
                    bool ans = func.SendEmail("foodservice710@gmail.com", txtForgotEmail.Value, "Password", "<h3>Hello,</h3><br/>Your Password is: " + pass, "*trishucse01205991#");
                    if (ans)
                    {
                        func.PopAlert(this, "We have send you an email with instructions");
                    }
                }

            }
        }
    }
}
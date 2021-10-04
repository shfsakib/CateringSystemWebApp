using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CateringSystemWebApp.URL;

namespace CateringSystemWebApp.ui
{
    public partial class caterer_list : System.Web.UI.Page
    {
        private Function func;

        public caterer_list()
        {
            func = Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                func.AdminType(this, "Admin", "Moderator");
                Load();
            }
        }
        private void Load()
        {
            string query = @"SELECT        Register.RegId, Register.Name, Register.Email, Register.MobileNo, Register.Type, Register.Gender, Register.Dob,  Register.Password, Register.Picture, Register.Status, Register.BkashNo, 
                         Register.TransNo, Register.Amount, Register.Intime, Thana.Thana AS Thana, District.District AS DistrictName
FROM            Register INNER JOIN
                         Thana ON Register.Thana = Thana.Id INNER JOIN
                         District ON Register.District = District.Id WHERE Type='Cate' AND  Status='" + ddlStatus.SelectedValue + "'";
            func.LoadGrid(gridCate, query);
            func.BindDropDown(ddlUser, "Search Caterer", $"SELECT Name +' | '+ Email AS Name, RegId Id FROM Register WHERE Type='Cate' AND Status!='W' ORDER BY Name ASC");
        }
        protected void ddlStatus_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Load();
        }

        protected void ddlUser_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlUser.SelectedIndex != -1)
            {
                string query = $"SELECT * FROM Register WHERE Type='Cate' AND  Status='" + ddlStatus.SelectedValue + "' AND RegId='" + ddlUser.SelectedValue + "'";
                func.LoadGrid(gridCate, query);
            }
            else
            {
                Load();
            }
        }

        protected void gridCate_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton linkActive = (LinkButton)e.Row.FindControl("lbkActive");
                LinkButton linkInactive = (LinkButton)e.Row.FindControl("lnkInactive");
                Label lblRating = (Label)e.Row.FindControl("lblRating");
                HiddenField id = (HiddenField) e.Row.FindControl("HiddenField1");

                if (ddlStatus.Text == "A")
                {
                    linkActive.Visible = false;
                    linkInactive.Visible = true;
                }
                else if (ddlStatus.Text == "I")
                {
                    linkActive.Visible = true;
                    linkInactive.Visible = false;
                }
                string x= func.IsExist($@"SELECT SUM(Rate)/COUNT(Rate) AS Rating FROM Rating WHERE RatedId='{id.Value}'");
                if (x=="")
                {
                    lblRating.Text = "5 ✰";
                }
                else
                {
                    lblRating.Text = x + " ✰";
                }
            }
        }

        protected void gridCate_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridCate.PageIndex = e.NewPageIndex;
            Load();
        }

        protected void lnkInactive_OnClick(object sender, EventArgs e)
        {
            LinkButton lnkInactive = (LinkButton)sender;
            HiddenField hiddenField = (HiddenField)lnkInactive.Parent.FindControl("HiddenField1");
            Label lblEmail = (Label)lnkInactive.Parent.FindControl("lblEmail");
            bool ans = func.Execute($@"UPDATE Register SET Status='I' WHERE RegId='{hiddenField.Value}'");
            if (ans)
            {
                Load();
                bool ans2 = func.SendEmail("foodservice710@gmail.com", lblEmail.Text, "Account",
                    "<h1>Dear Caterer,</h1><br/>Your account has been blocked by Admin.Please contact with us as soon as possible.<br/><b>Thank you</b>",
                    "*trishucse01205991#");
                if (ans2)
                {
                    func.PopAlert(this, "Caterer inactivate successfully");
                }

            }
            else
            {
                func.PopAlert(this, "Caterer inactivation failed");
            }
        }

        protected void lbkActive_OnClick(object sender, EventArgs e)
        {
            LinkButton lnkInactive = (LinkButton)sender;
            HiddenField hiddenField = (HiddenField)lnkInactive.Parent.FindControl("HiddenField1");
            Label lblEmail = (Label)lnkInactive.Parent.FindControl("lblEmail");
            bool ans = func.Execute($@"UPDATE Register SET Status='A' WHERE RegId='{hiddenField.Value}'");
            if (ans)
            {
                Load();
                bool ans2 = func.SendEmail("foodservice710@gmail.com", lblEmail.Text, "Account",
                    "<h1>Dear Caterer,</h1><br/>Your account has been activate by Admin.<br/><b>Thank you</b>",
                    "*trishucse01205991#");
                if (ans2)
                {
                    func.PopAlert(this, "Caterer activate successfully");
                }

            }
            else
            {
                func.PopAlert(this, "Caterer activation failed");
            }
        } 
        
    }
}
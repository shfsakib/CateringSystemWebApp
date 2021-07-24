using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CateringSystemWebApp.URL;

namespace CateringSystemWebApp.ui
{
    public partial class customer_list : System.Web.UI.Page
    {
        private Function func;

        public customer_list()
        {
            func = Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Load();
            }
        }
        private void Load()
        {
            string query = "SELECT * FROM Register WHERE Type='Cust' AND  Status='" + ddlStatus.SelectedValue + "'";
            func.LoadGrid(gridCus, query);
            func.BindDropDown(ddlUser, "Search Customer", $"SELECT Name +' | '+ Email AS Name, RegId Id FROM Register WHERE Type='Cust' ORDER BY Name ASC");
        }
        protected void ddlStatus_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Load();
        }

        protected void ddlUser_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlUser.SelectedIndex != -1)
            {
                string query = $"SELECT * FROM Register WHERE Type='Cust' AND  Status='" + ddlStatus.SelectedValue + "' AND RegId='" + ddlUser.SelectedValue + "'";
                func.LoadGrid(gridCus, query);
            }
            else
            {
                Load();
            }
        }

        protected void gridCus_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton linkActive = (LinkButton)e.Row.FindControl("lbkActive");
                LinkButton linkInactive = (LinkButton)e.Row.FindControl("lnkInactive");
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
            }
        }

        protected void gridCus_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridCus.PageIndex = e.NewPageIndex;
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
                    "<h1>Dear Customer,</h1><br/>Your account has been blocked by Admin.Please contact with us as soon as possible.<br/><b>Thank you</b>",
                    "*trishucse01205991#");
                if (ans2)
                {
                    func.PopAlert(this, "Customer inactivate successfully");
                }

            }
            else
            {
                func.PopAlert(this, "Customer inactivation failed");
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
                    "<h1>Dear Customer,</h1><br/>Your account has been activate by Admin.<br/><b>Thank you</b>",
                    "*trishucse01205991#");
                if (ans2)
                {
                    func.PopAlert(this, "Customer activate successfully");
                }

            }
            else
            {
                func.PopAlert(this, "Customer activation failed");
            }
        }
    }
}
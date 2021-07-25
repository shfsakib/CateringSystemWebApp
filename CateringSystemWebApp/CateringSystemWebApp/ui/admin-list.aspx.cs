using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CateringSystemWebApp.URL;

namespace CateringSystemWebApp.ui
{
    public partial class admin_list : System.Web.UI.Page
    {
        private Function func;

        public admin_list()
        {
            func = Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                func.CheckTypeCookie(this, "Admin");
                Load();
            }
        }
        private void Load()
        {
            string query = "SELECT * FROM Register WHERE Type!='Cust' AND Type!='Cate' AND  Status='" + ddlStatus.SelectedValue + "'";
            func.LoadGrid(gridCus, query);
            func.BindDropDown(ddlUser, "Search Customer", $"SELECT Name +' | '+ Email AS Name, RegId Id FROM Register WHERE Type!='Cust' AND Type!='Cate' ORDER BY Name ASC");
        }
        protected void ddlStatus_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Load();
        }

        protected void ddlUser_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlUser.SelectedIndex != -1)
            {
                string query = $"SELECT * FROM Register WHERE Type!='Cust' AND Type!='Cate' AND  Status='" + ddlStatus.SelectedValue + "' AND RegId='" + ddlUser.SelectedValue + "'";
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
                func.PopAlert(this, "Inactivate successfully");
            }
            else
            {
                func.PopAlert(this, "Inactivation failed");
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
                func.PopAlert(this, "Activate successfully");
            }
            else
            {
                func.PopAlert(this, "Activation failed");
            }
        }
    }
}
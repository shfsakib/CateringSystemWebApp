using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CateringSystemWebApp.URL;

namespace CateringSystemWebApp.ui
{
    public partial class menu_list : System.Web.UI.Page
    {
        private Function func;

        public menu_list()
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
            func.LoadGrid(gridFood, $@"SELECT * FROM FoodInfo ORDER By FoodId DESC");
            func.BindDropDown(ddlFood, "Search by food name", "SELECT FoodName Name, FoodId Id From FoodInfo ORDER By Name ASC");

        }
        protected void btnSearchFood_Click(object sender, EventArgs e)
        {
            if (ddlFood.SelectedIndex != -1)
            {
                func.LoadGrid(gridFood, $@"SELECT * FROM FoodInfo WHERE FoodId='{ddlFood.SelectedValue}' ORDER By FoodId DESC");
            }
            else
            {
                Load();
            }
        }

        protected void gridFood_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridFood.PageIndex = e.NewPageIndex;
            Load();
        }

        protected void lnkRemove_OnClick(object sender, EventArgs e)
        {
            LinkButton lnkRemove = (LinkButton)sender;
            HiddenField foodId = (HiddenField)lnkRemove.Parent.FindControl("HiddenField1");
            bool ans = func.Execute($@"DELETE FROM FoodInfo WHERE FoodId='{foodId.Value}'");
            if (ans)
            {
                func.PopAlert(this, "Removed successfully");
                Load();
            }
            else
            {
                func.PopAlert(this, "Removed failed");
            }
        }

        protected void lbkInactive_OnClick(object sender, EventArgs e)
        {
            LinkButton lnkRemove = (LinkButton)sender;
            HiddenField foodId = (HiddenField)lnkRemove.Parent.FindControl("HiddenField1");
            bool ans = func.Execute($@"UPDATE FoodInfo SET Status='I' WHERE FoodId='{foodId.Value}'");
            if (ans)
            {
                func.PopAlert(this, "Inavtivated successfully");
                Load();
            }
            else
            {
                func.PopAlert(this, "Inactive failed");
            }
        }

        protected void gridFood_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                HiddenField status = (HiddenField)e.Row.FindControl("status");
                LinkButton lnkActive = (LinkButton)e.Row.FindControl("lnkActive");
                LinkButton lbkInactive = (LinkButton)e.Row.FindControl("lbkInactive");

                if (status.Value == "A")
                {
                    lbkInactive.Visible = true;
                    lnkActive.Visible = false;
                }
                else
                {
                    lbkInactive.Visible = false;
                    lnkActive.Visible = true;
                }
            }
        }

        protected void lnkActive_OnClick(object sender, EventArgs e)
        {
            LinkButton lnkRemove = (LinkButton)sender;
            HiddenField foodId = (HiddenField)lnkRemove.Parent.FindControl("HiddenField1");
            bool ans = func.Execute($@"UPDATE FoodInfo SET Status='A' WHERE FoodId='{foodId.Value}'");
            if (ans)
            {
                func.PopAlert(this, "Activated successfully");
                Load();
            }
            else
            {
                func.PopAlert(this, "Active failed");
            }
        }
    }
}
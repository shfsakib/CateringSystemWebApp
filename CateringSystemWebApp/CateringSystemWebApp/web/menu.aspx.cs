using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CateringSystemWebApp.URL;

namespace CateringSystemWebApp.web
{
    public partial class menu : System.Web.UI.Page
    {
        private Function func;

        public menu()
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
            func.LoadRepeater(menuItem, "SELECT * FROM FoodInfo WHERE Status='A' ORDER BY NEWID()");
            func.BindDropDown(ddlFood, "Search by food name", "SELECT FoodName Name,FoodId Id FROM FoodInfo WHERE Status='A' ORDER BY Name ASC");

        }

        protected void ddlFood_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlFood.SelectedIndex > 0)
            {
                func.LoadRepeater(menuItem,
                    $"SELECT * FROM FoodInfo WHERE Status='A' AND FoodId='{ddlFood.SelectedValue}' ORDER BY NEWID()");
            }
            else
            {
                Load();
            }
        }

        protected void viewCaterer_OnServerClick(object sender, EventArgs e)
        {
            HtmlAnchor anchor = (HtmlAnchor)sender;
            HiddenField CateId = (HiddenField)anchor.Parent.FindControl("CateId");
            Response.Redirect("/web/order-food.aspx?id=" + CateId.Value);
        }
    }
}
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
                Load();
            }
        }
        private void Load()
        {
            func.LoadRepeater(catererListRepeater, "SELECT * FROM Register WHERE Status='A' AND Type='Cate'  ORDER BY NEWID()");
            func.BindDropDown(ddlCaterer, "Search caterer", "SELECT Name+' | '+MobileNo Name,RegId Id FROM Register WHERE Status='A' AND Type='Cate' ORDER BY Name ASC");

        }
        protected void ddlCaterer_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCaterer.SelectedIndex > 0)
            {
                func.LoadRepeater(catererListRepeater, $"SELECT * FROM Register WHERE Status='A' AND RegId='{ddlCaterer.SelectedValue}' ORDER BY NEWID()");
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
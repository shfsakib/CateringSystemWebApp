using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CateringSystemWebApp.URL;

namespace CateringSystemWebApp.ui
{
    public partial class customer_review : System.Web.UI.Page
    {
        private Function func;

        public customer_review()
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
            string id = Request.QueryString["id"];
            func.LoadGrid(gridReview, $@"SELECT * FROM Rating WHERE RatedId='{id}' ORDER By RateId DESC");
        }
        protected void gridReview_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridReview.PageIndex = e.NewPageIndex;
            Load();
        }
    }
}
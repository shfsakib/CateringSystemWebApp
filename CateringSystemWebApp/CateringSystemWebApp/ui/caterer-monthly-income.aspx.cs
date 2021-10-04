using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CateringSystemWebApp.URL;

namespace CateringSystemWebApp.ui
{
    public partial class caterer_monthly_income : System.Web.UI.Page
    {
        private Function func;

        public caterer_monthly_income()
        {
            func=Function.GetInstance();
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
            func.LoadGrid(gridIncome,$"SELECT SUBSTRING(OrderList.Ordertime,4,7) As OrderMonth ,CONVERT(decimal(18,2),SUM(TOTAL)*.05) TotalIncome FROM OrderList WHERE CateId='{id}' GROUP BY Ordertime ORDER BY Ordertime DESC"); 
        }
        protected void gridIncome_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridIncome.PageIndex = e.NewPageIndex;
            Load();
        }

        public string Month(string x)
        {
            DateTime date = Convert.ToDateTime(x);
            return date.ToString("MMM-yyyy");
        }
    }
}
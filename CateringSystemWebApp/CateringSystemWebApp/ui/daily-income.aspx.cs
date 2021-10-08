using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CateringSystemWebApp.URL;

namespace CateringSystemWebApp.ui
{
    public partial class daily_income : System.Web.UI.Page
    {
        private Function function;

        public daily_income()
        {
            function = Function.GetInstance();
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
            function.LoadGrid(gridIncome, $@"SELECT        OrderList.OrderId, OrderList.OrderInvoice, OrderList.CustId, OrderList.CateId, OrderList.FoodId, OrderList.Quantity, OrderList.Price, OrderList.Total, OrderList.DeliveryLocation, OrderList.Status, OrderList.Ordertime, 
                         FoodInfo.FoodName
FROM            OrderList INNER JOIN
                         FoodInfo ON OrderList.FoodId = FoodInfo.FoodId WHERE OrderList.CateId='{function.UserIdCookie()}' AND SUBSTRING(OrderList.Ordertime,0,11) BETWEEN '{DateConvert(txtFrom.Text)}' AND '{DateConvert(txtTo.Text)}'");
        }
        protected void gridIncome_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridIncome.PageIndex = e.NewPageIndex;
            Load();
        }

        private string DateConvert(string date)
        {
            if (date == "")
            {
                date = "01/01/0001";
            }
            DateTime dateTime = Convert.ToDateTime(date);
            return dateTime.ToString("dd/MM/yyyy");
        }
        protected void lnkSearch_OnClick(object sender, EventArgs e)
        {
            if (txtFrom.Text=="" && txtTo.Text=="")
            {
                function.PopAlert(this,"Date is required");
            }
            else
            {
                Load();
                CalculateSum();
            }
        }
        private void CalculateSum()
        {
            double total = 0;
            foreach (GridViewRow gridViewRow in gridIncome.Rows)
            {
                total = total + Convert.ToDouble(((Label)gridViewRow.FindControl("lblPrice")).Text);
            }
            if (total != 0.0)
            {
                lblIncome.Text = total.ToString();
            }
            else
            {
                lblIncome.Text = "0";
            }

        }
    }
}
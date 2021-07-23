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
    public partial class pending_payment : System.Web.UI.Page
    {
        private Function func;

        public pending_payment()
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
            string query = $@"SELECT DISTINCT  OrderList.CateId, OrderList.CustId, OrderList.OrderInvoice, OrderList.Total, OrderList.DeliveryLocation,  Register.Name AS CateringName, Register.District, 
                         Register.Thana,   District.District AS DistrictName, Thana.Thana AS ThanaName, Register_1.Picture AS CustPicture, Register_1.Name AS CustName
FROM            OrderList INNER JOIN
                         Register ON OrderList.CateId = Register.RegId INNER JOIN
                         District ON Register.District = District.Id INNER JOIN
                         Thana ON Register.Thana = Thana.Id INNER JOIN
                         Register AS Register_1 ON OrderList.CustId = Register_1.RegId WHERE OrderList.CustId='{func.UserIdCookie()}' AND OrderList.Status='PP' ORDER By OrderList.OrderInvoice DESC";
            func.LoadGrid(gridOrder, query);
        }


        protected void gridOrder_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblInvoice = (Label)e.Row.FindControl("lblInvoice");
                HiddenField custId = (HiddenField)e.Row.FindControl("custId");
                GridView gridFood = (GridView)e.Row.FindControl("gridFood");
                func.LoadGrid(gridFood, $@"SELECT        OrderList.FoodId, OrderList.Quantity, OrderList.Price, FoodInfo.FoodName
FROM            OrderList INNER JOIN
                         FoodInfo ON OrderList.FoodId = FoodInfo.FoodId WHERE OrderInvoice='{lblInvoice.Text}' ORDER BY FoodInfo.FoodName ASC");
            }
        }

        protected void gridOrder_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridOrder.PageIndex = e.NewPageIndex;
            Load();
        }

        protected void btnCancel_OnServerClick(object sender, EventArgs e)
        {
            LinkButton linkButton = (LinkButton) sender;
            Label lblInvoice = (Label) linkButton.Parent.FindControl("lblInvoice");
            bool ans = func.Execute($@"DELETE FROM OrderList WHERE OrderInvoice='{lblInvoice.Text}'");
            if (ans)
            {
                Load();
                func.PopAlert(this,"Order cancelled successfully");
            }
            else
            {
                func.PopAlert(this,"Failed to cancel order");
            }
        }
    }
}
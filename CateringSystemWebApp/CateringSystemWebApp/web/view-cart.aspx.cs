using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CateringSystemWebApp.URL;

namespace CateringSystemWebApp.web
{
    public partial class view_cart : System.Web.UI.Page
    {
        private Function func;

        public view_cart()
        {
            func = Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["count"].ToString() == "0")
                {
                    Response.Redirect("/web/menu.aspx");
                }
                else if (Session["dataGrid"] != null)
                {
                    LoadFood();
                }
                else
                {
                    Response.Redirect("/web/menu.aspx");
                }
            }
        }
        private void LoadFood()
        {
            gridFood.DataSource = Session["dataGrid"];
            gridFood.DataBind();
            CalculateSum();

        }
        protected void lnkRemove_OnClick(object sender, EventArgs e)
        {
            LinkButton linkButton = (LinkButton)sender;
            HiddenField foodId = (HiddenField)linkButton.Parent.FindControl("foodId");

            int rowIndex = Convert.ToInt32(foodId.Value);
            DataTable dataTable = (DataTable)Session["dataGrid"];
            int rowCount = gridFood.Rows.Count;
            for (int j = 0; j < rowCount; j++)
            {
                string itemSerial = dataTable.Rows[j][0].ToString();
                if (Convert.ToInt32(itemSerial) == rowIndex)
                {
                    dataTable.Rows[j].Delete();
                    break;
                }
            }
            LoadFood();
            CalculateSum();
            Session["count"] = (Convert.ToInt32(gridFood.Rows.Count)).ToString();
            if (gridFood.Rows.Count <= 0)
            {
                Response.Redirect("/web/menu.aspx");
            }
        }
        private void CalculateSum()
        {
            double total = 0;
            foreach (GridViewRow gridViewRow in gridFood.Rows)
            {
                total = total + Convert.ToDouble(((Label)gridViewRow.FindControl("lblPrice")).Text);
            }
            if (total != 0.0)
            {
                lblTotal.Text = total.ToString();
            }
            else
            {
                lblTotal.Text = "0";
            }

        }
        protected void lnkPlace_OnClick(object sender, EventArgs e)
        {
            if (txtAddress.Text == "")
            {
                func.PopAlert(this, "Delivery location is required");
            }
            else
            {
                bool ans = false;
                ViewState["invoice"] = func.GenerateInvoice(@"SELECT Max(SUBSTRING(OrderInvoice, 9, 4)) FROM OrderList");
                foreach (GridViewRow row in gridFood.Rows)
                {
                    HiddenField foodId = (HiddenField)row.FindControl("foodId");
                    HiddenField cateId = (HiddenField)row.FindControl("cateId");
                    ViewState["cateId"] = cateId.Value;
                    Label lblQuantity = (Label)row.FindControl("lblQuantity");
                    Label lblPrice = (Label)row.FindControl("lblPrice");
                    ans =func.Execute($@"INSERT INTO OrderList(OrderInvoice,CustId,CateId,FoodId,Quantity,Price,Total,DeliveryLocation,Status,Ordertime) VALUES('{ViewState["invoice"]}','{func.UserIdCookie()}','{cateId.Value}','{foodId.Value}','{lblQuantity.Text}','{lblPrice.Text}','{lblTotal.Text}','{txtAddress.Text}','PP','{func.Date()}')");
                }
                if (ans)
                {
                    func.AlertWithRedirect(this, "Order placed successfully,Please pay order price to confirm order otherwise your order won't be visible to caterer", "/web/pay-order.aspx?invoice="+ ViewState["invoice"].ToString() + "&cateId="+ ViewState["cateId"].ToString() + "&total=" +lblTotal.Text+"" );
                }
                else
                {
                    func.PopAlert(this, "Failed to place order");
                }
            }
        }
    }
}
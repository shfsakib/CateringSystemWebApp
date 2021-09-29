using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CateringSystemWebApp.URL;

namespace CateringSystemWebApp.web
{
    public partial class order_food : System.Web.UI.Page
    {
        private Function func;
        private string id = "";
        private DataTable dataTable;
        private DataRow dataRow;

        public order_food()
        {
            func = Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString.Count <= 0)
                {
                    Response.Redirect("/web/home.aspx");
                    return;
                }
                id = Request.QueryString["id"];
                string type = func.IsExist($"SELECT DISTINCT TOP 1 Type FROM FoodInfo WHERE CateId='{id}' ORDER By TYPE ASC");
                LoadMenu(type);
                if (Session["dataGrid"] != null)
                {
                    gridTemp.DataSource = Session["dataGrid"];
                    gridTemp.DataBind();
                    Session["count"] = (Convert.ToInt32(gridTemp.Rows.Count)).ToString();
                }
                string rating = func.IsExist($@"SELECT SUM(Rate)/COUNT(Rate) AS Rating FROM Rating WHERE RatedId='{id}'");
                string count = func.IsExist($@"SELECT COUNT(Rate) AS Count FROM Rating WHERE RatedId='{id}'");
                lblRating.Text = rating + "(" + count + ")";
            }
        }

        private void LoadMenu(string type)
        {
            id = Request.QueryString["id"];
            shopName.InnerText = func.IsExist($"SELECT Name FROM Register WHERE RegId='{id}'");
            func.LoadDataList(dataReceipeType, $"SELECT DISTINCT Type FROM FoodInfo WHERE CateId='{id}' ORDER By TYPE ASC");
            func.LoadRepeater(menuItem, $"SELECT * FROM FoodInfo WHERE CateId='{id}' AND Type='{type}' ORDER BY FoodName ASC");
        }

        protected void btnType_OnClick(object sender, EventArgs e)
        {
            LinkButton linkButton = (LinkButton)sender;
            HiddenField HiddenField1 = (HiddenField)linkButton.Parent.FindControl("HiddenField1");
            LoadMenu(HiddenField1.Value);
            foodDiv.Visible = true;
            reviewDiv.Visible = false;
        }
        private void LoadSession()
        {
            if (Session["dataGrid"] == null)
            {
                dataTable = new DataTable();
                dataTable.Columns.Add("FoodId", typeof(int));
                dataTable.Columns.Add("CateId", typeof(int));
                dataTable.Columns.Add("FoodName", typeof(string));
                dataTable.Columns.Add("Quantity", typeof(int));
                dataTable.Columns.Add("Price", typeof(double));
                dataTable.Columns.Add("Picture", typeof(string));
                Session["dataGrid"] = dataTable;
                gridTemp.DataSource = Session["dataGrid"];
                gridTemp.DataBind();
                Session["count"] = "0";
            }
            else
            {
                gridTemp.DataSource = Session["dataGrid"];
                gridTemp.DataBind();
                Session["count"] = (Convert.ToInt32(gridTemp.Rows.Count)).ToString();
            }
        }
        protected void lnkAdd_OnClick(object sender, EventArgs e)
        {
            func.CheckCookies();
            LinkButton linkButton = (LinkButton)sender;
            HiddenField foodId = (HiddenField)linkButton.Parent.FindControl("foodId");
            HiddenField cateId = (HiddenField)linkButton.Parent.FindControl("CateId");
            HtmlImage imgFood = (HtmlImage)linkButton.Parent.FindControl("imgFood");
            TextBox txtQuantity = (TextBox)linkButton.Parent.FindControl("txtQuantity");
            System.Web.UI.WebControls.Label lblName = (System.Web.UI.WebControls.Label)linkButton.Parent.FindControl("lblName");
            System.Web.UI.WebControls.Label lblPrice = (System.Web.UI.WebControls.Label)linkButton.Parent.FindControl("lblPrice");
            ViewState["foodId"] = foodId.Value;
            ViewState["cateId"] = cateId.Value;
            ViewState["imgFood"] = imgFood.Src;
            ViewState["lblName"] = lblName.Text;
            ViewState["lblPrice"] = lblPrice.Text;
            ViewState["txtQuantity"] = txtQuantity.Text;
            LoadSession();
            CheckRow(Convert.ToInt32(ViewState["foodId"]), Convert.ToInt32(ViewState["cateId"]));
            dataTable = new DataTable();
            dataTable = (DataTable)Session["dataGrid"];
            dataRow = dataTable.NewRow();
            dataRow["FoodId"] = ViewState["foodId"].ToString();
            dataRow["cateId"] = ViewState["cateId"].ToString();
            dataRow["Picture"] = ViewState["imgFood"].ToString();
            dataRow["FoodName"] = ViewState["lblName"].ToString();
            dataRow["Quantity"] = ViewState["txtQuantity"].ToString();
            dataRow["Price"] = (Convert.ToInt32(txtQuantity.Text) * Convert.ToDouble(ViewState["lblPrice"])).ToString();
            dataTable.Rows.Add(dataRow);
            Session["dataGrid"] = dataTable;
            func.PopAlert(this, "Food added to cart");
            Session["count"] = (Convert.ToInt32(gridTemp.Rows.Count) + 1).ToString();
            LoadSession();

        }
        private void CheckRow(int itemSL, int cateId)
        {
            DataTable dataTable = (DataTable)Session["dataGrid"];
            gridTemp.DataSource = Session["dataGrid"];
            gridTemp.DataBind();
            int rowCount = gridTemp.Rows.Count;
            for (int j = 0; j < rowCount; j++)
            {
                string itemSerial = dataTable.Rows[j][0].ToString();
                string shopOId = dataTable.Rows[j][1].ToString();
                if (Convert.ToInt32(itemSerial) == itemSL)
                {
                    dataTable.Rows[j].Delete();
                    break;
                }
                if (Convert.ToInt32(shopOId) != cateId)
                {
                    Session["dataGrid"] = null;
                    LoadSession();
                    break;
                }
            }
            dataTable = (DataTable)gridTemp.DataSource;
            Session["dataGrid"] = dataTable;

        }

        protected void btnReview_OnClick(object sender, EventArgs e)
        {
            foodDiv.Visible = false;
            reviewDiv.Visible = true;
            id = Request.QueryString["id"];
            func.LoadGrid(gridReview, $@"SELECT * FROM Rating WHERE RatedId='{id}' ORDER By RateId DESC");
        }

        protected void gridReview_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridReview.PageIndex = e.NewPageIndex;
            id = Request.QueryString["id"];
            func.LoadGrid(gridReview, $@"SELECT * FROM Rating WHERE RatedId='{id}' ORDER By RateId DESC");
        }
    }
}
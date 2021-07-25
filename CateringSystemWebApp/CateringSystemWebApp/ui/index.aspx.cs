using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CateringSystemWebApp.URL;

namespace CateringSystemWebApp.ui
{
    public partial class index : System.Web.UI.Page
    {
        private Function func;

        public index()
        {
            func.CheckCookies();
            func = Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                totalUser.InnerText = func.IsExist($@"SELECT COUNT(Name) FROM Register WHERE Type='Cust' AND Status='A'");
                totalCaterer.InnerText = func.IsExist($@"SELECT COUNT(Name) FROM Register WHERE Type='Cate' AND Status='A'");
                totalFoods.InnerText = func.IsExist($@"SELECT COUNT(FoodId) FROM FoodInfo  WHERE Status='A'");
                totalOrders.InnerText= func.IsExist($@"SELECT COUNT(OrderInvoice) FROM OrderList WHERE Status='C'");
                Load();
            }
        }
        private void Load()
        {
            string query = @"SELECT        Register.RegId, Register.Name, Register.Email, Register.MobileNo, Register.Type, Register.Gender, Register.Dob,  Register.Password, Register.Picture, Register.Status, Register.BkashNo, 
                         Register.TransNo, Register.Amount, Register.Intime, Thana.Thana AS Thana, District.District AS DistrictName
FROM            Register INNER JOIN
                         Thana ON Register.Thana = Thana.Id INNER JOIN
                         District ON Register.District = District.Id WHERE Type='Cate' AND  Status='W'";
            func.LoadGrid(gridCate, query);
        }
        protected void gridCate_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridCate.PageIndex = e.NewPageIndex;
            Load();
        }

        protected void lnkReject_OnClick(object sender, EventArgs e)
        {
            LinkButton lnkInactive = (LinkButton)sender;
            HiddenField hiddenField = (HiddenField)lnkInactive.Parent.FindControl("HiddenField1");
            Label lblEmail = (Label)lnkInactive.Parent.FindControl("lblEmail");
            bool ans = func.Execute($@"DELETE FROM Register WHERE RegId='{hiddenField.Value}'");
            if (ans)
            {
                Load();
                bool ans2 = func.SendEmail("foodservice710@gmail.com", lblEmail.Text, "Account",
                    "<h1>Dear Caterer,</h1><br/>Your account has been rejected by Admin.<br/><b>Thank you</b>",
                    "*trishucse01205991#");
                if (ans2)
                {
                    func.PopAlert(this, "Caterer request rejected successfully");
                }

            }
            else
            {
                func.PopAlert(this, "Caterer rejection failed");
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
                bool ans2 = func.SendEmail("foodservice710@gmail.com", lblEmail.Text, "Account",
                    "<h1>Dear Caterer,</h1><br/>Your account has been activate by Admin.<br/><b>Thank you</b>",
                    "*trishucse01205991#");
                if (ans2)
                {
                    func.PopAlert(this, "Caterer activate successfully");
                }

            }
            else
            {
                func.PopAlert(this, "Caterer activation failed");
            }
        }
    }
}
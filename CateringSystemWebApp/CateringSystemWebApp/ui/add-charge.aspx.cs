using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CateringSystemWebApp.URL;

namespace CateringSystemWebApp.ui
{
    public partial class add_charge : System.Web.UI.Page
    {
        private Function func;

        public add_charge()
        {
            func = Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                func.AdminType(this, "Admin", "Moderator");
                func.BindDropDown(ddlCatering, "Catering Name", $"SELECT Name +' | '+ Email AS Name,RegId Id FROM Register WHERE Type='Cate' ORDER By Name ASC");
            }
        }

        protected void txtMonth_OnTextChanged(object sender, EventArgs e)
        {
            string month = Convert.ToDateTime(txtMonth.Text).ToString("MM/yyyy");
            txtTotal.Text = func.IsExist($@"SELECT CONVERT(decimal(18,2),SUM(TOTAL)*.05) FROM OrderList WHERE SUBSTRING(OrderTime,4,7)='{month}' AND CateId='{ddlCatering.SelectedValue}'");

        }

        private bool IsExist(string cateId, string month)
        {
            bool ans = false;
            string x = func.IsExist($@"SELECT Amount From ChargeInfo WHERE CateId='{cateId}' AND Month='{month}'");
            if (x!="")
            {
                ans = true;
            }
            return ans;
        }
        protected void btnPay_OnClick(object sender, EventArgs e)
        {
            if (txtMonth.Text == "")
            {
                func.PopAlert(this, "Month is required");
            }
            else if (txtBkash.Text == "")
            {
                func.PopAlert(this, "Bkash no is required");
            }
            else if (txtTrans.Text == "")
            {
                func.PopAlert(this, "Transaction no is required");
            }
            else if (txtTotal.Text == "")
            {
                func.PopAlert(this, "Amount is required");
            }
            else if (IsExist(ddlCatering.SelectedValue, txtMonth.Text))
            {
                func.PopAlert(this, "Charge already paid for this month");
            }
            else
            {
                bool ans = func.Execute($@"INSERT INTO ChargeInfo(CateId,Month,BkashNo,TransactionNo,Amount,Status,PaymentTime) VALUES('{ddlCatering.SelectedValue}','{txtMonth.Text}','{txtBkash.Text}','{txtTrans.Text}','{txtTotal.Text}','A','{func.Date()}')");
                if (ans)
                {
                    string email = func.IsExist($"SELECT Email FROM Register WHERE RegId='{ddlCatering.SelectedValue}'");
                    bool ans1 = func.SendEmail("foodservice710@gmail.com", email, "Service Charge",
              "<h1>Hello Caterer,</h1><br/>Your monthly payment request has been added successfully. Please wait for admin verification.<br/><b>Thank you</b>",
              "*trishucse01205991#");
                    if (ans1)
                    {
                        func.PopAlert(this, "Payment added successfully");
                    }
                    else
                        func.PopAlert(this, "Payment added successfully");
                    Refresh();
                }
            }
        }
        private void Refresh()
        {
            txtMonth.Text = txtBkash.Text = txtTrans.Text = txtTotal.Text = "";
            ddlCatering.SelectedIndex = -1;
        }

    }
}
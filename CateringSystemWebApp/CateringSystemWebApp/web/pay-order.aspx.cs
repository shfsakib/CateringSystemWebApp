using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CateringSystemWebApp.URL;

namespace CateringSystemWebApp.web
{
    public partial class pay_order : System.Web.UI.Page
    {
        private Function func;

        public pay_order()
        {
            func = Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString.Count <= 0)
                {
                    func.AlertWithRedirect(this, "Please choose an invoice first form pending payment order list", "/web/home.aspx");
                }
            }
        }

        protected void btnPay_OnClick(object sender, EventArgs e)
        {
            if (txtBkash.Text == "")
            {
                func.PopAlert(this, "Bkash or Nagad number is required");
            }
            else if (txtTrans.Text == "")
            {
                func.PopAlert(this, "Transaction no is required");
            }
            else
            {
                bool ans = func.Execute($@"INSERT INTO Payment(OrderInvoice,BkashNo,TransNo,PayTime) VALUES('{Request.QueryString["invoice"]}','{txtBkash.Text}','{txtTrans.Text}','{func.Date()}')");
                if (ans)
                {
                    string email =
                        func.IsExist($@"SELECT Email from Register WHERE RegId='{Request.QueryString["cateId"]}'");
                    bool mailAns = func.SendEmail("foodservice710@gmail.com", email, "Order Request", "<h3>Hello Caterer,</h3><br/>Your have an order from " + func.NameCookie() + " | "+func.EmailCookie()+". Please check your order list for more details and place this order as soon as possible.", "*trishucse01205991#");
                    if (mailAns)
                    {
                        bool mailAns2 = func.SendEmail("foodservice710@gmail.com", func.EmailCookie(), "Order Request", "<h3>Hello Caterer,</h3><br/>Your order request of <strong>#INVOICE" + Request.QueryString["invoice"] + "</strong> has been placed successfully to caterer. Your Caterer will contact with you soon, if not then contact us.", "*trishucse01205991#");
                        if (mailAns2)
                        {
                            Session["dataGrid"] = null;
                            Session["count"] = 0;
                            bool updateAns =
                                func.Execute(
                                    $@"UPDATE OrderList SET Status='A' WHERE OrderInvoice='{
                                        Request.QueryString["invoice"]}'");
                            if (updateAns)
                            {
                                func.AlertWithRedirect(this, "Payment added successfully", "/web/home.aspx");
                            }
                        }
                        else
                        {
                            Session["dataGrid"] = null;
                            Session["count"] = 0;
                            bool updateAns =
                                func.Execute(
                                    $@"UPDATE OrderList SET Status='A' WHERE OrderInvoice='{
                                        Request.QueryString["invoice"]}'");
                            if (updateAns)
                            {
                                func.AlertWithRedirect(this, "Payment added successfully", "/web/home.aspx");
                            }
                        }
                    }
                    else
                    {
                        Session["dataGrid"] = null;
                        Session["count"] = 0;
                        bool updateAns =
                            func.Execute(
                                $@"UPDATE OrderList SET Status='A' WHERE OrderInvoice='{
                                    Request.QueryString["invoice"]}'");
                        if (updateAns)
                        {
                            func.AlertWithRedirect(this, "Payment added successfully", "/web/home.aspx");
                        }
                    }
                }
                else
                {
                    func.PopAlert(this, "Failed to payment");
                }
            }
        }
    }
}
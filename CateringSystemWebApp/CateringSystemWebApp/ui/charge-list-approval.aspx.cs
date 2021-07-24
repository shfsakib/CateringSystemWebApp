using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CateringSystemWebApp.URL;

namespace CateringSystemWebApp.ui
{
    public partial class charge_list_approval : System.Web.UI.Page
    {
        private Function func;

        public charge_list_approval()
        {
            func = Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCharge();
                func.BindDropDown(ddlCatering, "Catering Name", $"SELECT Name +' | '+ Email AS Name,RegId Id FROM Register WHERE Type='Cate' ORDER By Name ASC");

            }
        }
        private void LoadCharge()
        {
            func.LoadGrid(gridCharge, $@"SELECT        ChargeInfo.ChargeId, ChargeInfo.CateId, ChargeInfo.Month, ChargeInfo.BkashNo, ChargeInfo.TransactionNo, ChargeInfo.Amount, ChargeInfo.PaymentTime, ChargeInfo.Status, Register.Email, 
                         Register.Name
FROM            ChargeInfo INNER JOIN
                         Register ON ChargeInfo.CateId = Register.RegId WHERE ChargeInfo.Status='{ddlStatus.SelectedValue}' ORDER BY ChargeInfo.PaymentTime DESC");
        }

        protected void ddlStatus_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            LoadCharge();
        }

        protected void ddlCatering_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCatering.SelectedIndex > 0)
            {
                func.LoadGrid(gridCharge,
                   $@"SELECT        ChargeInfo.ChargeId, ChargeInfo.CateId, ChargeInfo.Month, ChargeInfo.BkashNo, ChargeInfo.TransactionNo, ChargeInfo.Amount, ChargeInfo.PaymentTime, ChargeInfo.Status, Register.Email, 
                         Register.Name
FROM            ChargeInfo INNER JOIN
                         Register ON ChargeInfo.CateId = Register.RegId WHERE ChargeInfo.Status='{
                       ddlStatus.SelectedValue}' AND ChargeInfo.CateId='{
                       ddlCatering.SelectedValue}'");

            }
            else
            {
                LoadCharge();
            }
        }

        protected void gridCharge_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lnkRemove = (LinkButton)e.Row.FindControl("lnkRemove");
                LinkButton lnkAccept = (LinkButton)e.Row.FindControl("lnkAccept");
                if (ddlStatus.SelectedValue == "A")
                {
                    lnkAccept.Visible = false;
                    lnkRemove.Visible = false;
                }

            }
        }

        protected void gridCharge_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridCharge.PageIndex = e.NewPageIndex;
            LoadCharge();
        }

        protected void lnkAccept_OnClick(object sender, EventArgs e)
        {
            LinkButton lnkInactive = (LinkButton)sender;
            HiddenField chargeId = (HiddenField)lnkInactive.Parent.FindControl("HiddenField1");
            bool ans = func.Execute($@"UPDATE ChargeInfo SET Status='A' WHERE ChargeId='{chargeId.Value}'");
            if (ans)
            {
                func.PopAlert(this, "Accepted successfully");
                LoadCharge();
            }
            else
                func.PopAlert(this, "Failed to accept");
        }

        protected void lnkRemove_OnClick(object sender, EventArgs e)
        {
            LinkButton lnkInactive = (LinkButton)sender;
            HiddenField chargeId = (HiddenField)lnkInactive.Parent.FindControl("HiddenField1");
            bool ans = func.Execute($@"DELETE FROM ChargeInfo WHERE ChargeId='{chargeId.Value}'");
            if (ans)
            {
                func.PopAlert(this, "Removed successfully");
                LoadCharge();
            }
            else
                func.PopAlert(this, "Failed to remove");
        }
    }
}
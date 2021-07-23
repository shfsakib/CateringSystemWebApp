using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CateringSystemWebApp.URL;

namespace CateringSystemWebApp.web
{
    public partial class rate_caterer : System.Web.UI.Page
    {
        private Function func;

        public rate_caterer()
        {
            func = Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] == null)
                {
                    Response.Redirect("/log-in.aspx");
                }
                else
                {
                    txtCateringName.Text =
                    func.IsExist($"SELECT Name FROM Register WHERE RegId='{Request.QueryString["id"]}'");
                    imgCaterer.ImageUrl =
                    func.IsExist($"SELECT Picture FROM Register WHERE RegId='{Request.QueryString["id"]}'");
                }
            }
        }
        private bool IsRateExist(string rate)
        {
            bool result = false;
            string x = func.IsExist($"SELECT RATE FROM Rating WHERE RatedId={Request.QueryString["id"].ToString()} AND UserId={func.UserIdCookie()}");
            if (x != "")
                result = true;
            return result;
        }
        protected void btnRating_OnClick(object sender, EventArgs e)
        {
            if (Rating1.CurrentRating.ToString() == "")
            {
                func.PopAlert(this, "You must give rating to submit review");
            }
            else if (Rating1.CurrentRating.ToString() == "0")
            {
                func.PopAlert(this, "You must give rating to submit review");
            }
            else if (IsRateExist(Rating1.CurrentRating.ToString()))
            {
                bool ans2 = func.Execute($@"UPDATE Rating SET Rate='{Rating1.CurrentRating}' WHERE RatedId='{Request.QueryString["id"]}' AND UserId='{func.UserIdCookie()}'");
                if (ans2)
                {
                    Response.Redirect("/log-in.aspx");
                    Refresh();
                }
                else
                {
                    func.PopAlert(this, "Rating submitted failed");
                }
            }
            else
            {
                bool ans = func.Execute($@"INSERT INTO Rating(RatedId,UserId,Rate,InTime) VALUES('{Request.QueryString["id"]}','{func.UserIdCookie()}','{Rating1.CurrentRating}','{func.Date()}')");
                if (ans)
                {
                    Response.Redirect("/log-in.aspx");
                    Refresh();
                }
                else
                {
                    func.PopAlert(this, "Rating submitted failed");
                }
            }
        }
        private void Refresh()
        {
            Rating1.CurrentRating = 0;
        }
    }
}
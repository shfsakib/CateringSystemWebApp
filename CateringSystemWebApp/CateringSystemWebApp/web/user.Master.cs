using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CateringSystemWebApp.URL;

namespace CateringSystemWebApp.web
{
    public partial class user : System.Web.UI.MasterPage
    {
        private Function func;

        public user()
        {
            func = Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["count"] == null)
                {
                    Session["count"] = 0;
                }
                if (Session["address"] == null)
                {
                    Session["address"] = "";
                }
            }
        }

        protected void OnServerClick(object sender, EventArgs e)
        {
            func.Logout();
        }
    }
}
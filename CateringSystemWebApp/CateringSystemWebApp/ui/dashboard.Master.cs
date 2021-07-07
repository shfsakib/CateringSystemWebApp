using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CateringSystemWebApp.URL;

namespace CateringSystemWebApp.ui
{
    public partial class dashboard : System.Web.UI.MasterPage
    {
        private Function func;

        public dashboard()
        {
            func = Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void OnServerClick(object sender, EventArgs e)
        {
            func.Logout();
        }
    }
}
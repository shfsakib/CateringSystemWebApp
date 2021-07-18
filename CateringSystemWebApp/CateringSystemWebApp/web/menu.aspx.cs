using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CateringSystemWebApp.URL;

namespace CateringSystemWebApp.web
{
    public partial class menu : System.Web.UI.Page
    {
        private Function func;

        public menu()
        {
            func = Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                func.LoadRepeater(menuItem, "SELECT * FROM FoodInfo WHERE Status='A' ORDER BY NEWID()"); 
            }
        }

        
    }
}
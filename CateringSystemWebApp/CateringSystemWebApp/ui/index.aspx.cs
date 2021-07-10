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
            func=Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                totalUser.InnerText = func.IsExist($@"SELECT COUNT(Name) FROM Register WHERE Type='Cust'");
                totalCaterer.InnerText = func.IsExist($@"SELECT COUNT(Name) FROM Register WHERE Type='Cate'");
                totalFoods.InnerText = func.IsExist($@"SELECT COUNT(FoodId) FROM FoodInfo");
            }
        }
    }
}
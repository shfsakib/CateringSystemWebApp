using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CateringSystemWebApp.URL;

namespace CateringSystemWebApp.ui
{
    public partial class add_menu : System.Web.UI.Page
    {
        private Function func;
        Random random=new Random();
        public add_menu()
        {
            func=Function.GetInstance();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtFoodName.Focus();
            }
        }
        private bool IsFoodExist(string foodName)
        {
            bool ans = false;
            string x = func.IsExist($"SELECT FoodName FROM FoodInfo WHERE FoodName='{foodName}' AND CateId='{func.UserIdCookie()}'");
            if (x != "")
            {
                ans = true;
            }
            return ans;
        }
        protected void btnAdd_OnClick(object sender, EventArgs e)
        {
            if (txtFoodName.Text == "")
            {
                func.ResponseAlert(this, "Food name is required");
                btnAdd.Focus();
            }
            else if (IsFoodExist(txtFoodName.Text))
            {
                func.ResponseAlert(this, "Food name already exist");
            }
            else if (txtQuantity.Text == "")
            {
                func.ResponseAlert(this, "Quantity is required");

                btnAdd.Focus();
            }
            else if (txtPrice.Text == "")
            {
                func.ResponseAlert(this, "Price is required");
                btnAdd.Focus();
            }
            else
            {
                string pic = "";
                if (FileFood.PostedFile != null)
                {
                    string number = random.Next(111111, 999999).ToString();
                    string imagePath = Server.MapPath("/photos/") + FileFood.FileName + number + ".png";
                    FileFood.PostedFile.SaveAs(imagePath);
                    pic = "/photos/" + FileFood.FileName + number + ".png";
                }
                bool ans =
                    func.Execute(
                        $@"INSERT INTO FoodInfo(FoodName,Quantity,Price,Type,Picture,InTime,CateId,Status) VALUES('{txtFoodName.Text}','{txtQuantity.Text}','{txtPrice.Text}','{ddlFoodType.Text}','{pic}','{func.Date()}','{func.UserIdCookie()}','A')");
                if (ans)
                {
                    func.PopAlert(this,"Food added to menu successfully");
                }
                else
                {
                    func.PopAlert(this,"Failed to add");
                }
            }
        }
    }
}
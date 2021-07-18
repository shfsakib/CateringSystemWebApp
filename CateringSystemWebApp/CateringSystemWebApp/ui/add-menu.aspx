<%@ Page Title="" Language="C#" MasterPageFile="~/ui/dashboard.Master" AutoEventWireup="true" CodeBehind="add-menu.aspx.cs" Inherits="CateringSystemWebApp.ui.add_menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pd-ltr-20">
        <div class="card-box pd-20 height-100-p mb-10">
            <div class="row align-items-center pl-2">
                <h3>Create Menu</h3>
            </div>
        </div>
        <div class="card-box pd-20 height-100-p mb-30">
            <div class="row align-items-center">
                <div class="col-3"></div>
                <div class="col-12 col-lg-6">
                    <div class="row">
                        <div class="col-12">
                            <span>Food Name</span>
                            <asp:TextBox ID="txtFoodName" autocomplete="off" class="form-control wd-100" placeholder="Fried Rice,Chicken Fry etc." runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <span>Quantity</span>
                            <asp:TextBox ID="txtQuantity" autocomplete="off" class="form-control wd-100" placeholder="1,2" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <span>Food Type</span>
                            <asp:DropDownList ID="ddlFoodType" class="form-control wd-100" runat="server">
                                <asp:ListItem>Choose Type</asp:ListItem>
                                <asp:ListItem>Rice</asp:ListItem> 
                                <asp:ListItem>Snacks</asp:ListItem> 
                                <asp:ListItem>Set Meal</asp:ListItem> 
                                <asp:ListItem>Special Item</asp:ListItem> 
                                <asp:ListItem>Drinks</asp:ListItem> 
                                <asp:ListItem>Others</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <span>Price</span>
                            <asp:TextBox ID="txtPrice" autocomplete="off" class="form-control wd-100" placeholder="BDT XXX" TextMode="Number" min="0" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <span>Food Picture</span>
                            <br />
                            <asp:FileUpload ID="FileFood" runat="server" accept=".png,.jpg,.jpeg" onchange="showpreview(this)" /><br />
                            <br />
                            <asp:Image ID="imgPic" ImageUrl="../URL/image.png" Style="width: 175px; height: 175px; border: 1px solid #696969;" runat="server" />

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 mt-2">
                            <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_OnClick" class="btn btn-success btn-block" Text="Add Food to Menu" />
                        </div>
                    </div>
                </div>
                <div class="col-3"></div>
            </div>
        </div>
    </div>

    <%--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>--%>
    <%--<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>--%>
    <script>
        function showpreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $("#<%=imgPic.ClientID%>").attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
                }
            }
    </script>
</asp:Content>

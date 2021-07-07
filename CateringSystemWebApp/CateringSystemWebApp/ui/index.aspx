<%@ Page Title="" Language="C#" MasterPageFile="~/ui/dashboard.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CateringSystemWebApp.ui.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card-body">
        <h3>Home</h3>
    </div>
    <div class="row">
        <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
            <div class="card-box noradius noborder bg-danger pb-4">
                <i class="far fa-user float-right text-white"></i>
                <h6 class="text-white text-uppercase m-b-20">Customer</h6>
                <h1 class="m-b-20 text-white counter" runat="server" id="totalUser">487</h1> 
                <span class="text-white"> </span>
            </div>
        </div>

        <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
            <div class="card-box noradius noborder bg-purple pb-4">
                <i class="fas fa-store float-right text-white"></i>
                <h6 class="text-white text-uppercase m-b-20">Caterer</h6>
                <h1 class="m-b-20 text-white counter"  runat="server" id="totalCaterer">290</h1>
                <span class="text-white"> </span>                 
            </div>
        </div>

        <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
            <div class="card-box noradius noborder bg-warning pb-4">
                <i class="fas fa-shopping-cart float-right text-white"></i>
                <h6 class="text-white text-uppercase m-b-20">Orders</h6>
                <h1 class="m-b-20 text-white counter"  runat="server" id="totalOrders">320</h1> 
                <span class="text-white"> </span>
            </div>
        </div>

        <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
            <div class="card-box noradius noborder bg-info pb-4">
                <i class="fas fa-hamburger float-right text-white"></i>
                <h6 class="text-white text-uppercase m-b-20">Foods</h6>
                <h1 class="m-b-20 text-white counter"  runat="server" id="totalFoods">58</h1>
                <span class="text-white"> </span>
            </div>
        </div>
    </div>
    <!-- end row -->
</asp:Content>

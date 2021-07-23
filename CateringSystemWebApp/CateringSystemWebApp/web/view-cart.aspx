<%@ Page Title="" Language="C#" MasterPageFile="~/web/user.Master" AutoEventWireup="true" CodeBehind="view-cart.aspx.cs" Inherits="CateringSystemWebApp.web.view_cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <div class="lgx-banner lgx-banner-inner">
            <div class="lgx-page-inner">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="lgx-heading-area">
                                <div class="lgx-heading lgx-heading-white">
                                    <h2 class="heading-title">Cart</h2>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!--//.ROW-->
                </div>
                <!-- //.CONTAINER -->
            </div>
            <!-- //.INNER -->
        </div>
    </section>
    <div class="row" style="padding-top: 40px;">
        <div class="col-12 table-responsive" style="height: auto; max-height: 500px; overflow-y: auto;">
            <asp:GridView ID="gridFood" class="table table-bordered" Style="background: #f3f3f3;" AutoGenerateColumns="False" ShowHeader="False" ShowHeaderWhenEmpty="True" EmptyDataText="No Food Found" runat="server">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div class="col-12 p-3 pl-2" style="padding: 10px;">
                                <div class="row p-0">
                                    <div class="col-3 col-lg-2 text-center">
                                        <asp:Image runat="server" class="mt-1" Width="80px" Height="80px" ImageUrl='<%#Eval("Picture") %>' Style="border: 2px solid #696969"></asp:Image>
                                    </div>
                                    <div class="col-9 col-lg-6">
                                        <asp:HiddenField ID="foodId" runat="server" Value='<%#Eval("FoodId") %>' />
                                        <asp:HiddenField ID="cateId" runat="server" Value='<%#Eval("CateId") %>' />
                                        <h4>
                                            <asp:Label runat="server" ID="lblName" Text='<%#Eval("FoodName")%>'></asp:Label></h4>
                                        <p class="mp">
                                            <span>Quantity: </span>
                                            <asp:Label ID="lblQuantity" runat="server" Text='<%#Eval("Quantity")%>'></asp:Label>
                                        </p>
                                        <p class="mp"><span>Price: ৳</span><b><asp:Label ID="lblPrice" runat="server" Text='<%#Eval("Price")%>'></asp:Label></b></p>
                                        <p class="mp font-20 text-success">
                                            <asp:LinkButton ID="lnkRemove" OnClick="lnkRemove_OnClick" class="btn btn-danger" runat="server"><i class="fas fa-trash-alt"></i>&nbsp;Remove</asp:LinkButton>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <table class="table table-striped" width="100%" style="position: relative; top: 20px; overflow-y: hidden;">
                <tr>
                    <td><strong>Total</strong> <span style="color: #495057; font-size: 10px;"></span>
                    </td>
                    <td class="text-right" style="font-size: 22px !Important;">
                        <strong><span>Tk </span>
                            <asp:Label ID="lblTotal" runat="server" Text="0"></asp:Label></strong>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-12 p-2">
            <span><b>Delivery Address: </b>
                <asp:TextBox ID="txtAddress" class="form-control" placeholder="Enter delivery address" runat="server"></asp:TextBox></span>
        </div>
    </div>
    <div class="row">
        <div class="col-12" style="padding-top: 10px;">
            <asp:LinkButton ID="lnkPlace" class="btn btn-primary wd" OnClick="lnkPlace_OnClick" runat="server">Place Order</asp:LinkButton>
        </div>
    </div>
</asp:Content>

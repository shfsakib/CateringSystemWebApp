<%@ Page Title="" Language="C#" MasterPageFile="~/web/user.Master" AutoEventWireup="true" CodeBehind="order-food.aspx.cs" Inherits="CateringSystemWebApp.web.order_food" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .choosed {
            border-bottom: 2px solid orange;
        }

        .table tbody tr td {
            width: 20px !important;
        }
        /*table td, table th {
            border: none !important;
            border-right: 1px solid lightgrey !important;
        }*/
        .border-right {
            border-right: 1px solid lightgrey;
        }

        input[type=number] {
            padding-right: 0 !important;
        }

            input[type=number]::-webkit-inner-spin-button,
            input[type=number]::-webkit-outer-spin-button {
                width: 40px;
                height: 50px;
            }

        .sup {
            position: relative;
            bottom: 1ex;
            font-size: 80%;
        }

        .mp {
            font-size: 18px;
            font-weight: 600;
        }

        .btn-cart {
            color: white;
            background: #9d782e;
            padding: 10px 15px;
            margin-top: 10px;
            width: 100%;
            font-size: 18px;
            border-radius: 0px !important;
        }

            .btn-cart:hover {
                color: white;
            }
    </style>
    <section>
        <div class="lgx-banner lgx-banner-inner">
            <div class="lgx-page-inner">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="lgx-heading-area">
                                <div class="lgx-heading lgx-heading-white">
                                    <h2 class="heading-title" id="shopName" runat="server">ShopName</h2>
                                    <h4 id="rating" style="color: white; font-size: 18px;" runat="server"><i class="fas fa-star text-warning"></i>4(5)</h4>
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
    <div class="row" style="padding-top: 40px">
        <div class="col-lg-5 p-4">
            <asp:DataList ID="dataReceipeType" Width="100%" RepeatDirection="Horizontal" RepeatColumns="6" RepeatLayout="Flow" runat="server">
                <ItemStyle CssClass="text-center border-right"></ItemStyle>
                <ItemTemplate>
                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("Type") %>' />
                    <asp:LinkButton ID="btnType" runat="server" Style="font-weight: bold; padding: 15px 15px; font-size: 18px;" OnClick="btnType_OnClick">
                                      <%#Eval("Type") %>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:DataList>
            <hr style="padding: 5px 0;" />
        </div>
    </div>
    <div class="row mr-0">
        <div class="col-12 table-responsive" style="height: auto; overflow-y: auto; overflow-x: hidden;">
            <asp:Repeater ID="menuItem" runat="server">
                <ItemTemplate>
                    <div class="col-6 col-xs-12 col-sm-6 col-md-4 lgx-single-speacial lgx-card-single">
                        <figure>

                            <asp:HiddenField ID="CateId" runat="server" Value='<%#Eval("CateId")%>' />
                            <asp:HiddenField ID="foodId" runat="server" Value='<%#Eval("FoodId")%>' />

                            <img id="imgFood" runat="server" src='<%#Eval("Picture") %>' style="min-height: 270px" alt="Offers" />

                            <figcaption>
                                <div class="speacial-price" style="font-size: 16px !important;">
                                    ৳<asp:Label ID="lblPrice" runat="server" Text='<%#Eval("Price") %>'></asp:Label>
                                </div>
                            </figcaption>
                        </figure>
                        <div class="speacial-info">
                            <h3 class="title text-primary" style="margin-bottom: 15px !important;">
                                <asp:Label ID="lblName" runat="server" Text='<%#Eval("FoodName")%>'></asp:Label><%#" ("+Eval("Quantity")+")"%></h3>
                            <asp:TextBox ID="txtQuantity" class="form-control title" TextMode="Number" Text="1" min="1" Style="color: #495057!important; width: 50%; margin: 0 auto!important; border: 1px solid lightgrey; font-size: 16px!important;" runat="server"></asp:TextBox>
                            <asp:LinkButton ID="lnkAdd" OnClick="lnkAdd_OnClick" CssClass="btn btn-cart" runat="server"><i class="fas fa-shopping-cart"></i>&nbsp;&nbsp;Add to food cart</asp:LinkButton>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <asp:GridView ID="gridTemp" class="table table-bordered" Visible="False" Style="background: #f3f3f3;" AutoGenerateColumns="False" ShowHeader="False" ShowHeaderWhenEmpty="True" EmptyDataText="No Food Found" runat="server">
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
                                        <asp:HiddenField ID="shopId" runat="server" Value='<%#Eval("CateId") %>' />
                                        <h2>
                                            <asp:Label runat="server" ID="lblName" Text='<%#Eval("FoodName")%>'></asp:Label></h2>
                                        <p class="mp"><%#"Quantity: "+Eval("Quantity")%></p>
                                        <p class="mp"><b><%#"Price: ৳"+Eval("Price")%></b></p>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <script>
        $(document).ready(function () {
            $("#ContentPlaceHolder1_type").val($("#ContentPlaceHolder1_dataReceipeType tbody tr td a").first().text());
            //var elem = "#ContentPlaceHolder1_dataReceipeType tbody tr td";
            //$(elem).click(function () {
            //    $(elem).removeClass("choosed");
            //    $(this).addClass("choosed");
            //});
        });
    </script>
</asp:Content>

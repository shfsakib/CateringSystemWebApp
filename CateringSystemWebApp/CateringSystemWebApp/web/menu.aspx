<%@ Page Title="" Language="C#" MasterPageFile="~/web/user.Master" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="CateringSystemWebApp.web.menu" %>

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
                                    <h2 class="heading-title">Menu</h2>
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
            <asp:DropDownList ID="ddlFood" AutoPostBack="True" OnSelectedIndexChanged="ddlFood_OnSelectedIndexChanged" class="form-control select2" runat="server"></asp:DropDownList>
        </div>
    </div>
    <div class="row" style="padding-top: 40px;">

        <div class="col-12">
            <asp:Repeater ID="menuItem" runat="server">
                <ItemTemplate>
                    <div class="col-6 col-xs-12 col-sm-6 col-md-4 lgx-single-speacial lgx-card-single">
                        <figure>
                            <a href="#">
                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("FoodId")%>' />

                                <img src='<%#Eval("Picture") %>' style="min-height: 270px" alt="Offers" />
                            </a>
                            <figcaption>
                                <div class="speacial-price" style="font-size: 20px">
                                    <%#"৳"+Eval("Price") %>
                                </div>
                            </figcaption>
                        </figure>
                        <div class="speacial-info">
                            <h3 class="title text-primary"><a href="#"><%#Eval("FoodName") %></a></h3>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
    </div>
</asp:Content>

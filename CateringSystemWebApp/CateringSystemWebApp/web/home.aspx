<%@ Page Title="" Language="C#" MasterPageFile="~/web/user.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="CateringSystemWebApp.web.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-12 p-0">
        <!--BANNER-->
        <section class="">
            <div class="lgx-banner">
                <div class="lgx-banner-style">
                    <div class="lgx-inner lgx-inner-fixed">
                        <div class="container">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="lgx-banner-info">
                                        <!--lgx-banner-info-center lgx-banner-info-black lgx-banner-info-big lgx-banner-info-bg-->
                                        <h3 class="subtitle"></h3>
                                        <h3 class="subtitle"><span id="lgx-typed-string">Delicious Foods</span></h3>
                                        <h2 class="title">Specialty Of Foods</h2>

                                    </div>
                                </div>
                            </div>
                            <!--//.ROW-->
                        </div>
                        <!-- //.CONTAINER -->
                    </div>
                    <!-- //.INNER -->
                </div>
            </div>
        </section>
        <!--BANNER END-->
    </div>
    <div class="col-xs-12 col-md-7" style="padding-top: 30px !Important;">
        <div class="lgx-about-area">
            <div class="lgx-heading">
                <h2 class="heading-title">About Us</h2>
            </div>
            <div class="lgx-about-content">
                <blockquote class="about">
                    We are here to serve people who suffers from home food and also for those who want to do food business from home
                </blockquote>
                <p class="text">
                    Our service is our identity. If you face any kind of problem from our website feel free to contact us. Thanks you
                </p>
            </div>
        </div>
    </div>
</asp:Content>

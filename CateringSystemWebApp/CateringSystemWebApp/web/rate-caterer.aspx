<%@ Page Title="" Language="C#" MasterPageFile="~/web/user.Master" AutoEventWireup="true" CodeBehind="rate-caterer.aspx.cs" Inherits="CateringSystemWebApp.web.rate_caterer" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=20.1.0.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>

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
                                    <h2 class="heading-title">Pending Order Payment</h2>
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
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="col-md-12" style="padding: 35px!important;">
            <div class="row">
                <div class="col-12 col-md-12">
                    <div class="row">
                        <div class="col-12">
                            <asp:Image ID="imgCaterer" Style="width: 125px; height: 125px; border: 2px solid black;" runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <span><strong>Caterer Name</strong></span>
                            <asp:TextBox ID="txtCateringName" runat="server" CssClass="form-control" style="font-size: 20px; font-weight: 600;" Enabled="False"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <asp:Rating ID="Rating1" Style="position: relative;" StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
                                FilledStarCssClass="FilledStar" runat="server">
                            </asp:Rating>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12" style="margin-top: 10px;">
                            <asp:HiddenField ID="rateValue" runat="server" />
                            <asp:LinkButton ID="btnRating" OnClick="btnRating_OnClick" class="btn btn-primary" runat="server">Submit Rating</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <style type="text/css">
            .Star {
                background-image: url(/Rating/Star.png);
                background-repeat: no-repeat;
                background-size: cover;
                height: 45px;
                width: 45px;
            }

            .WaitingStar {
                background-image: url(/Rating/WaitingStar.png);
                background-repeat: no-repeat;
                background-size: cover;
                height: 45px;
                width: 45px;
            }

            .FilledStar {
                background-image: url(/Rating/FilledStar.png);
                background-repeat: no-repeat;
                background-size: cover;
                height: 45px;
                width: 45px;
            }
        </style>
    </div>
</asp:Content>

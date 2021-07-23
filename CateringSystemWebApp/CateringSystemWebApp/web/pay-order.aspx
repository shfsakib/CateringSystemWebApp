<%@ Page Title="" Language="C#" MasterPageFile="~/web/user.Master" AutoEventWireup="true" CodeBehind="pay-order.aspx.cs" Inherits="CateringSystemWebApp.web.pay_order" %>

<%@ Import Namespace="CateringSystemWebApp.URL" %>
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
                                    <h2 class="heading-title">Order Payment</h2>
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
    <%Function func = Function.GetInstance(); %>
    <div class="row mr-0 ml-0" style="padding-top: 40px;">
        <div class="col-12" style="padding: 30px;">
            <h5>Please pay BDT <label style="font-size: 28px"><%=Request.QueryString["total"] %></label> to <label style="font-size: 28px"><%=func.IsExist($@"SELECT MobileNo FROM Register WHERE RegId='{Request.QueryString["cateId"]}'") %></label> using bkash or nagad. Please use <label style="font-size: 24px">'<%=Request.QueryString["invoice"] %>'</label> as reference during payment through bKash or nagad.</h5>
        </div>
        <div class="col-12" style="padding: 30px;">
            <div class="row">
                <div class="col-lg-4"><strong>Bkash or Nagad No. (Last 6 digit only)</strong></div>
                <div class="col-lg-6">
                    <asp:TextBox ID="txtBkash" CssClass="form-control" autocomplete="off" MaxLength="6" placeholder="XXXXXX" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4"><strong>Transaction No.</strong></div>
                <div class="col-lg-6" style="padding-top: 2px">
                    <asp:TextBox ID="txtTrans" CssClass="form-control" autocomplete="off" placeholder="XXXX..." runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">&nbsp;</div>
                <div class="col-lg-6">
                    <asp:Button ID="btnPay" runat="server" OnClick="btnPay_OnClick" CssClass="btn btn-success" Style="margin-top: 10px;" Text="Confirm Order Payment" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

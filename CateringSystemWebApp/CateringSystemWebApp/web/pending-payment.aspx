<%@ Page Title="" Language="C#" MasterPageFile="~/web/user.Master" AutoEventWireup="true" CodeBehind="pending-payment.aspx.cs" Inherits="CateringSystemWebApp.web.pending_payment" %>

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
    <div class="row">
        <div class="col-12 table-responsive" style="padding: 20px;">
            <asp:GridView ID="gridOrder" class="table table-bordered" Style="background: #f3f3f3;" OnRowDataBound="gridOrder_OnRowDataBound" AutoGenerateColumns="False" ShowHeader="False" ShowHeaderWhenEmpty="True" AllowPaging="True" PageSize="50" OnPageIndexChanging="gridOrder_OnPageIndexChanging" EmptyDataText="No Pending Order Payment Found" runat="server">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div class="col-12 p-3 pl-2" style="padding: 10px;">
                                <div class="row p-0">
                                    <div class="col-12 col-lg-12">
                                        <asp:HiddenField ID="cateId" runat="server" Value='<%#Eval("CateId") %>' />
                                        <asp:HiddenField ID="custId" runat="server" Value='<%#Eval("CustId") %>' />
                                        <h3>#<asp:Label runat="server" ID="lblInvoice" Text='<%#Eval("OrderInvoice")%>'></asp:Label></h3>
                                        <h4>
                                            <asp:Label runat="server" ID="Label7" Text='<%#"Ordered by "+Eval("CustName")%>'></asp:Label></h4>
                                        <p class="mp">
                                            <asp:Label runat="server" ID="lblShop" Text='<%#"<b>Catering Name: </b>"+Eval("CateringName")%>'></asp:Label>
                                        </p>
                                        <p class="mp">
                                            <asp:GridView ID="gridFood" class="table table-bordered" Width="100%" Style="background: #f3f3f3;" AutoGenerateColumns="False" ShowHeader="False" ShowHeaderWhenEmpty="True" EmptyDataText="No Food Found" runat="server">
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:HiddenField ID="foodId" runat="server" Value='<%#Eval("FoodId") %>' />
                                                            <asp:Label runat="server" ID="lblName" Text='<%#Eval("FoodName")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblQuantity" runat="server" Text='<%#Eval("Quantity")%>'></asp:Label></p>               
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPrice" runat="server" Text='<%#Eval("Price")%>'></asp:Label></p>               
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </p>
                                        <p class="mp">
                                            Total:
                                            <asp:Label ID="Label5" runat="server" Text='<%#Eval("Total")%>'></asp:Label>
                                        </p>
                                        <h4>
                                            <p class="mp">
                                                Delivery Address:
                                                <asp:Label ID="Label6" runat="server" Text='<%#Eval("DeliveryLocation")%>'></asp:Label>
                                            </p>
                                        </h4>
                                       <p class="mp row">
                                            <a ID="lnlCall" class="btn btn-success" href='<%#"tel:"+Eval("CateMobile")%>' runat="server"><i class="fas fa-phone-alt"></i>&nbsp;Call Caterer</a>
                                            <a ID="lnkMail" class="btn btn-warning" href='<%#"mailto:"+Eval("CateEmail")%>' runat="server"><i class="far fa-envelope"></i>&nbsp;Mail Caterer</a>

                                        </p>
                                        <p class="mp" style="margin-top: 10px;">
                                            <a runat="server" id="btnRider" class="btn btn-primary col-5 mt2" href='<%#"/web/pay-order.aspx?invoice="+Eval("OrderInvoice")+"&cateId="+Eval("CustId")+ "&total=" +Eval("Total") %>'><i class="fas fa-wallet"></i>&nbsp;&nbsp;Pay Bill</a>
                                            <a runat="server" id="btnCancel" class="btn btn-danger col-5 mt2 ml2" onserverclick="btnCancel_OnServerClick"><i class="fas fa-times"></i>&nbsp;&nbsp;Cancel Order</a>

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
</asp:Content>

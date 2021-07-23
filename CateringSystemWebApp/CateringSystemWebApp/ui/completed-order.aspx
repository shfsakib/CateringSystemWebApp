<%@ Page Title="" Language="C#" MasterPageFile="~/ui/dashboard.Master" AutoEventWireup="true" CodeBehind="completed-order.aspx.cs" Inherits="CateringSystemWebApp.ui.completed_order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pd-ltr-20">
        <div class="card-box pd-20 height-100-p mb-10">
            <div class="row align-items-center pl-2">
                <h3>Completed Orders</h3>
            </div>
        </div>
        <div class="card-box pd-20 height-100-p mb-10 mt2">
            <div class="row align-items-center">
                <div class="table-responsive">
                    <asp:GridView ID="gridOrder" class="table table-bordered" Style="background: #f3f3f3;" OnRowDataBound="gridOrder_OnRowDataBound" AutoGenerateColumns="False" ShowHeader="False" ShowHeaderWhenEmpty="True" AllowPaging="True" PageSize="50" OnPageIndexChanging="gridOrder_OnPageIndexChanging" EmptyDataText="No Completed Order Found" runat="server">
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
                                                <p>
                                                    Bkash No. Or Nagad No. :
                                                    <asp:Label ID="lblbkash" runat="server" Text='<%#Eval("BkashNo")%>'></asp:Label>
                                                </p>
                                                <p>
                                                    Transaction No. :
                                                    <asp:Label ID="lblTrans" runat="server" Text='<%#Eval("TransNo")%>'></asp:Label>
                                                </p>
                                                <p>
                                                    Payment Time :
                                                    <asp:Label ID="lblPayment" runat="server" Text='<%#Eval("PayTime")%>'></asp:Label>
                                                </p>
                                                <h4>
                                                    <p class="mp">
                                                        Delivery Address:
                                                <asp:Label ID="Label6" runat="server" Text='<%#Eval("DeliveryLocation")%>'></asp:Label>
                                                    </p>
                                                </h4>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

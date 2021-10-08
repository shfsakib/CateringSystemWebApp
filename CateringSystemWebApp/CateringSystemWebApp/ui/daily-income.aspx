<%@ Page Title="" Language="C#" MasterPageFile="~/ui/dashboard.Master" AutoEventWireup="true" CodeBehind="daily-income.aspx.cs" Inherits="CateringSystemWebApp.ui.daily_income" %>

<%@ Import Namespace="System.ComponentModel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="card card-body">
        <h3>Daily Income</h3>
    </section>
    <div class="card card-body">
        <div class="row">
            <div class="col-6 col-md-4" style="margin: 0; padding: 0 0 0 15px;">
                <asp:TextBox ID="txtFrom" class="form-control" TextMode="Date" runat="server"></asp:TextBox>
            </div>
            <div class="col-6 col-md-4" style="margin: 0; padding: 0 15px 0 5px;">
                <asp:TextBox ID="txtTo" class="form-control" TextMode="Date" runat="server"></asp:TextBox>
            </div>
            <div class="col-12 col-md-3">
                <asp:LinkButton ID="lnkSearch" CssClass="btn btn-primary" OnClick="lnkSearch_OnClick" runat="server"><i class="fas fa-search"></i>&nbsp;&nbsp;Search</asp:LinkButton>
            </div>
        </div>
    </div>
    <div class="card card-body col-md-12">
        <div class="row">
            <div class="col-12 text-right">
                <h5>Total Income </h5>
                <h3><asp:Label ID="lblIncome" runat="server" Text="0"></asp:Label>&nbsp;Tk</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-12" style="padding-left: 0px">
                <div class="table-responsive" style="border: none;">
                    <asp:GridView ID="gridIncome" Width="100%" class="table table-hover table-bordered table-striped" Style="background: #ededfb;" OnPageIndexChanging="gridIncome_OnPageIndexChanging" AutoGenerateColumns="False" ShowHeader="True" ShowHeaderWhenEmpty="True" EmptyDataText="No Income Found" AllowPaging="True" PageSize="30" runat="server">
                        <Columns>
                            <asp:TemplateField HeaderText="Serial">
                                <ItemTemplate>
                                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("OrderId")%>' />
                                    <asp:Label ID="Label1" runat="server" Text='<%# Container.DataItemIndex+1%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Invoice_Id">
                                <ItemTemplate>
                                    <asp:Label ID="lblInvoice" runat="server" Text='<%#Eval("OrderInvoice")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="FoodName">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("FoodName")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quantity">
                                <ItemTemplate>
                                    <asp:Label ID="Label31" runat="server" Text='<%#Eval("Quantity")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Price">
                                <ItemTemplate>
                                    <asp:Label ID="lblPrice" runat="server" Text='<%#Eval("Price")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Order_Time">
                                <ItemTemplate>
                                    <asp:Label ID="Label91" runat="server" Text='<%#Eval("Ordertime")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

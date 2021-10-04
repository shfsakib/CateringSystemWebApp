<%@ Page Title="" Language="C#" MasterPageFile="~/ui/dashboard.Master" AutoEventWireup="true" CodeBehind="caterer-monthly-income.aspx.cs" Inherits="CateringSystemWebApp.ui.caterer_monthly_income" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card card-body">
        <h3>Caterer Monthly Income</h3>
    </div>
    <div class="card card-body col-md-12">
        <div class="row">
            <div class="col-md-12 table-responsive pt-3">
                <asp:GridView ID="gridIncome" Width="100%" class="table table-hover table-bordered table-striped" Style="background: #ededfb;" AutoGenerateColumns="False" ShowHeader="True" AllowPaging="True" PageSize="20" OnPageIndexChanging="gridIncome_OnPageIndexChanging" ShowHeaderWhenEmpty="True" EmptyDataText="No Income Found" runat="server">
                    <Columns>
                        <asp:TemplateField HeaderText="Serial">
                            <ItemTemplate>
                                <asp:Label ID="lblSl" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Month">
                            <ItemTemplate>
                                <asp:Label ID="lblMonth" runat="server" Text='<%#Month(Eval("OrderMonth").ToString())%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total_Income">
                            <ItemTemplate>
                                <asp:Label ID="lblIncome" runat="server" Text='<%#Eval("TotalIncome")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

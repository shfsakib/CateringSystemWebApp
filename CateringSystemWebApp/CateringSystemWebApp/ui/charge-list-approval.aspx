<%@ Page Title="" Language="C#" MasterPageFile="~/ui/dashboard.Master" AutoEventWireup="true" CodeBehind="charge-list-approval.aspx.cs" Inherits="CateringSystemWebApp.ui.charge_list_approval" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pd-ltr-20">
        <div class="card-box pd-20 height-100-p mb-10">
            <div class="row align-items-center pl-2">
                <h3>Charge List</h3>
            </div>
        </div>
        <div class="card-box pd-20 height-100-p mb-30">
            <div class="row align-items-center">
                <div class="col-3">
                    <asp:DropDownList ID="ddlStatus" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlStatus_OnSelectedIndexChanged" runat="server">
                        <asp:ListItem Value="I">Inactive</asp:ListItem>
                        <asp:ListItem Value="A">Active</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-4">
                    <asp:DropDownList ID="ddlCatering"  CssClass="form-control select2" AutoPostBack="True" OnSelectedIndexChanged="ddlCatering_OnSelectedIndexChanged" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="row align-items-center pt-2">
                <div class="col-12 table-responsive">
                    <asp:GridView ID="gridCharge" Width="100%" class="table table-hover table-bordered table-striped" Style="background: #ededfb;" OnRowDataBound="gridCharge_OnRowDataBound" OnPageIndexChanging="gridCharge_OnPageIndexChanging" AutoGenerateColumns="False" ShowHeader="True" ShowHeaderWhenEmpty="True" EmptyDataText="No Payment Found" AllowPaging="True" PageSize="30" runat="server">
                        <Columns>
                            <asp:TemplateField HeaderText="Catering_Name">
                                <ItemTemplate>
                                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("ChargeId")%>' />
                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("Name")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("Email")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Month">
                                <ItemTemplate>
                                    <asp:Label ID="Label31" runat="server" Text='<%#Eval("Month")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Bkash_No">
                                <ItemTemplate>
                                    <asp:Label ID="Label41" runat="server" Text='<%#Eval("BkashNo")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Transaction_No">
                                <ItemTemplate>
                                    <asp:Label ID="Label51" runat="server" Text='<%#Eval("TransactionNo")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Amount">
                                <ItemTemplate>
                                    <asp:Label ID="Label81" runat="server" Text='<%#Eval("Amount")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Payment_Time">
                                <ItemTemplate>
                                    <asp:Label ID="Label91" runat="server" Text='<%#Eval("PaymentTime")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkAccept" class="btn btn-success" OnClick="lnkAccept_OnClick" runat="server" ToolTip="Accept"><i class="fas fa-check fa-lg"></i>&nbsp;Accept</asp:LinkButton>
                                    <asp:LinkButton ID="lnkRemove" class="btn btn-danger" OnClick="lnkRemove_OnClick" runat="server" ToolTip="Remove"><i class="fas fa-trash-alt fa-lg"></i>&nbsp;Remove</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

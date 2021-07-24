<%@ Page Title="" Language="C#" MasterPageFile="~/ui/dashboard.Master" AutoEventWireup="true" CodeBehind="charge-list.aspx.cs" Inherits="CateringSystemWebApp.ui.charge_list" %>

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
                    <asp:dropdownlist id="ddlStatus" class="form-control" autopostback="True" onselectedindexchanged="ddlStatus_OnSelectedIndexChanged" runat="server">
                    <asp:ListItem Value="I">Inactive</asp:ListItem>
                    <asp:ListItem Value="A">Active</asp:ListItem>
                </asp:dropdownlist>
                </div>
                <div class="col-4">
                    <asp:textbox id="txtMonth" autopostback="True" ontextchanged="txtMonth_OnTextChanged" autocomplete="off" class="form-control wd-100" textmode="Month" runat="server"></asp:textbox>
                </div>
            </div>
            <div class="row align-items-center pt-2">
                <div class="col-12 table-responsive">
                    <asp:gridview id="gridCharge" width="100%" class="table table-hover table-bordered table-striped" style="background: #ededfb;" onrowdatabound="gridCharge_OnRowDataBound" onpageindexchanging="gridCharge_OnPageIndexChanging" autogeneratecolumns="False" showheader="True" showheaderwhenempty="True" emptydatatext="No Payment Found" allowpaging="True" pagesize="30" runat="server">
                        <Columns>
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
                                    <asp:LinkButton ID="lnkRemove" class="btn btn-danger" OnClick="lnkRemove_OnClick" runat="server" ToolTip="Remove"><i class="fas fa-trash-alt fa-lg"></i>&nbsp;Remove</asp:LinkButton>
                                        </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:gridview>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

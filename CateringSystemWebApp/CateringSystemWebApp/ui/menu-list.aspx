<%@ Page Title="" Language="C#" MasterPageFile="~/ui/dashboard.Master" AutoEventWireup="true" CodeBehind="menu-list.aspx.cs" Inherits="CateringSystemWebApp.ui.menu_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pd-ltr-20">
        <div class="card-box pd-20 height-100-p mb-10">
            <div class="row align-items-center pl-2">
                <h3>Food List</h3>
            </div>
        </div>
        <div class="card-box pd-20 height-100-p mb-30">
            <div class="row align-items-center">
                <div class="col-8 col-lg-3 col-md-5 pt-2 pt-lg-0">
                    <asp:DropDownList ID="ddlFood" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
                <div class="col-2 col-lg-2 pt-2 pt-lg-0">
                    <asp:Button ID="btnSearchFood" OnClick="btnSearchFood_Click" class="btn btn-warning col-wht" runat="server" Text="Search" />
                </div>
            </div>
        </div>
        <div class="card-box pd-20 height-100-p mb-10 mt2">
            <div class="row align-items-center">
                <div class="table-responsive">
                    <asp:GridView ID="gridFood" class="table table-hover table-bordered table-striped" Style="margin-top: 10px !important;" OnRowDataBound="gridFood_OnRowDataBound" OnPageIndexChanging="gridFood_OnPageIndexChanging" AutoGenerateColumns="False" ShowHeader="true" ShowHeaderWhenEmpty="True" EmptyDataText="No Menu Found" AllowPaging="True" PageSize="20" runat="server">
                        <Columns>
                            <asp:TemplateField HeaderText="Sl">
                                <ItemTemplate>
                                    <asp:Label ID="Label121" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Food_Name">
                                <ItemTemplate>
                                    <asp:HiddenField ID="status" runat="server" Value='<%#Eval("Status")%>' />
                                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("FoodId")%>' />
                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("FoodName")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quantity">
                                <ItemTemplate>
                                    <asp:Label ID="Label21" runat="server" Text='<%#Eval("Quantity")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Price">
                                <ItemTemplate>
                                    <asp:Label ID="Label31" runat="server" Text='<%#Eval("Price")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Picture">
                                <ItemTemplate>
                                    <asp:Image ID="Image11" ImageUrl='<%#Eval("Picture")%>' Style="height: 120px; width: 120px;" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkRemove" class="btn btn-danger" OnClick="lnkRemove_OnClick" runat="server" title="Remove Food"><i class="fas fa-trash fa-lg"></i></asp:LinkButton>
                                    <asp:LinkButton ID="lnkActive" class="btn btn-primary" OnClick="lnkActive_OnClick" runat="server" title="Active Food"><i class="fas fa-check fa-lg"></i></asp:LinkButton>
                                    <asp:LinkButton ID="lbkInactive" class="btn btn-warning" OnClick="lbkInactive_OnClick" runat="server" title="Inactive Food"><i class="fas fa-times fa-lg"></i></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

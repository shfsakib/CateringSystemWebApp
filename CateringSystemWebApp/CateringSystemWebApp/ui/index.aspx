<%@ Page Title="" Language="C#" MasterPageFile="~/ui/dashboard.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CateringSystemWebApp.ui.index" %>

<%@ Import Namespace="CateringSystemWebApp.URL" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card card-body">
        <h3>Dashboard</h3>
    </div>
    <div class="card card-body">
        <div class="row">
            <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                <div class="card-box noradius noborder bg-danger pb-4">
                    <i class="far fa-user float-right text-white"></i>
                    <h6 class="text-white text-uppercase m-b-20">Customer</h6>
                    <h1 class="m-b-20 text-white counter" runat="server" id="totalUser">487</h1>
                    <span class="text-white"></span>
                </div>
            </div>

            <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                <div class="card-box noradius noborder bg-purple pb-4">
                    <i class="fas fa-store float-right text-white"></i>
                    <h6 class="text-white text-uppercase m-b-20">Caterer</h6>
                    <h1 class="m-b-20 text-white counter" runat="server" id="totalCaterer">290</h1>
                    <span class="text-white"></span>
                </div>
            </div>

            <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                <div class="card-box noradius noborder bg-warning pb-4">
                    <i class="fas fa-shopping-cart float-right text-white"></i>
                    <h6 class="text-white text-uppercase m-b-20">Orders</h6>
                    <h1 class="m-b-20 text-white counter" runat="server" id="totalOrders">320</h1>
                    <span class="text-white"></span>
                </div>
            </div>

            <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                <div class="card-box noradius noborder bg-info pb-4">
                    <i class="fas fa-hamburger float-right text-white"></i>
                    <h6 class="text-white text-uppercase m-b-20">Foods</h6>
                    <h1 class="m-b-20 text-white counter" runat="server" id="totalFoods">58</h1>
                    <span class="text-white"></span>
                </div>
            </div>
        </div>
    </div>
    <!-- end row -->
    <%Function func = Function.GetInstance();
        if (func.TypeCookie() == "Admin" || func.TypeCookie() == "Moderator")
        { %>
    <div class="card card-header">
        <h3>Pending Caterer List</h3>
    </div>
    <div class="card card-body col-md-12">
        <div class="row">
            <div class="col-12 col-md-12" style="padding-left: 0px">
                <div class="table-responsive" style="border: none;">
                    <asp:GridView ID="gridCate" Width="100%" class="table table-hover table-bordered table-striped" Style="background: #ededfb;" OnPageIndexChanging="gridCate_OnPageIndexChanging" AutoGenerateColumns="False" ShowHeader="True" ShowHeaderWhenEmpty="True" EmptyDataText="No Caterer Request Found" AllowPaging="True" PageSize="30" runat="server">
                        <Columns>
                            <asp:TemplateField HeaderText="Catering_Name">
                                <ItemTemplate>
                                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("RegId")%>' />
                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("Name")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("Email")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Mobile_No.">
                                <ItemTemplate>
                                    <asp:Label ID="Label31" runat="server" Text='<%#Eval("MobileNo")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="District">
                                <ItemTemplate>
                                    <asp:Label ID="Label81" runat="server" Text='<%#Eval("DistrictName")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Thana">
                                <ItemTemplate>
                                    <asp:Label ID="Label91" runat="server" Text='<%#Eval("Thana")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Bkash_No">
                                <ItemTemplate>
                                    <asp:Label ID="Label512" runat="server" Text='<%#Eval("BkashNo")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Trans_No">
                                <ItemTemplate>
                                    <asp:Label ID="Label513" runat="server" Text='<%#Eval("TransNo")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Reference">
                                <ItemTemplate>
                                    <asp:Label ID="Label515" runat="server" Text='<%#Eval("Amount")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Picture">
                                <ItemTemplate>
                                    <asp:Image ID="Image11" Width="100px" Height="100px" ImageUrl='<%#Eval("Picture")%>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkReject" class="btn btn-danger" OnClick="lnkReject_OnClick" runat="server" ToolTip="Make Inactive"><i class="fas fa-trash-alt fa-lg"></i></asp:LinkButton>
                                    <asp:LinkButton ID="lbkActive" class="btn btn-success" OnClick="lbkActive_OnClick" runat="server" ToolTip="Make Active"><i class="fas fa-check fa-lg"></i></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
    <% } %>
</asp:Content>

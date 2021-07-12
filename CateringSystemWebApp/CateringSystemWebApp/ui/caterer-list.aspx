<%@ Page Title="" Language="C#" MasterPageFile="~/ui/dashboard.Master" AutoEventWireup="true" CodeBehind="caterer-list.aspx.cs" Inherits="CateringSystemWebApp.ui.caterer_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="card card-body">
        <h3>Caterer List</h3>
    </section>
    <div class="card card-body">
        <div class="row">
            <div class="col-5 col-md-3" style="margin: 0; padding: 0 0 0 15px;">
                <asp:DropDownList ID="ddlStatus" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlStatus_OnSelectedIndexChanged" runat="server">
                    <asp:ListItem Value="A">Active</asp:ListItem>
                    <asp:ListItem Value="I">Inactive</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-7 col-md-5" style="margin: 0; padding: 0 15px 0 5px;">
                <asp:DropDownList ID="ddlUser" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlUser_OnSelectedIndexChanged" runat="server">
                </asp:DropDownList>
            </div>
        </div>
    </div>
    <div class="card card-body col-md-12">
        <div class="row">
            <div class="col-12 col-md-12" style="padding-left: 0px">
                <div class="table-responsive" style="border: none;">
                    <asp:GridView ID="gridCate" Width="100%" class="table table-hover table-bordered table-striped" Style="background: #ededfb;" OnRowDataBound="gridCate_OnRowDataBound" OnPageIndexChanging="gridCate_OnPageIndexChanging" AutoGenerateColumns="False" ShowHeader="True" ShowHeaderWhenEmpty="True" EmptyDataText="No Caterer Found" AllowPaging="True" PageSize="20" runat="server">
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
                                    <asp:LinkButton ID="lnkInactive" class="btn btn-danger" OnClick="lnkInactive_OnClick" runat="server" ToolTip="Make Inactive"><i class="fas fa-times fa-lg"></i></asp:LinkButton>
                                    <asp:LinkButton ID="lbkActive" class="btn btn-success" OnClick="lbkActive_OnClick" runat="server" ToolTip="Make Active"><i class="fas fa-check fa-lg"></i></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

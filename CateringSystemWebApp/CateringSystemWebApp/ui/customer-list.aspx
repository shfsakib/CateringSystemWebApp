<%@ Page Title="" Language="C#" MasterPageFile="~/ui/dashboard.Master" AutoEventWireup="true" CodeBehind="customer-list.aspx.cs" Inherits="CateringSystemWebApp.ui.customer_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="card card-body">
        <h3>Customer List</h3>
    </section>
    <div class="card card-body">
        <div class="row">
            <div class="col-5 col-md-3" style="margin: 0; padding: 0 0 0 15px;">
                <asp:DropDownList ID="ddlStatus" class="form-control select2" AutoPostBack="True" OnSelectedIndexChanged="ddlStatus_OnSelectedIndexChanged" runat="server">
                    <asp:ListItem Value="A">Active</asp:ListItem>
                    <asp:ListItem Value="I">Inactive</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-7 col-md-5" style="margin: 0; padding: 0 15px 0 5px;">
                <asp:DropDownList ID="ddlUser" class="form-control select2" AutoPostBack="True" OnSelectedIndexChanged="ddlUser_OnSelectedIndexChanged" runat="server">
                </asp:DropDownList>
            </div>
        </div>
    </div>
    <div class="card card-body col-md-12">
        <div class="row">
            <div class="col-12 col-md-12" style="padding-left: 0px">
                <div class="table-responsive" style="border: none;">
                    <asp:GridView ID="gridCus" Width="100%" class="table table-hover table-bordered table-striped" Style="background: #ededfb;" OnRowDataBound="gridCus_OnRowDataBound" OnPageIndexChanging="gridCus_OnPageIndexChanging" AutoGenerateColumns="False" ShowHeader="True" ShowHeaderWhenEmpty="True" EmptyDataText="No Customer Found" AllowPaging="True" PageSize="20" runat="server">
                        <Columns>
                            <asp:TemplateField HeaderText="Customer_Name">
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
                            <asp:TemplateField HeaderText="Gender">
                                <ItemTemplate>
                                    <asp:Label ID="Label41" runat="server" Text='<%#Eval("Gender")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date_of_Birth">
                                <ItemTemplate>
                                    <asp:Label ID="Label51" runat="server" Text='<%#Eval("Dob")%>'></asp:Label>
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

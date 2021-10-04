<%@ Page Title="" Language="C#" MasterPageFile="~/ui/dashboard.Master" AutoEventWireup="true" CodeBehind="customer-review.aspx.cs" Inherits="CateringSystemWebApp.ui.customer_review" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card card-body">
        <h3>Customer Review</h3>
    </div>
    <div class="card card-body col-md-12">
        <div class="row" id="reviewDiv">
            <div class="col-md-12 table-responsive pt-3">
                <asp:GridView ID="gridReview" Width="100%" class="table table-hover table-bordered table-striped" Style="background: #ededfb;" AutoGenerateColumns="False" ShowHeader="False" AllowPaging="True" PageSize="20" OnPageIndexChanging="gridReview_OnPageIndexChanging" ShowHeaderWhenEmpty="True" EmptyDataText="No Review Found" runat="server">
                    <Columns>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("RateId")%>' />
                                <div class="col-12 p-3 pl-2" style="padding: 10px;">
                                    <div class="row p-0">
                                        <div class="col-12 col-lg-12" style="padding: 15px!important">
                                            <img src="/URL/user.png" style="width: 45px; height: 45px; border-radius: 50%; border: 1px solid black;" />&nbsp;&nbsp;&nbsp;<b>Anonymous</b><br />
                                            <br />
                                            <span style="padding: 10px 0 0 30px; display: block; white-space: nowrap;"><i class="far fa-comment-alt fa-lg"></i>&nbsp;&nbsp;<asp:Label ID="lblReview" runat="server" Text='<%#Eval("Review")%>'></asp:Label>
                                            </span>
                                            <br />
                                            <span style="float: right; font-size: 14px; color: #495057;"><%#Eval("InTime")%></span>
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
</asp:Content>

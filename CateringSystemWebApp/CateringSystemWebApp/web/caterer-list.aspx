<%@ Page Title="" Language="C#" MasterPageFile="~/web/user.Master" AutoEventWireup="true" CodeBehind="caterer-list.aspx.cs" Inherits="CateringSystemWebApp.web.caterer_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"><section>
        <div class="lgx-banner lgx-banner-inner">
            <div class="lgx-page-inner">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="lgx-heading-area">
                                <div class="lgx-heading lgx-heading-white">
                                    <h2 class="heading-title">Caterer List</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--//.ROW-->
                </div>
                <!-- //.CONTAINER -->
            </div>
            <!-- //.INNER -->
        </div>
    </section>
    <div class="row" style="padding-top: 40px">
        <div class="col-lg-5 p-4">
            <asp:DropDownList ID="ddlCaterer" AutoPostBack="true" OnSelectedIndexChanged="ddlCaterer_OnSelectedIndexChanged" class="form-control select2" runat="server"></asp:DropDownList>
        </div>
    </div>
    <div class="row" style="padding-top: 40px;">

        <div class="col-12">
            <asp:Repeater ID="catererListRepeater" runat="server">
                <ItemTemplate>
                    <a runat="server" id="viewCaterer" onserverclick="viewCaterer_OnServerClick">
                        <div class="col-6 col-xs-12 col-sm-6 col-md-4 col-lg-3 lgx-single-speacial lgx-card-single">
                            <figure style="text-align: center;">

                                <asp:HiddenField ID="CateId" runat="server" Value='<%#Eval("RegId")%>' /> 

                                <img src='<%#Eval("Picture") %>' style="max-height: 200px; height: 200px;margin: 0 auto" alt="Offers" />

                                 
                            </figure>
                            <div class="speacial-info">
                                <h3 class="title text-primary"><%#Eval("Name") %></h3>
                            </div>
                        </div>
                    </a>
                </ItemTemplate>
            </asp:Repeater>

        </div>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/web/user.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="CateringSystemWebApp.web.profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pd-ltr-20">
        <div class="card-box pd-20 height-100-p mb-10">
            <div class="row align-items-center text-center pl-2 pt-4">
                <h3>Profile</h3>
            </div>
        </div>
        <div class="card-box pd-20 height-100-p mb-30">
            <div class="row align-items-center">
                <div class="col-12 col-lg-12 col-md-12">
                    <div class="row">
                        <div class="col-12" style="text-align: center">
                            <asp:Image ID="profileImage" runat="server" ImageUrl="/url/user.png" class="rounded-circle" Width="250px" Height="250px" alt="profile_image" Style="border: 1px solid black; border-radius: 50%;" />
                            <br />
                            <asp:FileUpload ID="fileProfile" onchange="ImagePreview(this)" Visible="False" accept=".png,.jpg,.jpeg" runat="server" />
                        </div>
                        <div class="col-12"></div>
                    </div>
                    <div class="row">
                        <div class="col-12"></div>
                        <div class="col-12" style="text-align: center">
                            <br />
                            <asp:Label ID="nameLabel" runat="server" Style="font-family: comic sans ms; font-size: 20px;" Text="Label"></asp:Label>
                            <asp:TextBox ID="txtName" CssClass="form-control wd mt2" Visible="False" placeholder="Full Name" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-12"></div>
                    </div>
                    <div class="row">
                        <div class="col-12"></div>
                        <div class="col-12" style="text-align: center">
                            <br />
                            <a id="btnEdit" runat="server" class="btn btn-primary" style="color: white;" title="Edit" onserverclick="btnEdit_OnServerClick"><i class="fas fa-edit"></i>&nbsp;&nbsp;Edit Profile</a>
                            <asp:LinkButton ID="lnkUpdate" Visible="False" CssClass="btn btn-success" OnClick="lnkUpdate_OnClick" runat="server"><i class="fas fa-check"></i>&nbsp;&nbsp;Update</asp:LinkButton>
                            <br />
                        </div>
                        <div class="col-12"></div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-lg-2">Email :</div>
                        <div class="col-lg-4">
                            <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="col-lg-2">
                            Mobile No. :
                        </div>
                        <div class="col-lg-4">
                            <asp:Label ID="lblMobile" runat="server" Text=""></asp:Label>
                            <asp:TextBox ID="txtMobile" CssClass="form-control wd mt2" Visible="False" autocomplete="off" placeholder="01XXXXXXXXX" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row" id="userDiv" runat="server">
                        <div class="col-lg-2">Gender :</div>
                        <div class="col-lg-4">
                            <asp:Label ID="lblGender" runat="server" Text=""></asp:Label>
                            <asp:DropDownList ID="ddlGender" class="form-control wd mt2s" Visible="False" Style="border-right: 1px solid gainsboro" runat="server">
                                <asp:ListItem>--Select--</asp:ListItem>
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-lg-2">
                            Date of Birth :
                        </div>
                        <div class="col-lg-4">
                            <asp:Label ID="lblDob" runat="server" Text=""></asp:Label>
                            <asp:TextBox ID="txtDob" CssClass="form-control" TextMode="Date" Visible="False" autocomplete="off" placeholder="dd/mm/yyyy" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-2">Password :</div>
                        <div class="col-lg-4">
                            <asp:Label ID="lblPass" runat="server" Text="********"></asp:Label>
                            <asp:TextBox ID="txtPass" CssClass="form-control wd mt2" Visible="False" placeholder="Enter Password" autocomplete="off" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

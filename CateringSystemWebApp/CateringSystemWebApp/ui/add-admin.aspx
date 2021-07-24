<%@ Page Title="" Language="C#" MasterPageFile="~/ui/dashboard.Master" AutoEventWireup="true" CodeBehind="add-admin.aspx.cs" Inherits="CateringSystemWebApp.ui.add_admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pd-ltr-20">
        <div class="card-box pd-20 height-100-p mb-10">
            <div class="row align-items-center pl-2">
                <h3>Add Admin</h3>
            </div>
        </div>
        <div class="card-box pd-20 height-100-p mb-30">
            <div class="row align-items-center">
                <div class="col-3"></div>
                <div class="col-12 col-lg-6 col-md-6">
                    <div class="row">
                        <div class="col-12">
                            Name :
                            <input type="text" runat="server" class="form-control wd" autocomplete="off" placeholder="Full Name" id="txtName" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            Email :
                            <input class="form-control wd" id="txtEmail" autocomplete="off" runat="server" type="email" placeholder="example@example.com" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            Mobile No. :
                            <input type="text" runat="server" autocomplete="off" class="form-control wd" placeholder="01XXXXXXXXX" id="txtMobileNo" />
                        </div>
                        <div class="col-md-2"></div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            Date of Birth :
                            <asp:TextBox ID="txtDob" autocomplete="off" class="form-control wd" runat="server" required="required" placeholder="dd/mm/yyyy"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            Gender :
                            <asp:DropDownList ID="ddlGender" runat="server" class="form-control wd">
                                <asp:ListItem>Select</asp:ListItem>
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            Profile Picture :
                            <asp:FileUpload ID="fileImage" onchange="ImagePreview(this)" class="form-control" accept=".png,.jpg,.jpeg" runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <img id="profilePicImage" runat="server" class="form-control wd" src="/URL/user.png" alt="ProfilePic" style="height: 150px; width: 150px" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            Type :
                            <asp:DropDownList ID="ddlType" class="form-control wd" required="required" runat="server">
                                <asp:ListItem Text="Select"></asp:ListItem>
                                <asp:ListItem Text="Admin"></asp:ListItem>
                                <asp:ListItem Text="Moderator"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            Password :
                            <input type="password" runat="server" autocomplete="off" class="form-control wd" placeholder="enter password" id="txtNewPass" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <asp:LinkButton ID="createButton" OnClick="createButton_OnClick" Style="width: 100%; margin-top: 5px" runat="server" class="btn btn-primary wd">Add</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.container-fluid -->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript">
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $("#ContentPlaceHolder1_profilePicImage").prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>

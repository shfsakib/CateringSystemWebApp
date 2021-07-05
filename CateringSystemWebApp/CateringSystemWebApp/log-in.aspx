<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="log-in.aspx.cs" Inherits="CateringSystemWebApp.log_in" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Catering Service</title>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <!-- /Added by HTTrack -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="UTF-8" />
    <!-- css files -->
    <link rel="stylesheet" href="/URL/login/css/style.css" type="text/css" media="all" />
    <!-- Style-CSS -->
    <link href="/URL/login/css/font-awesome.min.css" rel="stylesheet" />
    <!-- Font-Awesome-Icons-CSS -->
    <!-- //css files -->
    <!-- web-fonts -->
    <link href="http://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext"
        rel="stylesheet" />
    <!-- //web-fonts -->
    <link rel="stylesheet" href="/URL/login/assests/css/font-awesome.min.css" />
    <link href="URL/font-awesome.css" rel="stylesheet" />
    <script src="URL/font-awesome.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- New toolbar-->
        <div class="main-bg">
            <!-- title -->
            <!-- //title -->
            <!---728x90--->

            <div class="sub-main-w3">
                <div class="image-style">
                </div>
                <!-- vertical tabs -->
                <div class="vertical-tab">
                    <div id="section1" class="section-w3ls">
                        <input type="radio" name="sections" id="option1" checked="checked" />
                        <label for="option1" class="icon-left-w3pvt">
                            <span class="fa fa-user-circle"
                                aria-hidden="true"></span>Login</label>
                        <article style="padding: 63px 10px; background: rgba(0,0,0,0.7);">
                            <form>
                                <h3 class="legend">Login Here</h3>
                                <div class="input">
                                    <span class="fa fa-envelope-o" aria-hidden="true"></span>
                                    <input type="email" id="txtlogEmail" runat="server" placeholder="Email" name="email" />
                                </div>
                                <div class="input">
                                    <span class="fa fa-key" aria-hidden="true"></span>
                                    <input type="password" id="txtlogPassword" runat="server" placeholder="Password" name="password" />
                                </div>
                                <button type="submit" id="btnLogin" runat="server" class="btn submit">Login</button>
                            </form>
                        </article>
                    </div>
                    <div id="section2" class="section-w3ls">
                        <input type="radio" name="sections" runat="server" id="option2">
                        <label for="option2" id="lblOption2" runat="server" class="icon-left-w3pvt">
                            <span class="fa fa-pencil-square"
                                aria-hidden="true"></span>Register</label>
                        <article>
                            <form action="#" method="post">
                                <h3 class="legend">Register Here</h3>
                                <div style="display: flex; padding: 10px">
                                    <div style="width: 50%; text-align: center; padding-right: 5px;">
                                        <button id="btnCus" type="button" class="reg-top-button">Customer</button>
                                    </div>
                                    <div style="width: 50%; text-align: center; padding-left: 5px;">
                                        <button id="btnCat" type="button" class="reg-top-button">Caterer</button>
                                    </div>
                                </div>
                                <asp:Panel ID="panelCus" runat="server">
                                    <div class="input">
                                        <span class="fa fa-user-o" aria-hidden="true"></span>
                                        <input type="text" runat="server" id="txtCusName" placeholder="Full Name" name="name" />
                                    </div>
                                    <div class="input">
                                        <span class="fa fa-envelope-o" aria-hidden="true"></span>
                                        <input type="email" runat="server" id="txtCusEmail" placeholder="Email Address" name="name" />
                                    </div>
                                    <div class="input">
                                        <span class="fa fa-phone" aria-hidden="true"></span>
                                        <input type="text" runat="server" id="txtCusMobile" placeholder="Mobile Number" name="name" />
                                    </div>
                                    <div class="input">
                                        <span class="fa fa-user" aria-hidden="true"></span>
                                        <asp:DropDownList ID="ddlGender" runat="server">
                                            <asp:ListItem>Gender</asp:ListItem>
                                            <asp:ListItem>Male</asp:ListItem>
                                            <asp:ListItem>Female</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="input">
                                        <input type="date" runat="server" id="txtCusDOB" placeholder="" name="name" />
                                    </div>
                                    <div class="input">
                                        <span class="fa fa-image" aria-hidden="true"></span>
                                        <asp:FileUpload ID="fileCus" accept=".png,.jpg,.jpeg,.giff,.tiff" runat="server" />
                                    </div>
                                    <div class="input">
                                        <span class="fa fa-key" aria-hidden="true"></span>
                                        <input type="password" runat="server" id="txtCusPass" placeholder="Password" name="password" />
                                    </div>
                                    <button type="submit" runat="server" id="btnCusReg" onserverclick="btnCusReg_OnServerClick" class="btn submit">Register</button>
                                </asp:Panel>
                                <%-- Caterer --%>
                                <asp:Panel ID="panelCat" runat="server" Style="display: none;">
                                    <asp:Panel ID="View1" runat="server">
                                        <div class="input">
                                            <span class="fa fa-user-o" aria-hidden="true"></span>
                                            <input type="text" runat="server" id="txtCatName" placeholder="Catering Name" name="name" />
                                        </div>
                                        <div class="input">
                                            <span class="fa fa-envelope-o" aria-hidden="true"></span>
                                            <input type="email" runat="server" id="txtCatEmail" placeholder="Email Address" name="name" />
                                        </div>
                                        <div class="input">
                                            <span class="fa fa-phone" aria-hidden="true"></span>
                                            <input type="text" runat="server" id="txtCatMobile" placeholder="Mobile Number" name="name" />
                                        </div>
                                        <div class="input">
                                            <span class="fa fa-map-marker" aria-hidden="true"></span>
                                            <asp:DropDownList ID="ddlDis" runat="server">
                                                <asp:ListItem>--DISTRICT--</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="input">
                                            <span class="fa fa-building" aria-hidden="true"></span>
                                            <asp:DropDownList ID="ddlThana" runat="server">
                                                <asp:ListItem>--THANA--</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="input">
                                            <span class="fa fa-image" aria-hidden="true"></span>
                                            <asp:FileUpload ID="fileCat" accept=".png,.jpg,.jpeg,.giff,.tiff" runat="server" />
                                        </div>
                                        <div class="input">
                                            <span class="fa fa-key" aria-hidden="true"></span>
                                            <input type="password" id="txtCatPass" runat="server" placeholder="Password" name="password" />
                                        </div>
                                        <button type="button" id="btnCatNext" class="btn submit">Next</button>
                                    </asp:Panel>
                                    <asp:Panel ID="View2" runat="server" Style="display: none;">
                                        <p class="para-style">Please pay BDT 200 as your registration fees to 01XXXXXXXXX by bkash or nagad. Please use your email id as your reference.</p>
                                        <div class="input">
                                            <span class="fa fa-mobile" aria-hidden="true"></span>
                                            <input type="text" runat="server" id="txtCatBkash" placeholder="Bkash no (Last 6 digit only)" maxlength="6" name="name" />
                                        </div>
                                        <div class="input">
                                            <span class="fas fa-sort-numeric-up-alt" aria-hidden="true"></span>
                                            <input type="text" runat="server" id="txtCatTrans" placeholder="Transaction Number" name="name" />
                                        </div>
                                        <asp:Button ID="btnCatReg" class="btn submit" OnClick="btnCatReg_OnClick" runat="server" Text="Register" />
                                    </asp:Panel>
                                </asp:Panel>
                            </form>
                        </article>
                    </div>
                    <div id="section3" class="section-w3ls">
                        <input type="radio" name="sections" id="option3">
                        <label for="option3" class="icon-left-w3pvt">
                            <span class="fa fa-lock" aria-hidden="true"></span>Forgot
              Password?</label>
                        <article>
                            <form action="#" method="post">
                                <h3 class="legend last">Reset Password</h3>
                                <p class="para-style">Enter your email address below and we'll send you an email with instructions.</p>

                                <div class="input">
                                    <span class="fa fa-envelope-o" aria-hidden="true"></span>
                                    <input type="email" id="txtForgotEmail" placeholder="Email" runat="server" name="email" />
                                </div>
                                <button type="submit" runat="server" class="btn submit last-btn">Reset Password</button>
                            </form>
                        </article>
                    </div>
                </div>
                <!-- //vertical tabs -->
                <div class="clear"></div>
            </div>
            <!---728x90--->
            <!-- copyright -->
            <div class="copyright">
                <h2>&copy; 2021 All rights reserved
                </h2>
            </div>
            <!-- //copyright -->
            <!---728x90--->
        </div>
    </form>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#btnCus').click(function () {
                $('#panelCus').css('display', 'block');
                $('#panelCat').css('display', 'none');
            });
            $('#btnCat').click(function () {
                $('#panelCus').css('display', 'none');
                $('#panelCat').css('display', 'block');
            });
            $('#btnCatNext').click(function () {
                $('#View1').css('display', 'none');
                $('#View2').css('display', 'block');
            });
        });
    </script>
</body>
</html>

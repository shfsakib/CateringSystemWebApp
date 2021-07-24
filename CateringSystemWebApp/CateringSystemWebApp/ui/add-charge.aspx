<%@ Page Title="" Language="C#" MasterPageFile="~/ui/dashboard.Master" AutoEventWireup="true" CodeBehind="add-charge.aspx.cs" Inherits="CateringSystemWebApp.ui.add_charge" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pd-ltr-20">
        <div class="card-box pd-20 height-100-p mb-10">
            <div class="row align-items-center pl-2">
                <h3>Add Monthly Charge</h3>
            </div>
        </div>
        <div class="card-box pd-20 height-100-p mb-30">
            <div class="row align-items-center">
                <div class="col-3"></div>
                <div class="col-12 col-lg-6">
                    <div class="row">
                        <div class="col-12">
                            <span>Catering Name</span>
                            <asp:DropDownList ID="ddlCatering" CssClass="form-control select2" runat="server"></asp:DropDownList>
                        </div>
                    </div> 
                    <div class="row">
                        <div class="col-12">
                            <span>Choose Month</span>
                            <asp:TextBox ID="txtMonth" AutoPostBack="True" OnTextChanged="txtMonth_OnTextChanged" autocomplete="off" class="form-control wd-100" TextMode="Month" runat="server"></asp:TextBox>
                        </div>
                    </div> 
                    <div class="row">
                        <div class="col-12">
                            <span>Bkash No. (Last 6 digit only)</span>
                            <asp:TextBox ID="txtBkash" autocomplete="off" class="form-control wd-100" MaxLength="6" placeholder="XXXXXX" TextMode="Number" runat="server"></asp:TextBox>
                        </div>
                    </div> 
                    <div class="row">
                        <div class="col-12">
                            <span>Transaction No.</span>
                            <asp:TextBox ID="txtTrans" autocomplete="off" class="form-control wd-100" placeholder="XXXXXX..." runat="server"></asp:TextBox>
                        </div>
                    </div> 
                     <div class="row">
                        <div class="col-12">
                            <span>Total Charge</span>
                            <asp:TextBox ID="txtTotal" ReadOnly="True" autocomplete="off" class="form-control wd-100" placeholder="XXXX" runat="server"></asp:TextBox>
                        </div>
                    </div> 
                    <div class="row">
                        <div class="col-12 mt-2">
                            <asp:Button ID="btnPay" runat="server" OnClick="btnPay_OnClick" class="btn btn-success" Text="Pay Monthly Charge" />
                        </div>
                    </div>
                </div>
                <div class="col-3"></div>
            </div>
        </div>
    </div>
</asp:Content>

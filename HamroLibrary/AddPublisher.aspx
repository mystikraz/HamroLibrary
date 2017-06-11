<%@ Page Title="Add Publisher" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddPublisher.aspx.cs" Inherits="HamroLibrary.AddPublisher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-10">
                <asp:Label ID="message" runat="server" CssClass="alert alert-failure" Text="" Visible="false"></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-md-10">
<div class="form-horizontal">
        <h4>Create a new Publisher</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
    <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="name" CssClass="col-md-2 control-label">First Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="name" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="name"
                    CssClass="text-danger" ErrorMessage="The Name field is required." />
            </div>
        </div>
     <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="contact" CssClass="col-md-2 control-label">contact</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="contact" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="contact"
                    CssClass="text-danger" ErrorMessage="The contact field is required." />
            </div>
        </div>
    <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="address" CssClass="col-md-2 control-label">address</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="address" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="address"
                    CssClass="text-danger" ErrorMessage="The address field is required." />
            </div>
        </div>
   
                  
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="btn_add" runat="server" Text="Add Publisher" CssClass="btn btn-default" OnClick="btn_add_Click" />
            </div>
        </div>
    </div>
            </div>
        </div>
    </div>
</asp:Content>

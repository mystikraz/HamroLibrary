<%@ Page Title="AddAuthor" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddAuthor.aspx.cs" Inherits="HamroLibrary.AddAuthor" %>
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
        <h4>Create a new Author</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
    <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="fname" CssClass="col-md-2 control-label">First Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="fname" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="fname"
                    CssClass="text-danger" ErrorMessage="The First name field is required." />
            </div>
        </div>
     <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="lname" CssClass="col-md-2 control-label">Last Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="lname" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="fname"
                    CssClass="text-danger" ErrorMessage="The Last name field is required." />
            </div>
        </div>
   
                  
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="btn_add" runat="server" Text="Add Author" CssClass="btn btn-default" OnClick="btn_add_Click" />
            </div>
        </div>
    </div>
            </div>
        </div>
    </div>
</asp:Content>

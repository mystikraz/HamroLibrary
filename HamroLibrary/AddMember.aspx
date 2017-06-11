<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddMember.aspx.cs" Inherits="HamroLibrary.AddMember" %>
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
        <h4>Create a new Member</h4>
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
            <asp:Label runat="server" AssociatedControlID="address" CssClass="col-md-2 control-label">Address</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="address" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="address"
                    CssClass="text-danger" ErrorMessage="The Address field is required." />
            </div>
        </div>
    <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="gender" CssClass="col-md-2 control-label">Gender</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="gender" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="gender"
                    CssClass="text-danger" ErrorMessage="The Gender field is required." />
            </div>
        </div>
     <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="dob" CssClass="col-md-2 control-label">DOB</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="dob" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="dob"
                    CssClass="text-danger" ErrorMessage="The DOB field is required." />
            </div>
        </div>
     <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="phone" CssClass="col-md-2 control-label">Phone</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="phone" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="phone"
                    CssClass="text-danger" ErrorMessage="The Phone field is required." />
            </div>
        </div>
     <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="mobile" CssClass="col-md-2 control-label">Mobile</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="mobile" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="mobile"
                    CssClass="text-danger" ErrorMessage="The Mobile field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
    <div class="form-group">
            
            <asp:Label runat="server" AssociatedControlID="Member_Type" CssClass="col-md-2 control-label">MemberType</asp:Label>
            <div class="col-md-10">
                <%--<asp:TextBox runat="server" ID="UserType" TextMode="SingleLine" CssClass="form-control" />--%>
                <asp:DropDownList ID="Member_Type" runat="server">
                <asp:ListItem Text="Select Member type" Value="0"></asp:ListItem>
                <asp:ListItem Text="Premium" Value="1"></asp:ListItem>
                <asp:ListItem Text="Normal" Value="2"></asp:ListItem>
                

            </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Member_Type"
                    CssClass="text-danger" ErrorMessage="The Member_Type field is required." />
            </div>
            
            
        </div>
    
               
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="btn_add" runat="server" Text="Add Member" CssClass="btn btn-default" OnClick="btn_add_Click" />
            </div>
        </div>
    </div>
            </div>
        </div>
    </div>
    
</asp:Content>

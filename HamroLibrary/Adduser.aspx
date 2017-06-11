<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Adduser.aspx.cs" Inherits="HamroLibrary.Adduser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="AddUserMessage" runat="server" Text="Label" Visible="false"></asp:Label>
    <br /><br />
    <div class="form-horizontal">
        <h4>Create a new User</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Name" CssClass="col-md-2 control-label">Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Name" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Name"
                    CssClass="text-danger" ErrorMessage="The Name field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>
        
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" TextMode="Email" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The Email field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Address" CssClass="col-md-2 control-label">Address</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Address" TextMode="SingleLine" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Address"
                    CssClass="text-danger" ErrorMessage="The Address field is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Mobile" CssClass="col-md-2 control-label">Mobile</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Mobile" TextMode="SingleLine" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Mobile"
                    CssClass="text-danger" ErrorMessage="The Mobile field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="DOB" CssClass="col-md-2 control-label">DOB</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="DOB" TextMode="SingleLine" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="DOB"
                    CssClass="text-danger" ErrorMessage="The DOB field is required." />
            </div>
        </div>
        <div class="form-group">
            
            <asp:Label runat="server" AssociatedControlID="UserType" CssClass="col-md-2 control-label">UserType</asp:Label>
            <div class="col-md-10">
                <%--<asp:TextBox runat="server" ID="UserType" TextMode="SingleLine" CssClass="form-control" />--%>
                <asp:DropDownList ID="UserType" runat="server">
                <asp:ListItem Text="Select User type" Value="0"></asp:ListItem>
                <asp:ListItem Text="AssistantManager" Value="1"></asp:ListItem>
                <asp:ListItem Text="Manager" Value="2"></asp:ListItem>
                <asp:ListItem Text="Normal" Value="3"></asp:ListItem>
                <asp:ListItem Text="Admin" Value="4"></asp:ListItem>

            </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserType"
                    CssClass="text-danger" ErrorMessage="The UserType field is required." />
            </div>
            
            
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="CreateUser" runat="server" Text="Create User" CssClass="btn btn-default" OnClick="CreateUser_Click" />
            </div>
        </div>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Editmember.aspx.cs" Inherits="HamroLibrary.Editmember" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new account</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="fname" CssClass="col-md-2 control-label">First Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="lblId" CssClass="form-control" TextMode="SingleLine" Visible="false" />
                <asp:TextBox runat="server" ID="fname" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="fname"
                    CssClass="text-danger" ErrorMessage="The first name field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="lname" CssClass="col-md-2 control-label">Last Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="lname" TextMode="SingleLine" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="lname"
                    CssClass="text-danger" ErrorMessage="The last name field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="address" CssClass="col-md-2 control-label">Address</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="address" TextMode="SingleLine" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="address"
                    CssClass="text-danger" ErrorMessage="The address field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="gender" CssClass="col-md-2 control-label">Gender</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="gender" TextMode="SingleLine" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="gender"
                    CssClass="text-danger" ErrorMessage="The gender field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="dob" CssClass="col-md-2 control-label">DOB</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="dob" TextMode="SingleLine" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="dob"
                    CssClass="text-danger" ErrorMessage="The dob field is required." />
            </div>
        </div>
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="phone" CssClass="col-md-2 control-label">phone</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="phone" TextMode="SingleLine" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="phone"
                    CssClass="text-danger" ErrorMessage="The phone field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="mobile" CssClass="col-md-2 control-label">mobile</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="mobile" TextMode="SingleLine" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="mobile"
                    CssClass="text-danger" ErrorMessage="The mobile field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="email" CssClass="col-md-2 control-label">email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="email" TextMode="email" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="email"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">UserName</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="UserName" TextMode="SingleLine" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                    CssClass="text-danger" ErrorMessage="The UserName field is required." />
            </div>
        </div>
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="MemberType" CssClass="col-md-2 control-label">MemberType</asp:Label>
                    <div class="col-md-10">
                        <%--<asp:TextBox runat="server" ID="UserType" TextMode="SingleLine" CssClass="form-control" />--%>
                        <asp:DropDownList ID="MemberType" runat="server">
                        <asp:ListItem Text="Select member type" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Gold" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Silver" Value="2"></asp:ListItem>
                    </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="MemberType"
                            CssClass="text-danger" ErrorMessage="The MemberType field is required." />
                    </div>
           </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="charge" CssClass="col-md-2 control-label">charge</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="charge" TextMode="SingleLine" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="charge"
                    CssClass="text-danger" ErrorMessage="The charge field is required." />
            </div>
            <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="totalLoans" CssClass="col-md-2 control-label">TotalLoans</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="totalLoans" TextMode="SingleLine" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="totalLoans"
                    CssClass="text-danger" ErrorMessage="The totalLoans field is required." />
            </div>
        </div>
         <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="member_Update" runat="server" Text="Update member" CssClass="btn btn-success" OnClick="member_Update_Click" />
                <asp:Button ID="member_delete" runat="server" Text="Delete member" CssClass="btn btn-danger" OnClick="member_delete_Click"  />
            </div>
        </div>
    </div>
</asp:Content>

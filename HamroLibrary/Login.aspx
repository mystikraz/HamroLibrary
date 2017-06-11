<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HamroLibrary.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hamro Library - Login</title>
    <webopt:bundlereference runat="server" path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
<h2>Logins</h2>

    <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <h4>Use a local account to log in.</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtUname" CssClass="col-md-2 control-label">UserName</asp:Label>
                        <div class="col-md-10">
                    <asp:TextBox ID="txtUname" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>

                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUname"
                                CssClass="text-danger" ErrorMessage="User name is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtPassword" CssClass="col-md-2 control-label">Password</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" CssClass="text-danger" ErrorMessage="The password field is required." />
                        </div>
                    </div>
                                        <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" ID="BtnlogIn" Text="Log in" CssClass="btn btn-default" OnClick="BtnlogIn_Click"/>
                        </div>
                    </div>
                </div>
                <p>
                    <a runat="server" href="~/Register">Register as a new user</a>
                </p>
                <p>
                    <%-- Enable this once you have account confirmation enabled for password reset functionality
                    <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Forgot your password?</asp:HyperLink>
                    --%>
                </p>
                <p>
                    <asp:Label ID="lblwarning" runat="server" Font-Bold="True" Font-Size="Larger" ForeColor="Red" Text="Label" Visible="False"></asp:Label>

                </p>
            </section>
        </div>

       
    </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:HamroLibraryDb %>" DeleteCommand="DELETE FROM [author] WHERE [Id] = @original_Id AND (([lname] = @original_lname) OR ([lname] IS NULL AND @original_lname IS NULL)) AND (([fname] = @original_fname) OR ([fname] IS NULL AND @original_fname IS NULL)) AND (([book_id] = @original_book_id) OR ([book_id] IS NULL AND @original_book_id IS NULL))" InsertCommand="INSERT INTO [author] ([Id], [lname], [fname], [book_id]) VALUES (@Id, @lname, @fname, @book_id)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [author]" UpdateCommand="UPDATE [author] SET [lname] = @lname, [fname] = @fname, [book_id] = @book_id WHERE [Id] = @original_Id AND (([lname] = @original_lname) OR ([lname] IS NULL AND @original_lname IS NULL)) AND (([fname] = @original_fname) OR ([fname] IS NULL AND @original_fname IS NULL)) AND (([book_id] = @original_book_id) OR ([book_id] IS NULL AND @original_book_id IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_lname" Type="String" />
                <asp:Parameter Name="original_fname" Type="String" />
                <asp:Parameter Name="original_book_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id" Type="Int32" />
                <asp:Parameter Name="lname" Type="String" />
                <asp:Parameter Name="fname" Type="String" />
                <asp:Parameter Name="book_id" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="lname" Type="String" />
                <asp:Parameter Name="fname" Type="String" />
                <asp:Parameter Name="book_id" Type="Int32" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_lname" Type="String" />
                <asp:Parameter Name="original_fname" Type="String" />
                <asp:Parameter Name="original_book_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>

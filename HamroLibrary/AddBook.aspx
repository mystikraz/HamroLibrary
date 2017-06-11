<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddBook.aspx.cs" Inherits="HamroLibrary.AddBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <asp:Label ID="message" runat="server" Text=""></asp:Label>
        <div class="row">
         <div class="col-xs-12 col-sm-4 col-md-4">
                            <div class="coverPlaceholder">
                                <img src="Content/images/placeholder.jpg" id="coverPreview" class="img-responsive" alt="Add an image" />
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <input type="file" name="cover" value="" id="inputImage" accept="image/*">
                                    <p class="help-block">Only jpg images</p>
                                </div>
                            </div>
                        </div>
         <div class="col-xs-12 col-sm-8 col-md-8">
                     <div class="form-group">
                    <asp:Label ID="lblTitle" runat="server" Text="Title" CssClass="control-label"></asp:Label>
                    <asp:TextBox ID="TextTitle" runat="server" CssClass="form-control"></asp:TextBox>
                         <asp:RequiredFieldValidator runat="server" ControlToValidate="TextTitle"
                    CssClass="text-danger" ErrorMessage="The Title field is required." />
                    </div>
                    <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="ISBN" CssClass="control-label"></asp:Label>
                    <asp:TextBox ID="TextIsbn" runat="server" CssClass="form-control"></asp:TextBox>
                         <asp:RequiredFieldValidator runat="server" ControlToValidate="TextIsbn"
                    CssClass="text-danger" ErrorMessage="The ISBN field is required." />
                    </div>
                    <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Quantity" CssClass="control-label"></asp:Label>
                    <asp:TextBox ID="TextQuantity" runat="server" CssClass="form-control"></asp:TextBox>
                         <asp:RequiredFieldValidator runat="server" ControlToValidate="TextIsbn"
                    CssClass="text-danger" ErrorMessage="The ISBN field is required." />
                    </div>
                    
                    <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Shelf No." CssClass="control-label"></asp:Label>
                    <asp:TextBox ID="TextShelfNo" runat="server" CssClass="form-control"></asp:TextBox>
                         <asp:RequiredFieldValidator runat="server" ControlToValidate="TextIsbn"
                    CssClass="text-danger" ErrorMessage="The ISBN field is required." />
                    </div>
                    <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Published Date" CssClass="control-label"></asp:Label>
                    <asp:TextBox ID="TextPublishedDate" runat="server" CssClass="form-control"></asp:TextBox>
                         <asp:RequiredFieldValidator runat="server" ControlToValidate="TextPublishedDate"
                    CssClass="text-danger" ErrorMessage="The Published Date field is required." />
                    </div>
                    <div class="form-group">
                    <asp:Label ID="Label6" runat="server" Text="Edition" CssClass="control-label"></asp:Label>
                    <asp:TextBox ID="TextEdition" runat="server" CssClass="form-control"></asp:TextBox>
                         <asp:RequiredFieldValidator runat="server" ControlToValidate="TextEdition"
                    CssClass="text-danger" ErrorMessage="The Edition field is required." />
                    </div>
             <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Restriction_level" CssClass="control-label"></asp:Label>
                    <asp:TextBox ID="textRestriction_level" runat="server" CssClass="form-control"></asp:TextBox>
                  <asp:RequiredFieldValidator runat="server" ControlToValidate="textRestriction_level"
                    CssClass="text-danger" ErrorMessage="The Restriction_level field is required." />
                    </div>
                    <div class="form-group">
                    <asp:Label ID="Label7" runat="server" Text="Author_Id" CssClass="control-label"></asp:Label>
                    <asp:TextBox ID="TextAuthor" runat="server" CssClass="form-control"></asp:TextBox>
                         <asp:RequiredFieldValidator runat="server" ControlToValidate="TextAuthor"
                    CssClass="text-danger" ErrorMessage="The Author_Id field is required." />
                    </div>
             <div class="form-group">
                    <asp:Label ID="Label8" runat="server" Text="Publisher_Id" CssClass="control-label"></asp:Label>
                    <asp:TextBox ID="TextPublisher" runat="server" CssClass="form-control"></asp:TextBox>
                  <asp:RequiredFieldValidator runat="server" ControlToValidate="TextPublisher"
                    CssClass="text-danger" ErrorMessage="The Publisher_Id field is required." />
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <div class="pull-left">
                        <asp:Button ID="SaveBtn" CssClass="btn btn-primary" runat="server" Text="Save" OnClick="SaveBtn_Click" />
                        <asp:Button ID="ResetBtn" CssClass="btn btn-default" runat="server" Text="Reset" OnClick="ResetBtn_Click" />

                            </div>
                            

                        </div>
                    </div>

    </div>
    
    </div>
    </div>
     
</asp:Content>

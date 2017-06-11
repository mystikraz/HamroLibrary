<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HamroLibrary._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <%--<h1 id="welcomeText" runat="server">Welcome to Hamro Library</h1>--%>
        <h3>Please search your books here!</h3><br /><br />
    <div class="row">
        <div class="col-md-10">
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txt_search" CssClass="text-danger" ErrorMessage="Please enter book name" />
        <asp:Label ID="search_error" runat="server" Text="Label" CssClass="alert alert-danger paddingtopbtm" Visible="false"></asp:Label>

        <asp:TextBox ID="txt_search" runat="server" CssClass="form-control1"></asp:TextBox>
        <asp:Button ID="btn_search" runat="server" Text="Search Books" CssClass="btn btn-default" OnClick="btn_search_Click" />
        </div>
    </div>
    <div class="jumbotron">
       
        
        <div class="row">
            <div class="col-md-10">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table" DataKeyNames="Id" OnRowDataBound="GridView1_RowDataBound">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="qty" HeaderText="qty" SortExpression="qty" />
                        <asp:BoundField DataField="shelfno" HeaderText="shelfno" SortExpression="shelfno" />
                        <asp:BoundField DataField="restriction_level" HeaderText="restriction_level" SortExpression="restriction_level" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HamroLibraryDb %>" SelectCommand="SELECT [name], [Id], [qty], [shelfno], [restriction_level] FROM [book]"></asp:SqlDataSource>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
        <asp:PlaceHolder ID="PlaceHolderSearch" runat="server"></asp:PlaceHolder>
        <br />
        <table id="search_table" class="table" runat="server" visible="false">
            <tr>
                <td><asp:TextBox ID="txt_id" runat="server"></asp:TextBox></td>
                <td><asp:TextBox ID="txt_title" runat="server"></asp:TextBox></td>
                <td><asp:TextBox ID="txt_author" runat="server"></asp:TextBox></td>
                <td><asp:Button ID="btn_delete" runat="server" Text="edit" /></td>

            </tr>
        </table>
      
    </div>
        
    </div>
    
    
</asp:Content>

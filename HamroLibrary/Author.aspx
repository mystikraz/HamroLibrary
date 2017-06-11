<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Author.aspx.cs" Inherits="HamroLibrary.Author" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-10">
                <asp:Label ID="alertMessage" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-md-10">
    <asp:Button ID="AddNewAuthor" runat="server" CssClass="btn btn-success" Text="Add New Author" OnClick="AddNewAuthor_Click"/>

            </div>
        </div>
        <br /><br />
        <div class="row">
            <div class="col-md-10">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="lname" HeaderText="lname" SortExpression="lname" />
                        <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:HamroLibraryDb %>" DeleteCommand="DELETE FROM [author] WHERE [Id] = @original_Id AND (([lname] = @original_lname) OR ([lname] IS NULL AND @original_lname IS NULL)) AND (([fname] = @original_fname) OR ([fname] IS NULL AND @original_fname IS NULL))" InsertCommand="INSERT INTO [author] ([Id], [lname], [fname]) VALUES (@Id, @lname, @fname)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [author]" UpdateCommand="UPDATE [author] SET [lname] = @lname, [fname] = @fname WHERE [Id] = @original_Id AND (([lname] = @original_lname) OR ([lname] IS NULL AND @original_lname IS NULL)) AND (([fname] = @original_fname) OR ([fname] IS NULL AND @original_fname IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_lname" Type="String" />
                        <asp:Parameter Name="original_fname" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                        <asp:Parameter Name="lname" Type="String" />
                        <asp:Parameter Name="fname" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="lname" Type="String" />
                        <asp:Parameter Name="fname" Type="String" />
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_lname" Type="String" />
                        <asp:Parameter Name="original_fname" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Book.aspx.cs" Inherits="HamroLibrary.Book" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-10">
    <asp:Button ID="AddNew" runat="server" CssClass="btn btn-success" Text="Add New Book" OnClick="AddNew_Click" />
    <asp:Button ID="CheckOldBooks" runat="server" CssClass="btn btn-success" Text="Check Old Books" OnClick="CheckOldBooks_Click" />
    <asp:Button ID="BookWithoutLoan" runat="server" CssClass="btn btn-success" Text="Check Books without Loan" OnClick="BookWithoutLoan_Click" />

            </div>
        </div><br /><br />
        <div class="row">
            <div class="col-md-10">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="isbn" HeaderText="isbn" SortExpression="isbn" />
                        <asp:BoundField DataField="qty" HeaderText="qty" SortExpression="qty" />
                        <asp:BoundField DataField="shelfno" HeaderText="shelfno" SortExpression="shelfno" />
                        <asp:BoundField DataField="published_date" HeaderText="published_date" SortExpression="published_date" />
                        <asp:BoundField DataField="edition" HeaderText="edition" SortExpression="edition" />
                        <asp:BoundField DataField="author_id" HeaderText="author_id" SortExpression="author_id" />
                        <asp:BoundField DataField="restriction_level" HeaderText="restriction_level" SortExpression="restriction_level" />
                        <asp:BoundField DataField="publisher_id" HeaderText="publisher_id" SortExpression="publisher_id" />
                    </Columns>
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:HamroLibraryDb %>" DeleteCommand="DELETE FROM [book] WHERE [Id] = @original_Id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([isbn] = @original_isbn) OR ([isbn] IS NULL AND @original_isbn IS NULL)) AND (([qty] = @original_qty) OR ([qty] IS NULL AND @original_qty IS NULL)) AND (([shelfno] = @original_shelfno) OR ([shelfno] IS NULL AND @original_shelfno IS NULL)) AND (([published_date] = @original_published_date) OR ([published_date] IS NULL AND @original_published_date IS NULL)) AND (([edition] = @original_edition) OR ([edition] IS NULL AND @original_edition IS NULL)) AND (([author_id] = @original_author_id) OR ([author_id] IS NULL AND @original_author_id IS NULL)) AND (([restriction_level] = @original_restriction_level) OR ([restriction_level] IS NULL AND @original_restriction_level IS NULL)) AND (([publisher_id] = @original_publisher_id) OR ([publisher_id] IS NULL AND @original_publisher_id IS NULL))" InsertCommand="INSERT INTO [book] ([name], [isbn], [qty], [shelfno], [published_date], [edition], [author_id], [restriction_level], [publisher_id]) VALUES (@name, @isbn, @qty, @shelfno, @published_date, @edition, @author_id, @restriction_level, @publisher_id)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [book]" UpdateCommand="UPDATE [book] SET [name] = @name, [isbn] = @isbn, [qty] = @qty, [shelfno] = @shelfno, [published_date] = @published_date, [edition] = @edition, [author_id] = @author_id, [restriction_level] = @restriction_level, [publisher_id] = @publisher_id WHERE [Id] = @original_Id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([isbn] = @original_isbn) OR ([isbn] IS NULL AND @original_isbn IS NULL)) AND (([qty] = @original_qty) OR ([qty] IS NULL AND @original_qty IS NULL)) AND (([shelfno] = @original_shelfno) OR ([shelfno] IS NULL AND @original_shelfno IS NULL)) AND (([published_date] = @original_published_date) OR ([published_date] IS NULL AND @original_published_date IS NULL)) AND (([edition] = @original_edition) OR ([edition] IS NULL AND @original_edition IS NULL)) AND (([author_id] = @original_author_id) OR ([author_id] IS NULL AND @original_author_id IS NULL)) AND (([restriction_level] = @original_restriction_level) OR ([restriction_level] IS NULL AND @original_restriction_level IS NULL)) AND (([publisher_id] = @original_publisher_id) OR ([publisher_id] IS NULL AND @original_publisher_id IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_name" Type="String" />
                        <asp:Parameter Name="original_isbn" Type="Decimal" />
                        <asp:Parameter Name="original_qty" Type="Decimal" />
                        <asp:Parameter Name="original_shelfno" Type="String" />
                        <asp:Parameter Name="original_published_date" Type="DateTime" />
                        <asp:Parameter Name="original_edition" Type="String" />
                        <asp:Parameter Name="original_author_id" Type="Int32" />
                        <asp:Parameter Name="original_restriction_level" Type="String" />
                        <asp:Parameter Name="original_publisher_id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="isbn" Type="Decimal" />
                        <asp:Parameter Name="qty" Type="Decimal" />
                        <asp:Parameter Name="shelfno" Type="String" />
                        <asp:Parameter Name="published_date" Type="DateTime" />
                        <asp:Parameter Name="edition" Type="String" />
                        <asp:Parameter Name="author_id" Type="Int32" />
                        <asp:Parameter Name="restriction_level" Type="String" />
                        <asp:Parameter Name="publisher_id" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="isbn" Type="Decimal" />
                        <asp:Parameter Name="qty" Type="Decimal" />
                        <asp:Parameter Name="shelfno" Type="String" />
                        <asp:Parameter Name="published_date" Type="DateTime" />
                        <asp:Parameter Name="edition" Type="String" />
                        <asp:Parameter Name="author_id" Type="Int32" />
                        <asp:Parameter Name="restriction_level" Type="String" />
                        <asp:Parameter Name="publisher_id" Type="Int32" />
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_name" Type="String" />
                        <asp:Parameter Name="original_isbn" Type="Decimal" />
                        <asp:Parameter Name="original_qty" Type="Decimal" />
                        <asp:Parameter Name="original_shelfno" Type="String" />
                        <asp:Parameter Name="original_published_date" Type="DateTime" />
                        <asp:Parameter Name="original_edition" Type="String" />
                        <asp:Parameter Name="original_author_id" Type="Int32" />
                        <asp:Parameter Name="original_restriction_level" Type="String" />
                        <asp:Parameter Name="original_publisher_id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </div>
        </div>
    </div>   
    <div class="row">
        <asp:PlaceHolder ID="PlaceHolderBook" runat="server"></asp:PlaceHolder>
    </div>
  
   
   
</asp:Content>

<%@ Page Title="Publisher" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Publisher.aspx.cs" Inherits="HamroLibrary.Publisher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-10">
                <asp:Label ID="alertMessage" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-md-10">
    <asp:Button ID="AddNewPublisher" runat="server" CssClass="btn btn-success" Text="Add New Publisher" OnClick="AddNewPublisher_Click"/>

            </div>
        </div>
        <br /><br />
        <div class="row">
            <div class="col-md-10">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" InsertVisible="False" />
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="contact" HeaderText="contact" SortExpression="contact" />
                        <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:HamroLibraryDb %>" DeleteCommand="DELETE FROM [publisher] WHERE [Id] = @original_Id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([contact] = @original_contact) OR ([contact] IS NULL AND @original_contact IS NULL)) AND (([address] = @original_address) OR ([address] IS NULL AND @original_address IS NULL))" InsertCommand="INSERT INTO [publisher] ([name], [contact], [address]) VALUES (@name, @contact, @address)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [publisher]" UpdateCommand="UPDATE [publisher] SET [name] = @name, [contact] = @contact, [address] = @address WHERE [Id] = @original_Id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([contact] = @original_contact) OR ([contact] IS NULL AND @original_contact IS NULL)) AND (([address] = @original_address) OR ([address] IS NULL AND @original_address IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_name" Type="String" />
                        <asp:Parameter Name="original_contact" Type="String" />
                        <asp:Parameter Name="original_address" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="contact" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="contact" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_name" Type="String" />
                        <asp:Parameter Name="original_contact" Type="String" />
                        <asp:Parameter Name="original_address" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>

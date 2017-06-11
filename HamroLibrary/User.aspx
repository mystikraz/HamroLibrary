<%@ Page Title="User" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="HamroLibrary.User" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Button ID="AddUser" CssClass="btn btn-primary pull-right" runat="server" Text="Add New User" OnClick="AddUser_Click" /><br /><br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table" DataKeyNames="id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
            <%--<asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />--%>
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
            <asp:BoundField DataField="mobile" HeaderText="mobile" SortExpression="mobile" />
            <asp:BoundField DataField="dob" HeaderText="dob" SortExpression="dob" />
            <asp:BoundField DataField="created_at" HeaderText="created_at" SortExpression="created_at" />
            <asp:BoundField DataField="update_at" HeaderText="update_at" SortExpression="update_at" />
            <asp:BoundField DataField="user_type" HeaderText="user_type" SortExpression="user_type" />
            
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:HamroLibraryDb %>" DeleteCommand="DELETE FROM [user] WHERE [id] = @original_id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([address] = @original_address) OR ([address] IS NULL AND @original_address IS NULL)) AND (([mobile] = @original_mobile) OR ([mobile] IS NULL AND @original_mobile IS NULL)) AND (([dob] = @original_dob) OR ([dob] IS NULL AND @original_dob IS NULL)) AND (([created_at] = @original_created_at) OR ([created_at] IS NULL AND @original_created_at IS NULL)) AND (([update_at] = @original_update_at) OR ([update_at] IS NULL AND @original_update_at IS NULL)) AND (([user_type] = @original_user_type) OR ([user_type] IS NULL AND @original_user_type IS NULL))" InsertCommand="INSERT INTO [user] ([name], [email], [address], [mobile], [dob], [created_at], [update_at], [user_type]) VALUES (@name, @email, @address, @mobile, @dob, @created_at, @update_at, @user_type)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [user]" UpdateCommand="UPDATE [user] SET [name] = @name, [email] = @email, [address] = @address, [mobile] = @mobile, [dob] = @dob, [created_at] = @created_at, [update_at] = @update_at, [user_type] = @user_type WHERE [id] = @original_id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([address] = @original_address) OR ([address] IS NULL AND @original_address IS NULL)) AND (([mobile] = @original_mobile) OR ([mobile] IS NULL AND @original_mobile IS NULL)) AND (([dob] = @original_dob) OR ([dob] IS NULL AND @original_dob IS NULL)) AND (([created_at] = @original_created_at) OR ([created_at] IS NULL AND @original_created_at IS NULL)) AND (([update_at] = @original_update_at) OR ([update_at] IS NULL AND @original_update_at IS NULL)) AND (([user_type] = @original_user_type) OR ([user_type] IS NULL AND @original_user_type IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_name" Type="String" />
            <%--<asp:Parameter Name="original_password" Type="String" />--%> 
            <asp:Parameter Name="original_email" Type="String" />
            <asp:Parameter Name="original_address" Type="String" />
            <asp:Parameter Name="original_mobile" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="original_dob" />
            <asp:Parameter Name="original_created_at" Type="DateTime" />
            <asp:Parameter Name="original_update_at" Type="DateTime" />
            <asp:Parameter Name="original_user_type" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <%--<asp:Parameter Name="password" Type="String" />--%>
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="mobile" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="dob" />
            <asp:Parameter Name="created_at" Type="DateTime" />
            <asp:Parameter Name="update_at" Type="DateTime" />
            <asp:Parameter Name="user_type" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <%--<asp:Parameter Name="password" Type="String" />--%>
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="mobile" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="dob" />
            <asp:Parameter Name="created_at" Type="DateTime" />
            <asp:Parameter Name="update_at" Type="DateTime" />
            <asp:Parameter Name="user_type" Type="String" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_name" Type="String" />
            <%--<asp:Parameter Name="original_password" Type="String" />--%>
            <asp:Parameter Name="original_email" Type="String" />
            <asp:Parameter Name="original_address" Type="String" />
            <asp:Parameter Name="original_mobile" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="original_dob" />
            <asp:Parameter Name="original_created_at" Type="DateTime" />
            <asp:Parameter Name="original_update_at" Type="DateTime" />
            <asp:Parameter Name="original_user_type" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
</asp:Content>

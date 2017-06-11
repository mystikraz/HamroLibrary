<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="HamroLibrary.Member" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
       
        <div class="row">
            <div class="col-md-10">
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" Text="Add New member" OnClick="AddMember_Click" />
            <asp:Button ID="MemberWithoutLoan" runat="server" CssClass="btn btn-success" Text="Check Members Without Loans" OnClick="MemberWithoutLoan_Click" />

            </div>
         </div>
         
        <br /><br />
        <div class="row">
            <div class="col-md-5">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table" DataKeyNames="Id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
            <asp:BoundField DataField="lname" HeaderText="lname" SortExpression="lname" />
            <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
            <asp:BoundField DataField="gender" HeaderText="gender" SortExpression="gender" />
            <asp:BoundField DataField="dob" HeaderText="dob" SortExpression="dob" />
            <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
            <asp:BoundField DataField="mobile" HeaderText="mobile" SortExpression="mobile" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:BoundField DataField="m_type" HeaderText="m_type" SortExpression="m_type" />
        </Columns>
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:HamroLibraryDb %>" DeleteCommand="DELETE FROM [member] WHERE [Id] = @original_Id AND (([fname] = @original_fname) OR ([fname] IS NULL AND @original_fname IS NULL)) AND (([lname] = @original_lname) OR ([lname] IS NULL AND @original_lname IS NULL)) AND (([address] = @original_address) OR ([address] IS NULL AND @original_address IS NULL)) AND (([gender] = @original_gender) OR ([gender] IS NULL AND @original_gender IS NULL)) AND (([dob] = @original_dob) OR ([dob] IS NULL AND @original_dob IS NULL)) AND (([phone] = @original_phone) OR ([phone] IS NULL AND @original_phone IS NULL)) AND (([mobile] = @original_mobile) OR ([mobile] IS NULL AND @original_mobile IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([m_type] = @original_m_type) OR ([m_type] IS NULL AND @original_m_type IS NULL))" InsertCommand="INSERT INTO [member] ([fname], [lname], [address], [gender], [dob], [phone], [mobile], [email], [m_type]) VALUES (@fname, @lname, @address, @gender, @dob, @phone, @mobile, @email, @m_type)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [member]" UpdateCommand="UPDATE [member] SET [fname] = @fname, [lname] = @lname, [address] = @address, [gender] = @gender, [dob] = @dob, [phone] = @phone, [mobile] = @mobile, [email] = @email, [m_type] = @m_type WHERE [Id] = @original_Id AND (([fname] = @original_fname) OR ([fname] IS NULL AND @original_fname IS NULL)) AND (([lname] = @original_lname) OR ([lname] IS NULL AND @original_lname IS NULL)) AND (([address] = @original_address) OR ([address] IS NULL AND @original_address IS NULL)) AND (([gender] = @original_gender) OR ([gender] IS NULL AND @original_gender IS NULL)) AND (([dob] = @original_dob) OR ([dob] IS NULL AND @original_dob IS NULL)) AND (([phone] = @original_phone) OR ([phone] IS NULL AND @original_phone IS NULL)) AND (([mobile] = @original_mobile) OR ([mobile] IS NULL AND @original_mobile IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([m_type] = @original_m_type) OR ([m_type] IS NULL AND @original_m_type IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_fname" Type="String" />
                        <asp:Parameter Name="original_lname" Type="String" />
                        <asp:Parameter Name="original_address" Type="String" />
                        <asp:Parameter Name="original_gender" Type="String" />
                        <asp:Parameter Name="original_dob" Type="DateTime" />
                        <asp:Parameter Name="original_phone" Type="Decimal" />
                        <asp:Parameter Name="original_mobile" Type="Decimal" />
                        <asp:Parameter Name="original_email" Type="String" />
                        <asp:Parameter Name="original_m_type" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="fname" Type="String" />
                        <asp:Parameter Name="lname" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                        <asp:Parameter Name="gender" Type="String" />
                        <asp:Parameter Name="dob" Type="DateTime" />
                        <asp:Parameter Name="phone" Type="Decimal" />
                        <asp:Parameter Name="mobile" Type="Decimal" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="m_type" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="fname" Type="String" />
                        <asp:Parameter Name="lname" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                        <asp:Parameter Name="gender" Type="String" />
                        <asp:Parameter Name="dob" Type="DateTime" />
                        <asp:Parameter Name="phone" Type="Decimal" />
                        <asp:Parameter Name="mobile" Type="Decimal" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="m_type" Type="String" />
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_fname" Type="String" />
                        <asp:Parameter Name="original_lname" Type="String" />
                        <asp:Parameter Name="original_address" Type="String" />
                        <asp:Parameter Name="original_gender" Type="String" />
                        <asp:Parameter Name="original_dob" Type="DateTime" />
                        <asp:Parameter Name="original_phone" Type="Decimal" />
                        <asp:Parameter Name="original_mobile" Type="Decimal" />
                        <asp:Parameter Name="original_email" Type="String" />
                        <asp:Parameter Name="original_m_type" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </div>
        </div>
    </div>
</asp:Content>

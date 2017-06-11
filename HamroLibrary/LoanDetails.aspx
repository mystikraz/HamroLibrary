<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoanDetails.aspx.cs" Inherits="HamroLibrary.LoanDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-10">
    <asp:Button ID="AddNewRenter" runat="server" CssClass="btn btn-success" Text="Add New Renter" OnClick="AddNewRenter_Click"/>
                <asp:Label ID="lblMesage1" runat="server" Text=""></asp:Label>
                <asp:Label ID="lblMesage" runat="server" Text=""></asp:Label>
            </div>
            <br /><br />
        </div>
        <div class="row">
        <div class="col-md-10">
            <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="txt_search" CssClass="text-danger" ErrorMessage="Please enter book name" />--%>
            <asp:Label ID="search_error" runat="server" Text="Label" CssClass="alert alert-danger paddingtopbtm" Visible="false"></asp:Label>

            <asp:TextBox ID="txt_search" runat="server" CssClass="form-control1"></asp:TextBox>
            <asp:Button ID="btn_search_member" runat="server" Text="Search Member" CssClass="btn btn-default" OnClick="btn_search_member_Click"/>
            </div>
        </div>
        <div class="row">
            <div class="col-md-10">
                <h3>Books currently on Loan</h3>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table" DataKeyNames="Id" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
        <Columns>
            <%--<asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Renter" HeaderText="Renter" ReadOnly="True" SortExpression="Renter" />
            <asp:BoundField DataField="BookTitle" HeaderText="BookTitle" SortExpression="BookTitle" />
            <asp:BoundField DataField="due_date" HeaderText="due_date" SortExpression="due_date" />
            <asp:BoundField DataField="m_type" HeaderText="m_type" SortExpression="m_type" />
            <asp:BoundField DataField="return_id" HeaderText="return_id" SortExpression="return_id" />
            <asp:CommandField ShowEditButton="true" />
            <asp:CommandField ShowDeleteButton="true" />--%>

             <asp:TemplateField HeaderText="Issue ID">
                        <ItemTemplate>
                            <asp:Label ID="lblID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Id") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>           
                            <asp:Label ID="lblEditID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Id") %>'></asp:Label>           
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddID" runat="server" ></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
             <asp:TemplateField HeaderText="Member ID">

             <ItemTemplate>
                            <asp:Label ID="lblMId" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "mId") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>           
                            <asp:Label ID="lblEditMId" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "mId") %>'></asp:Label>           
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddMId" runat="server" ></asp:TextBox>
                        </FooterTemplate>
             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="MemberName">
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Renter") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>           
                            <asp:TextBox ID="txtEditName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Renter") %>'></asp:TextBox>           
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddName" runat="server" ></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
            <asp:TemplateField HeaderText="Book Id">
                        <ItemTemplate>
                            <asp:Label ID="lblBookId" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "BookId") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>           
                            <asp:TextBox ID="txtEditBookId" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "BookId") %>'></asp:TextBox>           
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddBookId" runat="server" ></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
            <asp:TemplateField HeaderText="Book TItle">
                        <ItemTemplate>
                            <asp:Label ID="lblTitle" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "BookTitle") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>           
                            <asp:TextBox ID="txtEditTitle" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "BookTitle") %>'></asp:TextBox>           
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddTitle" runat="server" ></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
            <asp:TemplateField HeaderText="Issue Date">
                        <ItemTemplate>
                            <asp:Label ID="lblissue_date" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "issue_date") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>           
                            <asp:TextBox ID="txtEditissue_date" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "issue_date") %>'></asp:TextBox>           
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddissue_date" runat="server" ></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
             <asp:TemplateField HeaderText="Due Date">
                        <ItemTemplate>
                            <asp:Label ID="lbldue_date" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "due_date") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>           
                            <asp:TextBox ID="txtEditdue_date" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "due_date") %>'></asp:TextBox>           
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAdddue_date" runat="server" ></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
            <asp:TemplateField HeaderText="Member Type">
                        <ItemTemplate>
                            <asp:Label ID="lblm_type" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "m_type") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>           
                            <asp:TextBox ID="txtEditm_type" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "m_type") %>'></asp:TextBox>           
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddm_type" runat="server" ></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
             <asp:TemplateField HeaderText="Return Status">
                        <ItemTemplate>
                            <asp:Label ID="lblreturn_id" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "return_id") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>           
                            <asp:TextBox ID="txtEditreturn_id" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "return_id") %>'></asp:TextBox>           
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddreturn_id" runat="server" ></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
             <asp:TemplateField HeaderText="Return Date">
                        <ItemTemplate>
                            <asp:Label ID="lblreturnDate" runat="server" Text=''></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>           
                            <asp:TextBox ID="txtreturnDate" runat="server" Text=''></asp:TextBox>           
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddreturnDate" runat="server" ></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="true" DeleteText="Return Book" />
        </Columns>
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HamroLibraryDb %>" SelectCommand="SELECT member.Id, { fn CONCAT(member.fname, member.lname) } AS Renter, book.name AS BookTitle, Loan_Issue.due_date, member.m_type, Loan_Issue.return_id FROM book INNER JOIN Loan_Issue ON book.Id = Loan_Issue.book_id INNER JOIN member ON Loan_Issue.m_id = member.Id" ></asp:SqlDataSource>

            </div>
        </div>
    </div>
</asp:Content>

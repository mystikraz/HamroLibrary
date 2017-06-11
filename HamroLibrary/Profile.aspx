<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="HamroLibrary.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table" DataKeyNames="Id" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit"  OnRowUpdating="GridView1_RowUpdating" OnPageIndexChanging="GridView1_PageIndexChanging">
        <Columns>
             <asp:TemplateField HeaderText="ID">
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
             <asp:TemplateField HeaderText="Member Name">

             <ItemTemplate>
                            <asp:Label ID="lblname" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>           
                            <asp:Label ID="lblEditname" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "name") %>'></asp:Label>           
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddname" runat="server" ></asp:TextBox>
                        </FooterTemplate>
             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Password">
                        <ItemTemplate>
                            <asp:Label ID="lblPassword" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "password") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>           
                            <asp:TextBox ID="txtEditPassword" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "password") %>'></asp:TextBox>           
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddPassword" runat="server" ></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
            <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label ID="lblEmail" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Email") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>           
                            <asp:TextBox ID="txtEditEmail" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Email") %>'></asp:TextBox>           
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddEmail" runat="server" ></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
            <asp:TemplateField HeaderText="Address">
                        <ItemTemplate>
                            <asp:Label ID="lblAddress" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Address") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>           
                            <asp:TextBox ID="txtEditAddress" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Address") %>'></asp:TextBox>           
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddAddress" runat="server" ></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
            <asp:TemplateField HeaderText="Mobile">
                        <ItemTemplate>
                            <asp:Label ID="lblMobile" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "mobile") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>           
                            <asp:TextBox ID="txtEditMobile" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "mobile") %>'></asp:TextBox>           
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddMobile" runat="server" ></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
             <asp:TemplateField HeaderText="dob">
                        <ItemTemplate>
                            <asp:Label ID="lbldob" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "dob") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>           
                            <asp:TextBox ID="txtEditdob" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "dob") %>'></asp:TextBox>           
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAdddob" runat="server" ></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
           
            <asp:CommandField ShowEditButton="true" EditText="Edit User" />
        </Columns>
                </asp:GridView>
</asp:Content>

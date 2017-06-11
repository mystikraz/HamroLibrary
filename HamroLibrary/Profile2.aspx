<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile2.aspx.cs" Inherits="HamroLibrary.Profile2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table" DataKeyNames="Id" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating">
        <Columns>
           
             <asp:TemplateField HeaderText="Member ID">

             <ItemTemplate>
                            <asp:Label ID="lblMId" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Id") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>           
                            <asp:Label ID="lblEditMId" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Id") %>'></asp:Label>           
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddMId" runat="server" ></asp:TextBox>
                        </FooterTemplate>
             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="user Name">
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>           
                            <asp:TextBox ID="txtEditName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "name") %>'></asp:TextBox>           
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddName" runat="server" ></asp:TextBox>
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
            <asp:CommandField ShowEditButton="true" EditText="Edit Password" />
        </Columns>
                </asp:GridView>
</asp:Content>

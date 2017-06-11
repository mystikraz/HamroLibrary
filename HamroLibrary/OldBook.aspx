<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OldBook.aspx.cs" Inherits="HamroLibrary.OldBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>List of books older than 1 year</h3>
                <asp:Label ID="lblMesage" runat="server" Text=""></asp:Label>

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table" DataKeyNames="Id" OnRowDeleting="GridView1_RowDeleting">
        <Columns>
            
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
             <asp:TemplateField HeaderText="Name">

             <ItemTemplate>
                            <asp:Label ID="lblname" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "BookTitle") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>           
                            <asp:Label ID="lblEditname" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "BookTitle") %>'></asp:Label>           
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddname" runat="server" ></asp:TextBox>
                        </FooterTemplate>
             </asp:TemplateField>
 
            <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:Label ID="lblQty" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "AvailableStock") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>           
                            <asp:TextBox ID="txtEditQty" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "AvailableStock") %>'></asp:TextBox>           
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddQty" runat="server" ></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
            <asp:TemplateField HeaderText="Published_date">
                        <ItemTemplate>
                            <asp:Label ID="lblPublished_date" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "published_date") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>           
                            <asp:TextBox ID="txtEditPublished_date" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "published_date") %>'></asp:TextBox>           
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddPublished_date" runat="server" ></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
           
            <asp:CommandField ShowDeleteButton="true" />
        </Columns>
                </asp:GridView>
</asp:Content>

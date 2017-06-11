<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookWithoutLoan.aspx.cs" Inherits="HamroLibrary.BookWithoutLoan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="text-success"">List of Books Not in Loan for last 31 days</h3>
    <asp:GridView ID="GridView1" runat="server" CssClass="table"></asp:GridView>
    
</asp:Content>

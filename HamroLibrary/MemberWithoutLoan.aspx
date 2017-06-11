<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MemberWithoutLoan.aspx.cs" Inherits="HamroLibrary.MemberWithoutLoan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="text-success"">List of Member who hasn't taken loan since last 31 days</h3>
    <asp:GridView ID="GridView1" runat="server" CssClass="table"></asp:GridView>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Loan.aspx.cs" Inherits="HamroLibrary.Loan1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                 <div class="form-group">
                    <asp:Label ID="lblInfo" runat="server" Text="" CssClass="alert alert-danger" Visible="false"></asp:Label>
                        <asp:Label ID="lblMoreInfo" runat="server" Text="" CssClass="alert alert-success" Visible="false"></asp:Label>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
            
                    <asp:Label runat="server" AssociatedControlID="book" CssClass="col-md-2 control-label">Book</asp:Label>
                     <div class="col-md-10">
                         <asp:DropDownList ID="book" runat="server" CssClass="form-control" DataSourceID="BookDbSource" DataTextField="name" DataValueField="Id">
                        </asp:DropDownList>
                          <asp:RequiredFieldValidator runat="server" ControlToValidate="book"
                             CssClass="text-danger" ErrorMessage="The Book field is required." />
                      </div>
                  </div>
                <div class="form-group">
            
                        <asp:Label runat="server" AssociatedControlID="member" CssClass="col-md-2 control-label">Renter with their member Ids</asp:Label>
                     <div class="col-md-10">
                         <asp:DropDownList ID="member" OnSelectedIndexChanged="CheckCount_Click" OnDataBound="CheckCount_Click" AutoPostBack="True" runat="server" CssClass="form-control" DataSourceID="MemberDbSource" DataTextField="name" DataValueField="Id">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="member"
                            CssClass="text-danger" ErrorMessage="The member field is required." />
                     </div>
    
                 </div>
                 <div class="form-group">
                     <asp:Label runat="server" AssociatedControlID="PreviousBook" CssClass="col-md-2 control-label">Previous book Taken</asp:Label>
                     <div class="col-md-10">
                       <asp:Label ID="PreviousBook" OnInit="Page_Load" runat="server" Width="30" style="text-align:center;"></asp:Label>
                         
                    </div>
                    
                 </div>
               
                  <div class="form-group paddingtopbtm160">
            <asp:Label ID="Label1" Runat="server" Visible="false" />
                   <asp:Label ID="lblCalValidator1" Runat="server" Visible="false" />

                        <asp:Label runat="server" AssociatedControlID="issue_date" CssClass="col-md-2 control-label">Issue Date</asp:Label>
                     <div class="col-md-10">
                         <asp:Calendar ID="issue_date" runat="server"></asp:Calendar>
                        
                     </div>
    
                 </div>
                <div class="form-group paddingtopbtm40">
                   <asp:Label ID="lblCalValidator2" Runat="server" Visible="false" />
            
                        <asp:Label runat="server" AssociatedControlID="due_date" CssClass="col-md-2 control-label">Due Date</asp:Label>
                     <div class="col-md-10">
                         <asp:Calendar ID="due_date" runat="server"></asp:Calendar>
                         
                     </div>
    
                 </div>
                  
                <div class="form-group paddingtopbtm40">
                     <div class="col-md-offset-2 col-md-10">
                         <asp:Button ID="IssueBook" runat="server" Text="Issue Book" CssClass="btn btn-primary" OnClick="IssueBook_Click" />
                     </div>
                </div>
               
            </div>
        </div>
    </div>
          <asp:SqlDataSource ID="BookDbSource" runat="server" ConnectionString="<%$ ConnectionStrings:HamroLibraryDb %>" SelectCommand="SELECT * FROM [book]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="MemberDbSource" runat="server" ConnectionString="<%$ ConnectionStrings:HamroLibraryDb %>" SelectCommand="SELECT CONCAT(fname +' ',lname+' ', Id) as name, Id FROM [member]"></asp:SqlDataSource>
</asp:Content>

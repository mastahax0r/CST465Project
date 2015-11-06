<%@ Page Language="C#" MasterPageFile="~/App_Master/BaseTemplate.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CST65Project.Customers.Login" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
    <title> Login yo pants.</title>
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderForm1" runat="server">
    <asp:Login MembershipProvider="SqlMembership" CreateUserText="Register" CreateUserUrl="~/Customers/Register.aspx" runat="server">

    </asp:Login>
</asp:Content>

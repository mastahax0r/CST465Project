<%@ Page Language="C#" MasterPageFile="~/App_Master/BaseTemplate.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CST65Project.Customers.Login" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
    <title> Register my disgust.</title>
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderForm1" runat="server">
    <asp:CreateUserWizard MembershipProvider="SqlMembership" ContinueDestinationPageUrl="~/Customers/Login.aspx" runat="server"></asp:CreateUserWizard>
</asp:Content>


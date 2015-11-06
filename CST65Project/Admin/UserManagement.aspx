<%@ Page Language="C#" MasterPageFile="~/App_Master/BaseTemplate.Master" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="CST65Project.Admin.UserManagement" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
    <title> Managers get 10% </title>
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderForm1" runat="server">

    <asp:Label AssociatedControlID="uxRolesLB" runat="server">How ya Roll:</asp:Label>
    <asp:ListBox ID="uxRolesLB" runat="server"></asp:ListBox>
    <br />
    <asp:Label AssociatedControlID="uxRoleTB" runat="server">Role Name:</asp:Label>
    <asp:TextBox ID="uxRoleTB" runat="server"></asp:TextBox>
    <asp:Button ID="uxRoleSubmitButton" OnClick="uxRoleSubmitButton_Click" Text="Add Role" runat="server" />



</asp:Content>

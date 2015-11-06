<%@ Page Language="C#" MasterPageFile="~/App_Master/BaseTemplate.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="CST65Project.Customers.Login" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
    <title> Blag!</title>
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderForm1" runat="server">
    <asp:LoginView id="BlagLoginView" runat="server">
        <AnonymousTemplate>
            <big>Who the hell do you think you are?</big><br />
            No really, <a href="Customers/Login.aspx">tell me. </a>
        </AnonymousTemplate>

        <LoggedInTemplate>

            <asp:Label AssociatedControlID="blagTitle" runat="server"> Title:</asp:Label>
            <br />
            <asp:TextBox ID="blagTitle" Width="500" runat="server"></asp:TextBox>
            <br />
            <asp:Label  AssociatedControlID="blagBody" runat="server"> Blag up:</asp:Label>
            <br />
            <asp:TextBox ID="blagBody" Width="500" TextMode="MultiLine" Height="300" runat="server"></asp:TextBox>


        </LoggedInTemplate>
    </asp:LoginView>
</asp:Content>
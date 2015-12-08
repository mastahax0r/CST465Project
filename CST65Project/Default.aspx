<%@ Page Language="C#" MasterPageFile="~/App_Master/BaseTemplate.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CST65Project.Default" %>
<%@ Register TagPrefix="ASS6" TagName="FeaturedProduct" Src="~/FeaturedProducts.ascx" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
    <title>Home Page</title>
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderHeader" runat="server">
    <h1>Home Page</h1>
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderForm1" runat="server">

    <div class="col_50 col">
        <ASS6:FeaturedProduct runat="server" />
    </div>

    <div class="picOfWeek col">
        <h2>Pop's Pic of the Week</h2>
        <img src="img/thumbs.jpg" alt="Picture of the Week" />
    </div>

</asp:Content>

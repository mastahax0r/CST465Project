<%@ Page Language="C#" MasterPageFile="~/App_Master/BaseTemplate.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="CST65Project.Products" %>
<%@ Register TagPrefix="ASS6" TagName="FeaturedProduct" Src="~/FeaturedProducts.ascx" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
    <title>Products</title>
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderHeader" runat="server">
    <h1>Products</h1>
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderForm1" runat="server">
    <ASS6:FeaturedProduct runat="server"/>
        
    <asp:SqlDataSource
        ID="productListDS"
        ConnectionString="<%$ ConnectionStrings:oitSqlServer %>"
        SelectCommandType="StoredProcedure"
        SelectCommand="Product_GetList"
        runat="server" />
    <h2>All of Pop's Products</h2>
    <asp:Repeater ID="productsListRepeater" DataSourceID="productListDS" runat="server">
    <ItemTemplate>
        <div class="product">
            <h3><%# Eval("Name") %></h3>
            <p><%# Eval("Description") %></p>
            <spane class="price">$<%# Eval("Price") %></spane>
        </div>
    </ItemTemplate>
</asp:Repeater>

</asp:Content>
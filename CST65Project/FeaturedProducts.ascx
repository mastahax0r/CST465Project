<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FeaturedProducts.ascx.cs" Inherits="CST65Project.FeaturedProducts" %>

<h2>Pop's featured products.</h2>

<asp:SqlDataSource
    ID="featuredProductsDS"
    ConnectionString="<%$ ConnectionStrings:oitSqlServer %>"
    SelectCommandType="StoredProcedure"
    SelectCommand="Product_GetFeatured"
    runat="server" />

<asp:Repeater ID="featuredProductsRepeater" DataSourceID="featuredProductsDS" runat="server">
    <ItemTemplate>
        <div class="product">
            <h3><%# Eval("Name") %></h3>
            <p><%# Eval("Description") %></p>
            <spane class="price">$<%# Eval("Price") %></spane>
        </div>
    </ItemTemplate>
</asp:Repeater>

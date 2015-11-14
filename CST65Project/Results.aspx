<%@ Page Language="C#" MasterPageFile="~/App_Master/BaseTemplate.Master" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="CST65Project.Results" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
    <title>Results</title>
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderHeader" runat="server">
    <h1>Results</h1>
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderForm1" runat="server">

            <asp:Repeater id="uxViewResultsRepeater" runat="server">
            <ItemTemplate>
                <b>Q: <%# Eval("QuestionText") %></b>
                <br /> 
                A: <%# Eval("Answer") %>
                <br />
                <hr />
            </ItemTemplate>
        </asp:Repeater>

</asp:Content>
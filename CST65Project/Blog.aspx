<%@ Page Language="C#" MasterPageFile="~/App_Master/BaseTemplate.Master" AutoEventWireup="true" CodeBehind="Blog.aspx.cs" Inherits="CST65Project.Blog" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
    <title>Blag!</title>
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderForm1" runat="server">

    <asp:SqlDataSource
        ID="blagInsertUpdate"
        ConnectionString="<%$ ConnectionStrings:oitSqlServer %>"
        SelectCommandType="StoredProcedure"
        SelectCommand="Blog_GetList"
        InsertCommandType="StoredProcedure"
        InsertCommand="Blog_InsertUpdate"
        runat="server" />

    <asp:LoginView ID="BlagLoginView" runat="server">

        <AnonymousTemplate>
            <big>Who the hell do you think you are?</big>
            <br />
            No really, <a href="Customers/Login.aspx">tell me. </a>
        </AnonymousTemplate>

        <LoggedInTemplate>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                <asp:FormView ID="blagForm" DefaultMode="Insert" DataSourceID="blagInsertUpdate" runat="server">

                    <insertitemtemplate>
                    <asp:Label AssociatedControlID="blagTitle" runat="server"> Title:</asp:Label>
                    <br />
                    <asp:TextBox ID="blagTitle" Width="500" Text='<%# Bind("Title") %>' runat="server"></asp:TextBox>
                    <br />
                    <asp:Label AssociatedControlID="blagBody" runat="server"> Blag up:</asp:Label>
                    <br />
                    <asp:TextBox ID="blagBody" Width="500" TextMode="MultiLine" Height="300" Text='<%# Bind("Content") %>' runat="server"></asp:TextBox>
                    <br />
                    <asp:Button ID="uxSubmitBlag" text="Submit" CommandName="Insert" runat="server" />
                </insertitemtemplate>

                </asp:FormView>

                <asp:Repeater ID="uxBlagPosts" DataSourceID="blagInsertUpdate" runat="server">
                    <itemtemplate>
                    <article>
                        <h1><%# Eval("Title") %></h1>
                        <p><%# Eval("Content") %></p>
                    </article>
                </itemtemplate>
                </asp:Repeater>
                </ContentTemplate>
            </asp:UpdatePanel>
        </LoggedInTemplate>

    </asp:LoginView>
</asp:Content>

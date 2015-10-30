<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddTreater.aspx.cs" Inherits="CST65Project.AddTreater" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource 
                ID="selectAllCandy" 
                ConnectionString="<%$ ConnectionStrings:oitSqlServer %>"
                SelectCommandType="Text" 
                SelectCommand="select * from candy;" 
                runat="server" />
            <asp:SqlDataSource 
                ID="selectAllCostumes" 
                ConnectionString="<%$ ConnectionStrings:oitSqlServer %>"
                SelectCommandType="Text" 
                SelectCommand="select * from costumes;" 
                runat="server" />
            <asp:SqlDataSource 
                ID="insertTreaters" 
                ConnectionString="<%$ ConnectionStrings:oitSqlServer %>" 
                InsertCommandType="Text" 
                InsertCommand="insert into treaters(name, favoriteCandyID, costumeID) 
                              values (@name, @favoriteCandyID, @costumeID);" 
                runat="server"/>


            <asp:FormView ID="uxInsertForm" DefaultMode="Insert" DataSourceID="insertTreaters" DataKeyNames="id" runat="server">
                <ItemTemplate>
                    <strong>Name </strong><%# Eval("name") %>
                    <br />
                    <strong>Favorite Candy ID </strong><%# Eval("favoriteCandyID") %>
                    <br />
                    <strong>Costume ID</strong><%# Eval("costumeID") %>
                    <asp:Button ID="uxEdit" Text="Edit" CommandName="Edit" runat="server" />
                </ItemTemplate>

                <InsertItemTemplate>
                    <asp:Label ID="lblName" AssociatedControlID="uxName" Text="Name: " runat="server" />
                    <asp:TextBox ID="uxName" Text='<%# Bind("name") %>' runat="server" />
                    <br />

                    <asp:Label ID="lblFavoriteCadyID" AssociatedControlID="uxFavoriteCandyID" Text="Favorite Candy: " runat="server" />
                    <asp:DropDownList ID="uxFavoriteCandyID" DataSourceID="selectAllCandy" DataTextField="productName" 
                        DataValueField="id" SelectedValue='<%# Bind("favoriteCandyID") %>' runat="server"/>
                    <br />
                   
                    <asp:Label ID="lblCostumeID" AssociatedControlID="uxCostumeID" Text=" Costume: " runat="server" />
                    <asp:DropDownList ID="uxCostumeID" DataSourceID="selectAllCostumes" DataTextField="costume" 
                        DataValueField="id" SelectedValue='<%# Bind("costumeID") %>' runat="server" />
                    <br />

                    <asp:Button ID="uxSubmit" Text="Add Treater" CommandName="insert" runat="server" />
                </InsertItemTemplate>

<%--            <EditItemTemplate>
                    <asp:Label ID="lblPersonName" AssociatedControlID="uxPersonName" Text="Name" runat="server" />
                    <asp:TextBox ID="uxPersonName" Text='<%# Bind("name") %>' runat="server" />
                    <br />
                    <asp:Label ID="lblPersonAge" AssociatedControlID="uxPersonAge" Text="Age" runat="server" />
                    <asp:TextBox ID="uxPersonAge" Text='<%# Bind("age") %>' runat="server" />
                    <asp:Button ID="uxSubmit" Text="Update" CommandName="Update" runat="server" />
                </EditItemTemplate>--%>
            </asp:FormView>
        </div>
    </form>
</body>
</html>

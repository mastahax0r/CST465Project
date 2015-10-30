<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewTreaters.aspx.cs" Inherits="CST65Project.ViewTreaters" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:SqlDataSource 
        ID="viewTreaters" 
        ConnectionString="<%$ ConnectionStrings:oitSqlServer %>" 
        SelectCommandType="Text" 
        SelectCommand="SELECT name, productName, costume FROM
                        treaters JOIN candy ON treaters.FavoriteCandyID = Candy.Id JOIN
                        costumes ON treaters.CostumeID = Costumes.Id;"
        runat="server" />

        <asp:Repeater id="uxViewTreaters" DataSourceID="viewTreaters" runat="server">
            <ItemTemplate>
                <%# Eval("name") %> looks like 
                <%# Eval("costume") %> and likes to eat 
                <%# Eval("productName") %>
                <br />
            </ItemTemplate>
        </asp:Repeater>
    </div>
    </form>
</body>
</html>

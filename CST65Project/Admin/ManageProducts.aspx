<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageProducts.aspx.cs" Inherits="CST65Project.Admin.ManageProducts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .label {
            width: 120px;
            display: inline-block;
            text-align: right;
        }

        #formLabel {
            font-size: larger;
            font-weight: 800;
        }
    </style>
</head>

<body>
    <asp:SqlDataSource
        ID="productManagement"
        ConnectionString="<%$ ConnectionStrings:oitSqlServer %>"
        SelectCommandType="StoredProcedure"
        SelectCommand="Product_GetList"
        InsertCommandType="StoredProcedure"
        InsertCommand="Product_InsertUpdate"
        UpdateCommandType="StoredProcedure"
        UpdateCommand="Product_InsertUpdate"
        runat="server" />

    <form id="form1" runat="server">
        Switch to:
        <asp:LinkButton ID="toggleForm" Text="x" OnClick="toggleForm_Click" runat="server" />
        <br />
        <br />
        <div id="formLabel">
            <asp:Literal ID="displayMode" Text="x" runat="server" />
        </div>

        <asp:FormView ID="insertProductForm" DefaultMode="Insert" DataSourceID="productManagement" runat="server">
            <InsertItemTemplate>
                <asp:Label AssociatedControlID="Name" CssClass="label" runat="server"> Name:</asp:Label>
                <asp:TextBox ID="Name" Width="250" Text='<%# Bind("Name") %>' runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label AssociatedControlID="Description" CssClass="label" runat="server"> Description:</asp:Label>
                <asp:TextBox ID="Description" Width="300" TextMode="MultiLine" rows="2" Text='<%# Bind("Description") %>' runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label AssociatedControlID="Price" CssClass="label" runat="server"> Price:</asp:Label>
                <asp:TextBox ID="Price" Width="50" Text='<%# Bind("Price") %>' runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label AssociatedControlID="Featured" CssClass="label" runat="server"> Featured</asp:Label>
                <asp:CheckBox ID="Featured" Checked='<%# Bind("Featured") %>' runat="server"></asp:CheckBox>
                <br />
                <br />
                <asp:Button ID="insertProduct" Text="Submit" CommandName="Insert" runat="server" />
                <br />
            </InsertItemTemplate>
        </asp:FormView>

        <asp:FormView ID="updateProductForm" DefaultMode="edit" DataSourceID="productManagement" Visible="false" runat="server">
            <EditItemTemplate>
                <asp:Label AssociatedControlID="ID" CssClass="label" runat="server"> ID:</asp:Label>
                <asp:TextBox ID="ID" Width="50" Text='<%# Bind("ID") %>' runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label AssociatedControlID="Name" CssClass="label" runat="server"> Name:</asp:Label>
                <asp:TextBox ID="Name" Width="250" Text='<%# Bind("Name") %>' runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label AssociatedControlID="Description" CssClass="label" runat="server"> Description:</asp:Label>
                <asp:TextBox ID="Description" Width="300" TextMode="MultiLine" Rows="2" Text='<%# Bind("Description") %>' runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label AssociatedControlID="Price" CssClass="label" runat="server"> Price:</asp:Label>
                <asp:TextBox ID="Price" Width="50" Text='<%# Bind("Price") %>' runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label AssociatedControlID="Featured" CssClass="label" runat="server"> Featured</asp:Label>
                <asp:CheckBox ID="Featured" Checked='<%# Bind("Featured") %>' runat="server"></asp:CheckBox>
                <br />
                <br />
                <asp:Button ID="insertProduct" Text="Submit" CommandName="Update" runat="server" />
                <br />
            </EditItemTemplate>
        </asp:FormView>
        
        <hr />
        
        <asp:GridView ID="productGridView" DataSourceID="productManagement" AutoGenerateColumns="false"
            DataKeyNames="ID" AllowSorting="true" AllowPaging="true" PageSize="15" runat="server">
            <Columns>
                <asp:BoundField DataField="ID" SortExpression="ID" HeaderText="ID" />
                <asp:BoundField DataField="Name" SortExpression="Name" HeaderText="Name" />
                <asp:BoundField DataField="Description" SortExpression="Description" HeaderText="Description" />
                <asp:BoundField DataField="Price" SortExpression="Price" HeaderText="Price" />
                <asp:BoundField DataField="Featured" SortExpression="Featured" HeaderText="Featured" />
                <asp:BoundField DataField="Timestamp" SortExpression="Timestamp" HeaderText="Timestamp" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>

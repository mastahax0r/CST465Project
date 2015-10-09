<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CST65Project.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="uxNameLabel" AssociatedControlID="uxName" runat="server">Name:</asp:Label>
        <asp:TextBox ID="uxName" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="uxUserTypeLabel" AssociatedControlID="uxUserType" runat="server">User:</asp:Label> 
        <asp:DropDownList ID="uxUserType" runat="server" AutoPostBack="False">
            <asp:ListItem Value="Student"></asp:ListItem>
            <asp:ListItem Value="Faculty/Staff"></asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Label ID="uxHobbyLabel" AssociatedControlID="uxHobby" runat="server">Hobby:</asp:Label> 
        <asp:TextBox ID="uxHobby" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="uxBandLabel" AssociatedControlID="uxBand" runat="server">Band:</asp:Label> 
        <asp:TextBox ID="uxBand" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="uxBiographyLabel" AssociatedControlID="uxBiography" runat="server">Biography:</asp:Label> 
        <asp:TextBox ID="uxBiography" TextMode="MultiLine" runat="server"></asp:TextBox>
        <asp:Table runat="server">
            <asp:TableHeaderRow>
                <asp:TableHeaderCell>Course Prefix</asp:TableHeaderCell>
                <asp:TableHeaderCell>Course Number</asp:TableHeaderCell>
                <asp:TableHeaderCell>Course Desc.</asp:TableHeaderCell>
            </asp:TableHeaderRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="uxCoursePrefixLabel" AssociatedControlID="uxCoursePrefix" runat="server">Course Prefix:</asp:Label>
                    <asp:TextBox ID="uxCoursePrefix" runat="server"></asp:TextBox> </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="uxCourseNumberLabel" AssociatedControlID="uxCourseNumber" runat="server">Course Number:</asp:Label>
                    <asp:TextBox ID="uxCourseNumber" runat="server"></asp:TextBox></asp:TableCell>
                <asp:TableCell> 
                    <asp:Label ID="uxCourseDescriptionLabel" AssociatedControlID="uxCourseDescription" runat="server">Course Description:</asp:Label> 
                    <asp:TextBox ID="uxCourseDescription" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <asp:Label ID="uxSubmitLabel" AssociatedControlID="uxSubmit" runat="server">Submit:</asp:Label>
        <asp:Button ID="uxSubmit" runat="server" Text="Save Profile" OnClick="uxSubmit_Click"/>
        <br />
        <asp:Literal ID="uxIsPostBack" runat="server"></asp:Literal>
        <asp:Literal ID="uxFormOutput" runat="server"></asp:Literal>  
        <asp:Literal ID="uxEventOutput" runat="server"></asp:Literal>           
    </div>
    </form>
</body>
</html>

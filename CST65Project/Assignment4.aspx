<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Assignment4.aspx.cs" Inherits="CST65Project.Assignment4"  %>
<%@ Register TagPrefix="ASS4" TagName="UserControlEssayQ" Src="~/EssayQuestion.ascx" %>
<%@ Register TagPrefix="ASS4" TagName="UserControlMultiQ" Src="~/MultipleChoiceQuestion.ascx" %>
<%@ Register TagPrefix="ASS4" Assembly="CST65Project" Namespace="CST65Project" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Assignment 4 Test</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>   

        <ASS4:UserControlEssayQ ID="uxQ1" QuestionText="Why did WTC7 collapse?" Answer="Fire, obviously."  runat="server" />
        <br />
        <br />
        <ASS4:UserControlMultiQ ID="uxQ2" QuestionText="You have 99 problems. Which is not one?" Items="Grades;Regular Expressions;A female k9;Cheesus;"  runat="server" />
        <br />
        <br />
        <ASS4:ShortTextQuestion id="uxQ3" QuestionText="Who's the cat that won't cop out when there's danger all about?" Answer="Shaft!"  runat="server" />
        <br />
        <br />
        <ASS4:TrueFalseQuestion ID="uxQ4" QuestionText="Hootie the owl is always angry." runat="server" />
        <br />
        <br />
        <asp:Button ID="submitAnswersButton" Text="Judge Me" OnClick="submitAnswersButton_Click" runat="server" />
        <br />
        <asp:Literal ID="uxAnswerOutput" runat="server" />
    </div>
    </form>
</body>
</html>

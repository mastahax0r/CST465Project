<%@ Page Language="C#" MasterPageFile="~/App_Master/BaseTemplate.Master" AutoEventWireup="true" CodeBehind="MidtermExam.aspx.cs" Inherits="CST65Project.MidtermExam" %>
<%@ Register TagPrefix="ASS4" TagName="UserControlEssayQ" Src="~/EssayQuestion.ascx" %>
<%@ Register TagPrefix="ASS4" TagName="UserControlMultiQ" Src="~/MultipleChoiceQuestion.ascx" %>
<%@ Register TagPrefix="ASS4" Assembly="CST65Project" Namespace="CST65Project" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
    <title>Miidterm Exam</title>
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderHeader" runat="server">
    <h1>Midterm Exam</h1>
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderForm1" runat="server">

    <asp:PlaceHolder ID="uxQuestions" runat="server">

        <b>True / False Questions</b>
        <br />
        <ASS4:TrueFalseQuestion ID="uxTFQ1" QuestionText="HTTP is a stateless protocol: " runat="server" />
        <br />
        <ASS4:TrueFalseQuestion ID="uxTFQ2" QuestionText="SessionState can be transferred between pages: " runat="server" />
        <br />
        <ASS4:TrueFalseQuestion ID="uxTFQ3" QuestionText="Sanitizing database inputs is only important for sites handling sensitive information" runat="server" />
        <br />
        <ASS4:TrueFalseQuestion ID="uxTFQ4" QuestionText="ViewState can be transferred between pages: " runat="server" />
        <br />
        <ASS4:TrueFalseQuestion ID="uxTFQ5" QuestionText="Cookies can be transferred between pages: " runat="server" />
        <br />
        <ASS4:TrueFalseQuestion ID="uxTFQ6" QuestionText="It is a good practice to use inline CSS styles: " runat="server" />
        <br />
        <ASS4:TrueFalseQuestion ID="uxTFQ7" QuestionText="All controls in ASP.NET support DataBinding: " runat="server" />
        <br />
        <ASS4:TrueFalseQuestion ID="uxTFQ8" QuestionText="Browsers must support ASP.NET in order to display pages created with it: " runat="server" />
        <br />
        <ASS4:TrueFalseQuestion ID="uxTFQ9" QuestionText="When a MasterPage is used, a page wraps its own content with the MasterPages’s content:" runat="server" />
        <br />
        <ASS4:TrueFalseQuestion ID="uxTFQ10" QuestionText="&lt; deny &gt; authorization rules in the web.config are processed first regardless of the way the rules are ordered: " runat="server" />
        <br />
        <br />

        <b>Essay Questions</b>
        <br />
        <ASS4:UserControlEssayQ ID="uxEssayQ1" QuestionText="Place the following events in order of when they occur in the page lifecycle: Load; Init; Request Arrives; PreRender; Load ViewState; Input Control Event Handling."
            Answer="Request Arrives; Init; Load; Load ViewState; Input Controle Event Handling; PreRender. " runat="server" />
        <br />
        <br />
        <ASS4:UserControlEssayQ ID="uxEssayQ2" QuestionText="What is the purpose of the doctype  declaration at the top of a web page?"
            Answer="The doctype declaration informs the browser how to interpret the page. " runat="server" />
        <br />
        <br />
        <ASS4:UserControlEssayQ ID="uxEssayQ3" QuestionText="What is the order of precedence for the same style defined in the following ways: Style tag in document head; Extenal Style Sheet referenced by the link tag in document head."
            Answer="The more specific a CSS style directive is, the higher its precedence. Styles defined in the head of an HTML document are more specific than those in a linked style sheet. Thus, styles defined in the head take precedence over a linked style sheet. " runat="server" />
        <br />
        <br />
        <ASS4:UserControlEssayQ ID="uxEssayQ4" QuestionText="What is the order of precedence for CSS for referencing elements in the following ways: By Element Name; By ID; By CSS Class; Inline using the style=”” attribute. "
            Answer="1 – Inline syle; 2 – By ID; 3 – By CSS Class; 4 – By Element Name." runat="server" />
        <br />
        <br />
        <ASS4:UserControlEssayQ ID="uxEssayQ5" QuestionText="Explain why the alt attribute of the img tag is important."
            Answer="The alt attribute of the img tag is important for two reasons. First, and most important, it enables greater accessibility of the web for people with disabilities that prevent them from seeing the page directly (ie. The use of screen readers for the blind). Secondly, old browsers and bandwidth constrained visitors may not be capable of loading images. " runat="server" />
        <br />
        <br />
        <ASS4:UserControlEssayQ ID="uxEssayQ6" QuestionText="What is the purpose of name mangling?"
            Answer="Name mangling of control ID’s helps ensure every control on the page has a unique ID, even if the same kind of control is used multiple times. " runat="server" />
        <br />
        <br />
        <ASS4:UserControlEssayQ ID="uxEssayQ7" QuestionText="Explain the difference between redirects that use a 301 HTTP status code and ones that use a 302 HTTP status code."
            Answer="A 301 error code means the resource has moved permanently, whereas a 302 error means the resource has moved only temporarily. This is an important distinction when the page is being retrieved though an automated processes, such as a web crawler. " runat="server" />

        <br />
        <br />
        <b>Multiple Choice</b>
        <br />

        <ASS4:UserControlMultiQ ID="uxMultiQ1" QuestionText="HTML Stands for: " runat="server">
            <Items>
                <asp:ListItem>HoTMaiL</asp:ListItem>
                <asp:ListItem>Highly Transferable Modeling Language</asp:ListItem>
                <asp:ListItem>HyperText Markup Language</asp:ListItem>
                <asp:ListItem>High Traffic Masking Language</asp:ListItem>
            </Items>
        </ASS4:UserControlMultiQ>
        <br />
        <ASS4:UserControlMultiQ ID="xMultiQ2" QuestionText="All controls that ask for user input should have an associated: " runat="server">
            <Items>
                <asp:ListItem>Label</asp:ListItem>
                <asp:ListItem>Validator</asp:ListItem>
                <asp:ListItem>Event Handler</asp:ListItem>
                <asp:ListItem>Ferret</asp:ListItem>
            </Items>
        </ASS4:UserControlMultiQ>
        <br />
        <ASS4:UserControlMultiQ ID="xMultiQ3" QuestionText="The living version of a page within the web browser is called the: " runat="server">
            <Items>
                <asp:ListItem>Output Rendering Model</asp:ListItem>
                <asp:ListItem>Document Object Model</asp:ListItem>
                <asp:ListItem>Box Model</asp:ListItem>
                <asp:ListItem>Underwear Model</asp:ListItem>
            </Items>
        </ASS4:UserControlMultiQ>
        <br />
        <ASS4:UserControlMultiQ ID="xMultiQ4" QuestionText="Which of the following elements is most appropriate for presenting the user with a list of items in no particular order? " runat="server">
            <Items>
                <asp:ListItem>ol</asp:ListItem>
                <asp:ListItem>ul</asp:ListItem>
                <asp:ListItem>dl</asp:ListItem>
                <asp:ListItem>dropdownliste</asp:ListItem>
            </Items>
        </ASS4:UserControlMultiQ>
        <br />
        <ASS4:UserControlMultiQ ID="xMultiQ5" QuestionText="What is the difference between the ViewStateMode and EnableViewState properties in the &lt; %@ Page % &gt; declaration? " runat="server">
            <Items>
                <asp:ListItem>ViewStateMode was introduced in ASP.NET 4 to allow more than true/false values, but currently there is no distinguishable difference in functionality</asp:ListItem>
                <asp:ListItem>When ViewState is disabled via ViewStateMode, it can't be enabled at the control level</asp:ListItem>
                <asp:ListItem>When ViewState is disabled via EnableViewState, it can't be enabled at the control level</asp:ListItem>
                <asp:ListItem>When ViewState is enabled via ViewStateMode, it can't be disabled at the control level</asp:ListItem>
                <asp:ListItem>When ViewState is enabled via EnableViewState, it can't be disabled at the control level</asp:ListItem>
            </Items>
        </ASS4:UserControlMultiQ>

        <br />
        <br />
        <b>Short Answer</b>
        <br />
        <ASS4:ShortTextQuestion ID="uxShortQ1" QuestionText="The line of text that tells a SqlDataSource how to connect to the database is called ?"
            Answer="Connection String" runat="server" />
        <br />
        <ASS4:ShortTextQuestion ID="uxShortQ2" QuestionText="When a WebForms page performs a POST operation to itself, it is referred to as "
            Answer="PostBack" runat="server" />
        <br />
        <ASS4:ShortTextQuestion ID="uxShortQ3" QuestionText="The term for loading a controls data from a data source is "
            Answer="Data Binding" runat="server" />
        <br />
        <ASS4:ShortTextQuestion ID="uxShortQ4" QuestionText="An example of a block element is "
            Answer="&lt; div &gt;" runat="server" />
        <br />
        <ASS4:ShortTextQuestion ID="uxShortQ5" QuestionText="An example of an inline element is "
            Answer="&lt; span &gt; " runat="server" />
        <br />
        <ASS4:ShortTextQuestion ID="uxShortQ6" QuestionText="What is the name of the file that stores configuration information for a web site"
            Answer="web.config" runat="server" />
        <br />
        <ASS4:ShortTextQuestion ID="uxShortQ7" QuestionText="A div with the following CSS will have what computed height and width? { margin: 0 0 5px; padding: 5px 10px; height: 100px; width: 50px;  border-left: solid 3px #0c0; } "
            Answer="Height 115px, Width 123px" runat="server" />
        <br />

    </asp:PlaceHolder>
    <br />
    <asp:Button ID="uxSubmitButton" Text="Submit" OnClick="uxSubmitButton_Click" runat="server" />
</asp:Content>

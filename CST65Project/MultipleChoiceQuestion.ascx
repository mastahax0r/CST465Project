<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MultipleChoiceQuestion.ascx.cs" Inherits="CST65Project.MultipleChoiceQuestion" %>

<asp:Label id="uxLabel" AssociatedControlID="uxRadioList" runat="server" />
<asp:RequiredFieldValidator ID="valRadioList" ControlToValidate="uxRadioList" Display="Dynamic" Text="*" runat="server" />
<asp:RadioButtonList id="uxRadioList"  runat="server" />

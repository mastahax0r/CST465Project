<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EssayQuestion.ascx" Inherits="CST65Project.EssayQuestion" %>

<asp:Label id="uxLabel" AssociatedControlID="uxTextBox" runat="server" />
<br />
<asp:TextBox id="uxTextBox" Width="400" TextMode="MultiLine" Rows="5" runat="server"/>
<asp:RequiredFieldValidator ID="valTextBox" ControlToValidate="uxTextBox" Display="Dynamic" Text="*" runat="server" />

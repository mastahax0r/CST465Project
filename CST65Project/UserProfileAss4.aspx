<%@ Page Language="C#" MasterPageFile="~/App_Master/BaseTemplate.Master" AutoEventWireup="true" CodeBehind="UserProfileAss4.aspx.cs" Inherits="CST65Project.UserProfile" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
 
    <script type="text/javascript">
        function validateFile(sender, args) {
            var allowedExtensions = ['jpg', 'gif', 'png'];
            var fileExtension = args.Value.split(/(\.)/g).pop();
            args.IsValid = false;
            for (var i = 0; i < allowedExtensions.length; i++) {
                if (fileExtension == allowedExtensions[i]) {
                    args.IsValid = true;
                }
            }
        }
    </script>
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderHeader" runat="server">
            <h1>ASSignment 3</h1>
    </asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolderForm1" runat="server">
            <asp:MultiView ID="multiView1" ActiveViewIndex="0" runat="server">
                <asp:View ID="view1" runat="server">

                    <asp:Label ID="uxFirstnameLabel" CssClass="rightAlign" AssociatedControlID="uxFirstName" runat="server">First Name:</asp:Label>
                    <asp:TextBox ID="uxFirstName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="uxFirstName" Display="Dynamic" Text="*" ErrorMessage="First Name Required" runat="server"></asp:RequiredFieldValidator>
                    <br />
                    
                    <asp:Label ID="uxLastNameLabel" CssClass="rightAlign" AssociatedControlID="uxLastName" runat="server">Last Name:</asp:Label>
                    <asp:TextBox ID="uxLastName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="uxLastName" Display="Dynamic" Text="*" ErrorMessage="Last Name Required" runat="server"></asp:RequiredFieldValidator>
                    <br />
                    
                    <asp:Label ID="uxAgeLabel" CssClass="rightAlign" AssociatedControlID="uxAge" runat="server">Age:</asp:Label>
                    <asp:TextBox ID="uxAge" Width="20px" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="uxAge" Display="Dynamic" Text="*" ErrorMessage="Age Required" runat="server"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ControlToValidate="uxAge" Type="Integer" MinimumValue="0" MaximumValue="200" Display="Dynamic" Text="*" ErrorMessage="Age must be between 0 and 200" runat="server"></asp:RangeValidator>
                    <br />
                    
                    <asp:Label ID="uxPhoneNumberLabel" CssClass="rightAlign" AssociatedControlID="uxPhoneNumber" runat="server">Phone Number:</asp:Label>
                    <asp:TextBox ID="uxPhoneNumber" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="uxPhoneNumber" Display="Dynamic" Text="*" ErrorMessage="Phone Number Required" runat="server"></asp:RequiredFieldValidator>
                    <br />
                    
                    <asp:Label ID="usEmailLabel" CssClass="rightAlign" AssociatedControlID="uxEmail" runat="server">Email:</asp:Label>
                    <asp:TextBox ID="uxEmail" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="uxEmail" Display="Dynamic" Text="*" ErrorMessage="Email Required" runat="server"></asp:RequiredFieldValidator>
                    <br />
                    
                    <asp:Label ID="uxEmailConfirmLabel" CssClass="rightAlign" AssociatedControlID="uxEmailConfirm" runat="server">Confirm Email:</asp:Label>
                    <asp:TextBox ID="uxEmailConfirm" runat="server"></asp:TextBox>
                    <asp:CompareValidator ControlToValidate="uxEmail" ControlToCompare="uxEmailConfirm" Display="Dynamic" Text="*" ErrorMessage="Email addresses don't match" runat="server"></asp:CompareValidator>
                    <br />
                    
                    <asp:Label ID="uxStreetAddresLabel" CssClass="rightAlign" AssociatedControlID="uxStreetAddress" runat="server">Street Address:</asp:Label>
                    <asp:TextBox ID="uxStreetAddress" runat="server"></asp:TextBox>
                    <br />
                    
                    <asp:Label ID="uxCityLabel" CssClass="rightAlign" AssociatedControlID="uxCity" runat="server">City:</asp:Label>
                    <asp:TextBox ID="uxCity" runat="server"></asp:TextBox>
                    <br />
                    
                    <asp:Label ID="uxStateLabel" CssClass="rightAlign" AssociatedControlID="uxState" runat="server">State:</asp:Label>
                    <asp:DropDownList ID="uxState" runat="server">
                        <asp:ListItem Value="OR">Oregon</asp:ListItem>
                        <asp:ListItem Value="WA">Washington</asp:ListItem>
                        <asp:ListItem Value="CA">California</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    
                    <asp:Label ID="uxZipCodeLabel" CssClass="rightAlign" AssociatedControlID="uxZipCode" runat="server">Zip Code:</asp:Label>
                    <asp:TextBox ID="uxZipcode" width="55px" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ControlToValidate="uxZipCode" ValidationExpression="\d{5}(\-\d{4})?" Display="Dynamic" Text="*" ErrorMessage="Not a zip code" runat="server"></asp:RegularExpressionValidator>
                    <br />
                    
                    <asp:Label ID="uxImageUploadLabel" CssClass="rightAlign" AssociatedControlID="uxImageUpload" runat="server">Upload Avatar:</asp:Label>
                    <asp:FileUpload ID="uxImageUpload" runat="server" />
                    <asp:CustomValidator ControlToValidate="uxImageUpload" OnServerValidate="Image_ServerValidate" Display="Dynamic" Text="*" ErrorMessage="Only jpg gif and png" runat="server"></asp:CustomValidator>
                    <%-- ClientValidationFunction="validateFile" --%>
                    <br />
                    <asp:Button ID="uxSubmitButton" Text="save" OnClick="uxSubmitButton_Click" runat="server" />
                    <asp:ValidationSummary ID="uxValidationSummary" ShowMessageBox="false" runat="server" />
                </asp:View>

                <asp:View ID="view2" runat="server">
                    <strong>First Name:</strong><asp:Literal ID="uxFirstNameResult" Text="" runat="server"></asp:Literal><br />
                    <strong>Last Name:</strong><asp:Literal ID="uxLastNameResult" Text="" runat="server"></asp:Literal><br />
                    <strong>Age:</strong><asp:Literal ID="uxAgeResult" Text="" runat="server"></asp:Literal><br />
                    <strong>Phone Number:</strong><asp:Literal ID="uxPhoneNumberResult" Text="" runat="server"></asp:Literal><br />
                    <strong>Email:</strong><asp:Literal ID="uxEamilResult" Text="" runat="server"></asp:Literal><br />
                    <strong>Street:</strong><asp:Literal ID="uxStreetResult" Text="" runat="server"></asp:Literal><br />
                    <strong>City:</strong><asp:Literal ID="uxCityResult" Text="" runat="server"></asp:Literal><br />
                    <strong>State:</strong><asp:Literal ID="uxStateResult" Text="" runat="server"></asp:Literal><br />
                    <strong>Zip:</strong><asp:Literal ID="uxZipResult" Text="" runat="server"></asp:Literal><br />
                   
                    <asp:Image ID="uxImage" runat="server" />
                </asp:View>
            </asp:MultiView>

    </asp:Content>


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


namespace CST65Project
{
    public partial class UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //throw new Exception("Bad deal man, Bad DEAL!");

            if (Session["ProfileData"] != null)
            {
                UserProfileBO sessionRestore = (UserProfileBO)Session["ProfileData"];
                multiView1.ActiveViewIndex = 1;

                uxFirstNameResult.Text = sessionRestore.FirstName;
                uxLastNameResult.Text = sessionRestore.LastName;
                uxAgeResult.Text = sessionRestore.Age.ToString();
                uxPhoneNumberResult.Text = sessionRestore.PhoneNumber;
                uxEamilResult.Text = sessionRestore.Email;
                uxStreetResult.Text = sessionRestore.StreetAddress;
                uxCityResult.Text = sessionRestore.City;
                uxStateResult.Text = sessionRestore.State;
                uxZipResult.Text = sessionRestore.Zipcode;

                uxImage.ImageUrl = sessionRestore.Image;
                string base64String = null;
                using (MemoryStream m = new MemoryStream(sessionRestore.Image2))
                {
                    byte[] imageBytes = m.ToArray();
                    // Convert byte[] to Base64 String                    
                    base64String = Convert.ToBase64String(imageBytes);
                }
                if (!string.IsNullOrEmpty(base64String))
                {
                    uxImage.ImageUrl = "data:image/jpeg;base64," + base64String;
                }
            }
        }

        protected void uxSubmitButton_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
            }
            else
            {
                //uxFirstNameResult.Text = uxFirstName.Text;
                //uxLastNameResult.Text = uxLastName.Text;
                //uxAgeResult.Text = uxAge.Text;
                //uxPhoneNumberResult.Text = uxPhoneNumber.Text;
                //uxEamilResult.Text = uxEmail.Text;
                UserProfileBO sessionState = new UserProfileBO();
                sessionState.FirstName = uxFirstName.Text;
                sessionState.LastName = uxLastName.Text;
                sessionState.Age = Int32.Parse(uxAge.Text);
                sessionState.PhoneNumber = uxPhoneNumber.Text;
                sessionState.Email = uxEmail.Text;
                sessionState.EmailConfirm = uxEmailConfirm.Text;
                sessionState.StreetAddress = uxStreetAddress.Text;
                sessionState.City = uxCity.Text;
                sessionState.State = uxState.Text;
                sessionState.Zipcode = uxZipcode.Text;

                sessionState.Image = uxImage.ImageUrl;

                //sessionState.Image2 = uxImage;

                

                if (uxImageUpload.HasFile)
                {

                    //string base64String = null;
                    byte[] buffer = new byte[uxImageUpload.PostedFile.ContentLength];
                    uxImageUpload.PostedFile.InputStream.Read(buffer, 0, uxImageUpload.PostedFile.ContentLength);
                    sessionState.Image2 = buffer;
                }



                multiView1.ActiveViewIndex = 1;
                Session["ProfileData"] = sessionState;

                try
                {
                    Response.Redirect("~/Customers/UserProfile.aspx");
                }
                catch
                {
                    Response.Redirect("~/UserProfileAss4.aspx");
                }
              
            }
        }

        protected void Image_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (Path.GetExtension(args.Value) == ".jpg" | Path.GetExtension(args.Value) == ".gif" | Path.GetExtension(args.Value) == ".png")
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }

        }
    }
}
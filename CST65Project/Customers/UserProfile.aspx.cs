using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Security;
//using System.Data;
//using System.Data.SqlClient;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;

namespace CST65Project
{
    public partial class UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser();
            Guid userID = (Guid)user.ProviderUserKey;

            UserProfileBO sessionRestoreFromRepository = new UserProfileBO();
            sessionRestoreFromRepository = UserProfileRepo.getUserProfile(userID);

            multiView1.ActiveViewIndex = 1;

            //if (sessionRestoreFromRepository.Email != null)
            //{
                uxFirstNameResult.Text = sessionRestoreFromRepository.FirstName;
                uxLastNameResult.Text = sessionRestoreFromRepository.LastName;
                uxAgeResult.Text = sessionRestoreFromRepository.Age.ToString();
                uxPhoneNumberResult.Text = sessionRestoreFromRepository.PhoneNumber;
                uxEamilResult.Text = sessionRestoreFromRepository.Email;
                uxStreetResult.Text = sessionRestoreFromRepository.StreetAddress;
                uxCityResult.Text = sessionRestoreFromRepository.City;
                uxStateResult.Text = sessionRestoreFromRepository.State;
                uxZipResult.Text = sessionRestoreFromRepository.Zipcode;

                //uxImage.ImageUrl = sessionRestoreFromRepository.Image2;
                string base64String = null;

                if (sessionRestoreFromRepository.Image2 != null)
                {
                    using (MemoryStream m = new MemoryStream(sessionRestoreFromRepository.Image2))
                    {
                        byte[] imageBytes = m.ToArray();                  
                        base64String = Convert.ToBase64String(imageBytes);
                    }
                    if (!string.IsNullOrEmpty(base64String))
                    {
                        uxImage.ImageUrl = "data:image/jpeg;base64," + base64String;
                    }
                }
            //}
        }

        protected void uxSubmitButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                MembershipUser user = Membership.GetUser();
                Guid userID = (Guid)user.ProviderUserKey;

                UserProfileBO passMe = new UserProfileBO();
                passMe.UserID = userID;
                passMe.FirstName = uxFirstName.Text;
                passMe.LastName = uxLastName.Text;
                passMe.Age = Int32.Parse(uxAge.Text);
                passMe.PhoneNumber = uxPhoneNumber.Text;
                passMe.Email = uxEmail.Text;
                passMe.EmailConfirm = uxEmailConfirm.Text;
                passMe.StreetAddress = uxStreetAddress.Text;
                passMe.City = uxCity.Text;
                passMe.State = uxState.Text;
                passMe.Zipcode = uxZipcode.Text;

                if (uxImageUpload.HasFile)
                {
                    byte[] buffer = new byte[uxImageUpload.PostedFile.ContentLength];
                    uxImageUpload.PostedFile.InputStream.Read(buffer, 0, uxImageUpload.PostedFile.ContentLength);
                    passMe.Image2 = buffer;
                }
                else if (uxDeletePicCB.Checked)
                {
                    //This results in a "broken image" box. Don't have to to figure out better. Due at midnight. 
                    passMe.Image2 = new byte[1];
                }
                else
                {
                    passMe.Image2 = null;
                }

                multiView1.ActiveViewIndex = 1;
                UserProfileRepo.saveUserProfile(passMe);
                Response.Redirect("~/Customers/UserProfile.aspx");
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

        protected void uxEditButton_Click(object sender, EventArgs e)
        {
            multiView1.ActiveViewIndex = 0;
            uxFirstName.Text = uxFirstNameResult.Text;
            uxLastName.Text = uxLastNameResult.Text;
            uxAge.Text = uxAgeResult.Text;
            uxPhoneNumber.Text = uxPhoneNumberResult.Text;
            uxEmail.Text = uxEamilResult.Text;
            uxEmailConfirm.Text = uxEamilResult.Text;
            uxStreetAddress.Text = uxStreetResult.Text;
            uxCity.Text = uxCityResult.Text;
            uxState.Text = uxStateResult.Text;
            uxZipcode.Text = uxZipResult.Text;
            uxImageCopy.ImageUrl = uxImage.ImageUrl;
        }
    }
}
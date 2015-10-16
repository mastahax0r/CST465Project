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

        }

        protected void uxSubmitButton_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
            }
            else
            {
                uxFirstNameResult.Text = uxLastName.Text;
                uxLastNameResult.Text = uxLastName.Text;
                uxAgeResult.Text = uxAge.Text;
                uxPhoneNumberResult.Text = uxPhoneNumber.Text;
                uxEamilResult.Text = uxEmail.Text;

                multiView1.ActiveViewIndex = 1;

                if (uxImageUpload.HasFile)
                {

                    string base64String = null;
                    byte[] buffer = new byte[uxImageUpload.PostedFile.ContentLength];
                    uxImageUpload.PostedFile.InputStream.Read(buffer, 0, uxImageUpload.PostedFile.ContentLength);
                    using (MemoryStream m = new MemoryStream(buffer))
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
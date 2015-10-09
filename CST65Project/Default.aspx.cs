using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CST65Project
{
    public partial class Default : System.Web.UI.Page
    {

        protected void Page_Init(object sender, EventArgs e)
        {
            uxEventOutput.Text += "Page_Init Happened <br>";
        }       
        protected void Page_Load(object sender, EventArgs e)
        {
            uxEventOutput.Text += "Page_Load Happened <br>";
            uxIsPostBack.Text = "Postback Status = " + Page.IsPostBack.ToString() + "<br>";
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            uxEventOutput.Text += "Page_PreRender Happened <br>";
        }

        protected void uxSubmit_Click(object sender, EventArgs e)
        {
            uxEventOutput.Text += uxName.ID.ToString() + ": " + uxName.Text + "<br>" +
                                uxUserType.ID.ToString() + ": " + uxUserType.Text + "<br>" +
                                uxHobby.ID.ToString() + ": " + uxHobby.Text + "<br>" +
                                uxBand.ID.ToString() + ": " + uxBand.Text + "<br>" +
                                uxBiography.ID.ToString() + ": " + uxBiography.Text + "<br>" +
                                uxCoursePrefix.ID.ToString() + ": " + uxCoursePrefix.Text + "<br>" +
                                uxCourseNumber.ID.ToString() + ": " + uxCourseNumber.Text + "<br>" +
                                uxCourseDescription.ID.ToString() + ": " + uxCourseDescription.Text + "<br>";
        }
    }
}
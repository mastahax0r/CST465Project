using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CST65Project
{
    public partial class Assignment4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitAnswersButton_Click(object sender, EventArgs e)
        {
            uxAnswerOutput.Text = null;
            uxAnswerOutput.Text += "<br><hr> ";
            uxAnswerOutput.Text += "1. " + uxQ1.QuestionText + ": " + uxQ1.Answer + "<br>";
            uxAnswerOutput.Text += "2. " + uxQ2.QuestionText + ": " + uxQ2.Answer + "<br>";
            uxAnswerOutput.Text += "3. " + uxQ3.QuestionText + ": " + uxQ3.Answer + "<br>";
            uxAnswerOutput.Text += "4. " + uxQ4.QuestionText + ": " + uxQ4.Answer + "<br>";
        }
    }
}
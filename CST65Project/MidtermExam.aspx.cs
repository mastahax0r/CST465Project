using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CST65Project
{
    public partial class MidtermExam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uxSubmitButton_Click(object sender, EventArgs e)
        {
            List<QuestionAnswer> answerList = new List<QuestionAnswer>();

            foreach (Control c in uxQuestions.Controls)
            {
                if (c is ITestQuestion)
                {
                    ITestQuestion question = c as ITestQuestion;
                    QuestionAnswer qa = new QuestionAnswer();
                    qa.QuestionText = question.QuestionText;
                    qa.Answer = question.Answer;
                    answerList.Add(qa);
                }
            }

            Session.Add("answers", answerList);

            Server.Transfer("Results.aspx", true);
        }
    }
}
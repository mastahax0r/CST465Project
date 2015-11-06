using System;
using System.Web.UI.WebControls;

namespace CST65Project
{
    public partial class MultipleChoiceQuestion : System.Web.UI.UserControl, ITestQuestion
    {
        protected void Page_Init(object sender, EventArgs e)
        {

        }
        public string QuestionText
        {
            get { return uxLabel.Text; }
            set { uxLabel.Text = value; }
        }
        public string Answer
        {
            get { return uxRadioList.SelectedItem.Text; }
            set { uxRadioList.SelectedItem.Text = value; }
        }

        public string Items
        {
            get { return uxRadioList.Items.ToString() ; }
            set { LoadRadioList(value); }
        }

        private void LoadRadioList(string items )
        {
            uxRadioList.Items.Clear();
            string buffer = null;
            foreach (char letter in items)
            {
                if (letter != ';')
                    buffer += letter;
                else
                {
                    uxRadioList.Items.Add(buffer);

                    buffer = null;
                }
            }
        }
    }
}
namespace CST65Project
{ 
    public partial class EssayQuestion : System.Web.UI.UserControl, ITestQuestion
    {
        public string QuestionText
        {
            get { return uxLabel.Text; }
            set { uxLabel.Text = value; }
        }
        public string Answer
        {
            get { return uxTextBox.Text; }
            set { uxTextBox.Text = value; }
        }
    }
}
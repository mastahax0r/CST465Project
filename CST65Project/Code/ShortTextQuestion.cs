
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CST65Project
{
    public class ShortTextQuestion : CompositeControl, ITestQuestion
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

        Label uxLabel = new Label();
        TextBox uxTextBox = new TextBox();
        RequiredFieldValidator valTextBox = new RequiredFieldValidator();

        protected override void CreateChildControls()
        {
            
            base.CreateChildControls();

            //uxServerLabel = new Label();
            uxLabel.ID = "uxServerLabel";
            Controls.Add(uxLabel);

            //uxServerTextBox = new TextBox();
            uxTextBox.ID = "uxTextBox";
            Controls.Add(uxTextBox);

            //valServerRFV = new RequiredFieldValidator();
            valTextBox.ID = "valTextBox";
            valTextBox.ControlToValidate = "uxTextBox";
            valTextBox.Display = ValidatorDisplay.Dynamic;
            valTextBox.Text = "*";
            Controls.Add(valTextBox);
        }
    }
}
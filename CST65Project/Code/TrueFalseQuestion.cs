
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CST65Project
{
    public class TrueFalseQuestion : CompositeControl, ITestQuestion
    {
        public string QuestionText
        {
            get { return uxLabel.Text; }
            set { uxLabel.Text = value; }
        }

        public string Answer
        {
            get { return uxRadioList.SelectedValue; }
            set { uxRadioList.SelectedValue = value; }
        }

        Label uxLabel = new Label();
        RadioButtonList uxRadioList = new RadioButtonList();
        RequiredFieldValidator valRadioList = new RequiredFieldValidator();

        protected override void CreateChildControls()
        {
            
            base.CreateChildControls();

            //uxServerLabel = new Label();
            uxLabel.ID = "uxServerLabel";
            Controls.Add(uxLabel);

            //valServerRFV = new RequiredFieldValidator();
            valRadioList.ID = "valRadioList";
            valRadioList.ControlToValidate = "uxRadioList";
            valRadioList.Display = ValidatorDisplay.Dynamic;
            valRadioList.Text = "*";
            Controls.Add(valRadioList);

            //uxServerTextBox = new TextBox();
            uxRadioList.ID = "uxRadioList";
            uxRadioList.Items.Add("True");
            uxRadioList.Items.FindByText("True").Value = "true";
            uxRadioList.Items.Add("False");
            uxRadioList.Items.FindByText("False").Value = "false";
            Controls.Add(uxRadioList);
        }
    }
}
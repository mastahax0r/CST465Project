
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
            uxRadioList.Items.Add("Yes, birds are like that.");
            uxRadioList.Items.FindByText("Yes, birds are like that.").Value = "true";
            uxRadioList.Items.Add("No one is angry all the time.");
            uxRadioList.Items.FindByText("No one is angry all the time.").Value = "false";
            Controls.Add(uxRadioList);
        }
    }
}
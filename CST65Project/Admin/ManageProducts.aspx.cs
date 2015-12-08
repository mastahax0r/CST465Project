using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace CST65Project.Admin
{
    public partial class ManageProducts : System.Web.UI.Page
    {
        protected List<string> modes = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            modes.Add("Insert a New Product");
            modes.Add("Update a Current Product");
            if (displayMode.Text == "x")
                displayMode.Text = modes[0];
            if (toggleForm.Text == "x")
                toggleForm.Text = modes[1];
        }

        protected void toggleForm_Click(object sender, EventArgs e)
        {
            displayMode.Text = (displayMode.Text == modes[1] ? modes[0] : modes[1]);
            toggleForm.Text = (toggleForm.Text == modes[0] ? modes[1] : modes[0]);
            updateProductForm.Visible = (updateProductForm.Visible ? false : true);
            insertProductForm.Visible = (insertProductForm.Visible ? false : true);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CST65Project.Admin
{
    public partial class UserManagement : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            populateRolesListBox();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //populateRolesListBox();

               if (!User.IsInRole("Admins"))
               {
                   Roles.AddUserToRole(User.Identity.Name, "Admins");
               }
        }

        protected void populateRolesListBox()
        {
            uxRolesLB.Items.Clear();
            
            foreach( String aRole in Roles.GetAllRoles() )
            {
                uxRolesLB.Items.Add(aRole);
            }   
        }

        //When the "Add Role" button is clicked, first check if the role exists (Roles.RoleExists()) and if not, create the role (Roles.CreateRole())

        protected void uxRoleSubmitButton_Click(object sender, EventArgs e)
        {
            if(!Roles.RoleExists(uxRoleTB.Text))
            {
                Roles.CreateRole(uxRoleTB.Text);
                populateRolesListBox();
            }
        }
    }
}
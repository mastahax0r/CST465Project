using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CST65Project
{
    public partial class Blog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.User.Identity.IsAuthenticated)
            {
                MembershipUser user = Membership.GetUser();
                //dsBlog.InsertParameters.Add(new Parameter("Author", DbType.Guid, ((Guid)user.ProviderUserKey).ToString()));
                blagInsertUpdate.InsertParameters.Add(new Parameter("Author", DbType.Guid, ((Guid)user.ProviderUserKey).ToString()));
               // blagInsertUpdate.InsertParameters.Add(new Parameter("Title", DbType.String, "fuck"));
               // blagInsertUpdate.InsertParameters.Add(new Parameter("Content", DbType.String, "fuck2"));
            }
        }
    }
}
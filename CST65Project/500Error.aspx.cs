﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CST65Project
{
    public partial class _500Error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            errorSource.Text = Request.QueryString.ToString();
            Response.StatusCode = 500;
        }
    }
}
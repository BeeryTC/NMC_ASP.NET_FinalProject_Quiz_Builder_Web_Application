using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/*
    Bethany Beery
    Final Web App
    Created 4/12/2014
    Northwestern Michigan College
    CIT218 ASP.NET
    Instructor John Valis
 
    Page for new users to create an account
 */

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void submitNewUserInfo_Click(object sender, EventArgs e)
    {
        // If valid
        // Show some type of success message... ?
        Response.Redirect("Default.aspx");
    }
}
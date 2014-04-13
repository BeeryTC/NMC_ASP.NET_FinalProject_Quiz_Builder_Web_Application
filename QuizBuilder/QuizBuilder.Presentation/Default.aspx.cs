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
 
    Initial home page for users to log in or create an account
 */

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_loginUser_Click(object sender, EventArgs e)
    {
        // Check email and password against database
        
        // If correct, redirect to user landing page
        
        // Else, redirect user to register for an account
        // Response.Redirect("Register.aspx");
    }
}
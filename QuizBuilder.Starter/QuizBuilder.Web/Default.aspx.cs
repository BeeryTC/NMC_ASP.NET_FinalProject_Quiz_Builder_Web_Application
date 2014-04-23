using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QuizBuilder.Data;
using System.Configuration;

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
        UserRepository userR = new UserRepository();
        string password = txt_PasswordLogin.Text;
        string user = txt_UserLogin.Text;
        var obj = userR.GetUser(user, password);

            if (obj.IsAdmin == true)
                //navigate and set admin
                Response.Redirect("Admin_Home.aspx");
            else
                //navigate and set user
                Response.Redirect("User_Home.aspx");
        }
    }


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
        QuizBuilder.AuthenticateUser auth = new QuizBuilder.AuthenticateUser();
        User obj = new User();
        obj.Password = txt_PasswordLogin.Text;
        obj.Email = txt_EmailLogin.Text;
        
        UserRepository userR = new UserRepository();
        userR.GetUser(obj.Email, obj.Password);

        //auth.IsValidUser(obj.Email, obj.Password);

        if (obj.IsAdmin == true)
        //if(auth.IsValidUser == true)
        {
            //navigate and set admin
            Response.Redirect("Admin_Home.aspx");
        }
        else if (obj.IsAdmin == false)
        {
            //navigate and set user
            Response.Redirect("User_Home.aspx");
        }

        else
        {
            Response.Redirect("Register.aspx");
        }
    }

}
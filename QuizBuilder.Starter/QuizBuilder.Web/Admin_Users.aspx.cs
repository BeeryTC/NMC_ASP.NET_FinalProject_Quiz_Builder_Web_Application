using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QuizBuilder;
using QuizBuilder.Data;
using System.Data;


/*
    Bethany Beery
    Final Web App
    Created 4/12/2014
    Northwestern Michigan College
    CIT218 ASP.NET
    Instructor John Valis
 
    Admins can perform CRUD operations to manage users
 */

public partial class Admin_Users : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        Panel1.Visible = false;
    }
    protected void btnAddUser_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
    }

    protected void submitNewUserInfo_Click(object sender, EventArgs e)
    {
        using (QuizBuilderEntities QBContext = new QuizBuilderEntities())
        {
            User obj = new User();
            obj.FirstName = txtFirstName.Text;
            obj.LastName = txtLastName.Text;
            obj.UserName = txtUserName.Text;
            obj.Password = txtPassword.Text;
            obj.Email = txtEmail.Text;

            UserRepository uR = new UserRepository();
            uR.SaveUser(obj);

            Response.Redirect("Admin_Users.aspx");
        }

        clearInputControls();
    }

    void clearInputControls()
    {
        txtFirstName.Text = string.Empty;
        txtLastName.Text = string.Empty;
        txtUserName.Text = string.Empty;
        txtPassword.Text = string.Empty;
    }
}

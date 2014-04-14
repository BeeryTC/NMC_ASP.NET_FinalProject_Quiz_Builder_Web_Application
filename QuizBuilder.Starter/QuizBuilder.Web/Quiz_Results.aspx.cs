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
 
    Users can view their results and a history of their past quiz attempts
 */

public partial class Quiz_Results : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //lblResponseValue1.Text = Session["Q1_UserAnswer"].ToString();
        //lblResponseValue2.Text = Session["Q2_UserAnswer"].ToString();
        //lblResponseValue3.Text = Session["Q3_UserAnswer"].ToString();

        //  userName_label.Text = Session["FirstName"].ToString();

        //if ( Session["Q1_UserAnswer"] == )
    }
    protected void btn_retakeQuiz_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/QuizBuilder.Web/LogOut.aspx");
    }
    protected void btn_logOut_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/QuizBuilder.Web/Quiz.aspx");
    }
}
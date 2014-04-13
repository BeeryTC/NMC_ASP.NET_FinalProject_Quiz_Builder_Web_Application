<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/User.master" AutoEventWireup="true" CodeFile="User_Home.aspx.cs" Inherits="User_Home" %>

<asp:Content ID="User_Intro" ContentPlaceHolderID="Content_Intro" runat="server">
    <!--
    Bethany Beery
    Final Web App
    Created 4/12/2014
    Northwestern Michigan College
    CIT218 ASP.NET
    Instructor John Valis

    First page quiz taker users see when logging in
    -->
    
    <section>
    <h1>WELCOME USER</h1>
             <h3>
             MTA Exam 98-363 Web Development Fundamentals
            </h3>
    </section>
</asp:Content>

<asp:Content ID="User_TakeQuiz" ContentPlaceHolderID="Content_LeftColumn" runat="server">
    <article>
    <a runat="server" href="User_Quizzes.aspx"><img src="Images/admin_users.png"></a> 
    <br> 
    <br>
    <a runat="server" href="User_Quizzes.aspx"><h2>TAKE QUIZ</h2></a>
             <h3>
             Practice, practice, practice
            </h3>
    </article>
</asp:Content>

<asp:Content ID="User_QuizResults" ContentPlaceHolderID="Content_MiddleColumn" runat="server">
    <article>
    <a runat="server" href="~/ManageQuiz"><img src="Images/admin_users.png" /></a>
    <br> 
    <br>
    <a runat="server" href="~/ManageQuiz"><h2>VIEW QUIZ SCORES</h2></a>
             <h3>
             See your quiz scores
            </h3>
    </article>
</asp:Content>

<asp:Content ID="User_MTA" ContentPlaceHolderID="Content_RightColumn" runat="server">
    <article>
    <a runat="server" href="~/MTAExamDetails"><img src="Images/admin_users.png"></a>  
    <br> 
    <br>
    <a runat="server" href="~/MTAExamDetails"><h2>MTA EXAM DETAILS</h2></a>
             <h3>
             Skills measured
            </h3>
    </article>
</asp:Content>


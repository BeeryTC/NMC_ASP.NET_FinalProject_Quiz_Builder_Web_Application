<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/UserHome.master" AutoEventWireup="true" CodeFile="User_Home.aspx.cs" Inherits="User_Home" %>

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
                 <h4>
                 MTA Exam 98-363 Web Development Fundamentals
                </h4>
        </section>
</asp:Content>

<asp:Content ID="User_Left" ContentPlaceHolderID="Content_LeftColumn" runat="server">
    <article>
    <a runat="server" href="Take_Quiz.aspx"><img src="Images/admin_users.png"></a> 
    <br> 
    <br>
    <a runat="server" href="Take_Quiz.aspx"><h2>TAKE QUIZ</h2></a>
             <h3>
              Practice, practice, practice
            </h3>
    </article>
</asp:Content>

<asp:Content ID="User_Middle" ContentPlaceHolderID="Content_MiddleColumn" runat="server">
    <article>
    <a runat="server" href="Quiz_Results.aspx"><img src="Images/admin_users.png" /></a>
    <br> 
    <br>
    <a runat="server" href="Admin_Quiz.aspx"><h2>VIEW QUIZ SCORES</h2></a>
             <h3>
             See your quiz scores
            </h3>
    </article>
</asp:Content>

<asp:Content ID="User_Right" ContentPlaceHolderID="Content_RightColumn" runat="server">
    <article>
    <a runat="server" href="https://www.microsoft.com/learning/en-us/exam-98-363.aspx"><img src="Images/admin_users.png"></a>  
    <br> 
    <br>
    <a runat="server" href="https://www.microsoft.com/learning/en-us/exam-98-363.aspx"><h2>MTA EXAM DETAILS</h2></a>
             <h3>
             Skills measured
            </h3>
    </article>
</asp:Content>


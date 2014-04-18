<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/AdminHome.master" AutoEventWireup="true" CodeFile="Admin_Home.aspx.cs" Inherits="Admin_Home" %>

<asp:Content ID="Admin_Intro" ContentPlaceHolderID="Content_Intro" runat="server">
    
    <!--
    Class: CIT218 ASP.NET
    Instructor: John Velis
    Created by: Bethany Beery
    Date Created: 3/2/2014
    First page administrators see when logging in
    -->
    
    <section>
    <h1>WELCOME ADMIN</h1>
             <h4>
             MTA Exam 98-363 Web Development Fundamentals
            </h4>
    </section>
</asp:Content>

<asp:Content ID="Admin_Left" ContentPlaceHolderID="Content_LeftColumn" runat="server">
    <article>
    <a runat="server" href="Admin_Users.aspx"><img src="Images/admin_users.png"></a> 
    <br> 
    <br>
    <a runat="server" href="Admin_Users.aspx"><h3>MANAGE USERS</h3></a>
             <h4>
             Update, delete, and view user's quiz results
            </h4>
    </article>
</asp:Content>

<asp:Content ID="Admin_Middle" ContentPlaceHolderID="Content_MiddleColumn" runat="server">
    <article>
    <a runat="server" href="Admin_Quiz.aspx"><img src="Images/admin_users.png" /></a>
    <br> 
    <br>
    <a runat="server" href="Admin_Quiz.aspx"><h3>MANAGE QUIZ</h3></a>
             <h4>
             Modify, add, and delete quiz content
            </h4>
    </article>
</asp:Content>

<asp:Content ID="Admin_Right" ContentPlaceHolderID="Content_RightColumn" runat="server">
    <article>
    <a runat="server" href="https://www.microsoft.com/learning/en-us/exam-98-363.aspx"><img src="Images/admin_users.png"></a>  
    <br> 
    <br>
    <a runat="server" href="https://www.microsoft.com/learning/en-us/exam-98-363.aspx"><h3>MTA EXAM DETAILS</h3></a>
             <h4>
             Skills measured
            </h4>
    </article>
</asp:Content>



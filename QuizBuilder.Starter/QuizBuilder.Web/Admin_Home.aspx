<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/Admin.master" AutoEventWireup="true" CodeFile="Admin_Home.aspx.cs" Inherits="Admin_Home" %>

<asp:Content ID="Admin_Intro" ContentPlaceHolderID="Content_Intro" runat="server">
    
    <!--
    Bethany Beery
    Final Web App
    Created 4/12/2014
    Northwestern Michigan College
    CIT218 ASP.NET
    Instructor John Valis

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

<asp:Content ID="Admin_Right" ContentPlaceHolderID="Content_RightColumn" runat="server">
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




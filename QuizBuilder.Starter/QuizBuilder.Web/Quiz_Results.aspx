<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/User.master" AutoEventWireup="true" CodeFile="Quiz_Results.aspx.cs" Inherits="Quiz_Results" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content_Intro" runat="server">

    <!--
    Class: CIT218 ASP.NET
    Instructor: John Velis
    Created by: Bethany Beery
    Project: Quizer Builder Application: Server and Validation Controls
    Date Created: 4/14/2014

    Quiz results page - users will find out their score
    
    -->

     </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content_Scenario" runat="server">
     <h2><asp:Label ID="userName_label" runat="server" Text="User"></asp:Label> </h2>
    <h2>You scored a </h2>
    <h2><asp:Label ID="score_label" runat="server" Text="Score"></asp:Label>
        on your quiz</h2>
    <br />
    <br />
   <form ID="form1" runat="server" style="height: 431px">    

            <h2>Question 1:</h2>
            <asp:Label ID="lblResponseValue1" runat="server"></asp:Label>
            <h2>Question 2:</h2>
            <asp:Label ID="lblResponseValue2" runat="server"></asp:Label>
            <h2>Question 3:</h2>
            <asp:Label ID="lblResponseValue3" runat="server"></asp:Label>
            <asp:Label ID="lblResult1" runat="server"></asp:Label>

     <br />
     <asp:Button ID="btn_retakeQuiz" runat="server" 
                                    Text="RETAKE QUIZ" 
                                    Width ="100px" 
                                    OnClick="btn_retakeQuiz_Click" />
         <br />
     <asp:Button ID="btn_logOut" runat="server" 
                                    Text="LOG OUT" 
                                    Width ="100px" 
                                    OnClick="btn_logOut_Click"/>
</form>
</asp:Content>



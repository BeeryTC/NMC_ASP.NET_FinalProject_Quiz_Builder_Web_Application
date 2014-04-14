<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/User.master" AutoEventWireup="true" CodeFile="Take_Quiz.aspx.cs" Inherits="Take_Quiz" %>

<asp:Content ID="Quiz_Content" ContentPlaceHolderID="Content_Intro" runat="server">
  
    <!--
    Class: CIT218 ASP.NET
    Instructor: John Velis
    Created by: Bethany Beery
    Project: Quizer Builder Application: Server and Validation Controls
    Date Created: 3/6/2014

    Quiz page for users to take a quiz
    
    -->  

       <h1>Hello 
            <asp:Label ID="userName_label" runat="server"></asp:Label>
        </h1>
        <br />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content_Scenario" runat="server"> 
    <div id="top_row">
    <form id="quizform" runat="server">
     <h2>SCENARIO</h2>
     <h3>Cynthia has just assumed a new position as the lead designer for the campus website. She has a team 
        of 15 fellow students to help with the job. Her biggest challenge is to ensure that every page of the 
         website shares a common look and feel. The website has the potential of becoming a huge site and visitors
         must know that they are on the Tigers website no matter where they roam.
     </h3>
         <br>
               <ul>
                   <li> • The Tigers’ sports page contains many team pictures, schedules, and statistics.  </li> 
                   <li> • The library page contains tutoring schedules, book reviews, and new releases.  </li>
                   <li> • Every club is interested in posting their calendars and activities.  </li>
                   <li> • The news page contains recent news about events happening on campus.  </li>
                   <li> • Even faculty members want pages, and there are 108 teachers!  </li>
               </ul>
         <br>
         <br>

     <h2>QUESTIONS</h2>

<!-- QUESTION 1 -->       
         <h4>1.</h4><h2> What will be Cynthia's best stategy to accomplish her goals? </h2>

         <!-- RADIO BUTTON QUESTIONS -->
                <asp:RadioButtonList id="rb1" ValidationGroup="valGroup1" runat="server" OnSelectedIndexChanged="rb1_SelectedIndexChanged">
                 <asp:ListItem Value="1a" Text="a. enforce strict guidelines with the team" />
                 <asp:ListItem Value="1b" Text="b. be the chief editor of all the pages"/>
                 <asp:ListItem Value="1c" Text="c. teach the team to use Cascading Style Sheets (CSS)"/>
                </asp:RadioButtonList>
                
        <!-- VALIDATION -->
                <asp:RequiredFieldValidator id="ReqRadbtnAnswer"
                                            ControlToValidate="rb1" 
                                            ValidationGroup="ValGroup1"
                                            ErrorMessage="Please select an answer" 
                                            CssClass="error"
                                            runat="server" />
       <!-- SUBMIT BUTTON --> 
                <asp:Button ID="BtnQ1" runat="server" 
                                            Text="Submit Answer" 
                                            ValidationGroup="ValGroup1"
                                            Width ="114px" OnClick="BtnQ1_Click" />                                


<!-- QUESTION 2 -->
       <h4>2.</h4><h2> CSS is to HTML as... </h2>

       <!-- RADIO BUTTON QUESTIONS -->
                <asp:RadioButtonList id="rb2" ValidationGroup="valGroup2" runat="server" OnSelectedIndexChanged="rb2_SelectedIndexChanged">
                 <asp:ListItem Value="2a" Text="a. an outfit is to a person" />
                 <asp:ListItem Value="2b" Text="b. an apple is to an orange"/>
                 <asp:ListItem Value="2c" Text="c. a car is to the road"/>
                </asp:RadioButtonList>
                
       <!-- VALIDATION -->
                <asp:RequiredFieldValidator id="RequiredFieldValidator2"
                                            ControlToValidate="rb2" 
                                            ValidationGroup="ValGroup2"
                                            ErrorMessage="Please select an answer" 
                                            CssClass="error"
                                            runat="server" />
       <!-- SUBMIT BUTTON -->  
                <asp:Button ID="BtnQ2" runat="server" 
                                            Text="Submit Answer" 
                                            ValidationGroup="ValGroup2"
                                            Width ="114px" OnClick="BtnQ2_Click" />                               


<!-- QUESTION 3 -->
              <h4>2.</h4><h2> The primary goal of page layout for navigation is:.. </h2>

       <!-- RADIO BUTTON QUESTIONS -->
                <asp:RadioButtonList id="rb3" ValidationGroup="valGroup3" runat="server" OnSelectedIndexChanged="rb3_SelectedIndexChanged">
                 <asp:ListItem Value="3a" Text="a. to provide links to every page on every page of the site" />
                 <asp:ListItem Value="3b" Text="b. ease of use"/>
                 <asp:ListItem Value="3c" Text="c. to provide links to other sites"/>
                </asp:RadioButtonList>
                
       <!-- VALIDATION -->
                <asp:RequiredFieldValidator id="RequiredFieldValidator3"
                                            ControlToValidate="rb3" 
                                            ValidationGroup="ValGroup3"
                                            ErrorMessage="Please select an answer" 
                                            CssClass="error"
                                            runat="server" />
       <!-- SUBMIT BUTTON -->                                 
                <asp:Button ID="BtnQ3" runat="server" 
                                            Text="Submit Answer" 
                                            ValidationGroup="ValGroup3"
                                            Width ="114px" OnClick="BtnQ3_Click" />
        <br />
        <br />
        <br />
        <br />
       <asp:Button ID="btn_userQuizAnswer" runat="server" 
                                    Text="View Results" 
                                    Width ="114px" 
                                    OnClick="btn_userQuizAnswer_Click" />
          </form>
     </div>
 </asp:Content>



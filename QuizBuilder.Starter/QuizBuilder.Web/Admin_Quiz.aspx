<%@ Page Title="Quizzes" Language="C#" MasterPageFile="~/Master Pages/Admin.master" AutoEventWireup="true" CodeFile="Admin_Quiz.aspx.cs" Inherits="Admin_Quiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content_Intro" Runat="Server">

    <!--
    Class: CIT218 ASP.NET
    Instructor: John Velis
    Created by: Bethany Beery
    Project: Quizer Builder Application: Server and Validation Controls
    Date Created: 4/14/2014

    Admins can perform CRUD operations on quiz
    
    -->

        <section>
             <h1>MANAGE QUIZZES</h1>
             <h2>Add, Modify, and Delete Quiz Content</h2>
        </section>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content_Main" Runat="Server">
        <form id="formQuizCRUD" runat="server">
                       
<h1>SCENARIOS</h1>
        <!-- GRIDVIEW -->
                <asp:GridView ID="GridView_Scenarios" 
                          runat="server" 
                          AllowPaging="True" 
                          AllowSorting="False" 
                          AutoGenerateColumns="False" 
                          DataKeyNames="ScenarioID" 
                          DataSourceID="EDS_Scenarios"
                          CssClass="GV_Table"
                          PageSize="1">
                     <Columns>
                         <asp:CommandField ButtonType="Button" HeaderText="Edit" ShowDeleteButton="False" ShowEditButton="True" ShowHeader="True" />
                         <asp:CommandField ButtonType="Button" HeaderText="Delete" ShowDeleteButton="True" ShowEditButton="False" ShowHeader="True" />
                         <asp:BoundField DataField="ScenarioID" HeaderText="Scenario #" ReadOnly="True" SortExpression="ScenarioID" />
                         <asp:BoundField DataField="QuizID" HeaderText="Quiz #" SortExpression="QuizID" />
                         <asp:BoundField DataField="ScenarioSequence" HeaderText="Sequence" SortExpression="ScenarioSequence" />
                         <asp:BoundField DataField="ScenarioName" HeaderText="Scenario Name" SortExpression="ScenarioName" />
                         <asp:BoundField DataField="ScenarioText" HeaderText="Text" SortExpression="ScenarioText" />
                     </Columns>
                 </asp:GridView>

            <!-- DATA SOURCE -->
                <asp:EntityDataSource ID="EDS_Scenarios" runat="server" ConnectionString="name=QuizBuilderEntities" DefaultContainerName="QuizBuilderEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Scenarios" EntityTypeFilter="Scenario">
                </asp:EntityDataSource>
            
            <!-- ADD NEW BUTTON -->    
                <asp:Button ID="btnDisplayAddNewScenario" runat ="server" Text="Add Scenario" OnClick="btnDisplayAddNewScenario_Click" />


<!-- ADD A NEW SCENARIO -->
   <asp:Panel ID="PanelScenario" runat="server">
        <h3>CREATE A NEW SCENARIO</h3>
        <br>
            <table class="centerTable">
            <tr>
                <!--Label -->      <td><asp:Label ID="NewScenarioNameLabel" runat="server" AssociatedControlID="txtNewScenarioName">Scenario Name:</asp:Label></td>
       
                <!-- Text box -->  <td><asp:TextBox ID="txtNewScenarioName" runat="server"></asp:TextBox>
                                         <!-- Validation -->
                                         <asp:RequiredFieldValidator ID="ScenarioNameRequired" runat="server" 
                                                ControlToValidate="txtNewScenarioName" 
                                                ErrorMessage=" *Missing scenario name" 
                                                ToolTip="Add a new name scenario" 
                                                CssClass="error">
                                        </asp:RequiredFieldValidator>
                                   </td>
           </tr>

           <tr>
                <!--Label -->      <td><asp:Label ID="NewScenarioSeqLabel" runat="server" AssociatedControlID="txtNewScenarioSeq">Scenario Order #:</asp:Label></td>
       
                <!-- Text box -->  <td><asp:TextBox ID="txtNewScenarioSeq" runat="server"></asp:TextBox>
                                         <!-- Validation -->
                                         <asp:RequiredFieldValidator ID="ScenarioSeqRequired" runat="server" 
                                                ControlToValidate="txtNewScenarioSeq" 
                                                ErrorMessage=" *Missing sequence order number" 
                                                ToolTip="Give your scenario a sequence number" 
                                                CssClass="error">
                                        </asp:RequiredFieldValidator>
                                   </td>
           </tr>

           <tr>
                <!--Label -->      <td><asp:Label ID="NewScenarioTxtLabel" runat="server" AssociatedControlID="txtNewScenarioTxt">Scenario Text:</asp:Label></td>
       
                <!-- Text box -->  <td><asp:TextBox ID="txtNewScenarioTxt" runat="server"></asp:TextBox>
                                         <!-- Validation -->
                                         <asp:RequiredFieldValidator ID="ScenarioTxtRequired" runat="server" 
                                                ControlToValidate="txtNewScenarioTxt" 
                                                ErrorMessage=" *Please add a new scenario" 
                                                ToolTip="Add a new scenario." 
                                                CssClass="error">
                                        </asp:RequiredFieldValidator>
                                   </td>
           </tr>

          </table>
           <!-- BUTTON -->  
                <asp:Button ID="btnAddScenario" runat="server" 
                            Text="Add" 
                            OnClick="btnAddScenario_Click" />

           <asp:Button ID="btnCancelScenario" runat="server" 
                            Text="Cancel" 
                            OnClick="btnCancelScenario_Click" />

            </asp:Panel> 


<h1>QUESTIONS</h1>
            <!-- GRIDVIEW -->
                     <asp:GridView ID="GridView_Questions" 
                          runat="server" 
                          AllowPaging="True" 
                          AllowSorting="False" 
                          AutoGenerateColumns="False" 
                          DataKeyNames="QuestionID" 
                          DataSourceID="EDS_Questions"
                          CssClass="GV_Table"
                          PageSize="5">
                        <Columns>
                             <asp:CommandField ButtonType="Button" HeaderText="Edit" ShowDeleteButton="False" ShowEditButton="True" ShowHeader="True" />
                             <asp:CommandField ButtonType="Button" HeaderText="Delete" ShowDeleteButton="True" ShowEditButton="False" ShowHeader="True" />
                             <asp:BoundField DataField="QuestionID" HeaderText="Question #" ReadOnly="True" SortExpression="QuestionID" />
                             <asp:BoundField DataField="ScenarioID" HeaderText="Scenario #" SortExpression="ScenarioID" />
                             <asp:BoundField DataField="QuestionSequence" HeaderText="Sequence" SortExpression="QuestionSequence" />
                             <asp:BoundField DataField="QuestionText" HeaderText="Text" SortExpression="QuestionText" />
                        </Columns>
                    </asp:GridView>
           
             <!-- DATA SOURCE -->
                    <asp:EntityDataSource ID="EDS_Questions" runat="server" ConnectionString="name=QuizBuilderEntities" DefaultContainerName="QuizBuilderEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Questions">
                    </asp:EntityDataSource>
             
            <!-- ADD NEW BUTTON -->
                    <asp:Button ID="btnDisplayAddNewQuestion" runat="server" Text="Add Question" OnClick="btnDisplayAddNewQuestion_Click" />


<!-- ADD A NEW QUESTION -->
        <asp:Panel ID="PanelQuestion" runat="server">
        <h3>CREATE NEW QUESTIONS</h3>
        <br>
            <table class="centerTable">
            <tr>
                <!--Label -->      <td><asp:Label ID="NewQScenarioIDLabel" runat="server" AssociatedControlID="txtNewQScenarioID">Corresponding Scenario #:</asp:Label></td>
       
                <!-- Text box -->  <td><asp:TextBox ID="txtNewQScenarioID" runat="server"></asp:TextBox>
                                         <!-- Validation -->
                                         <asp:RequiredFieldValidator ID="QScenarioIDRequired" runat="server" 
                                                ControlToValidate="txtNewQScenarioID" 
                                                ErrorMessage=" *Missing scenario number" 
                                                ToolTip="Add a corresponding scenario number" 
                                                CssClass="error">
                                        </asp:RequiredFieldValidator>
                                   </td>
           </tr>

           <tr>
                <!--Label -->      <td><asp:Label ID="NewQSequenceNumbLabel" runat="server" AssociatedControlID="txtNewQSequenceNumb">Question Order #:</asp:Label></td>
       
                <!-- Text box -->  <td><asp:TextBox ID="txtNewQSequenceNumb" runat="server"></asp:TextBox>
                                         <!-- Validation -->
                                         <asp:RequiredFieldValidator ID="QSequenceNumbRequired" runat="server" 
                                                ControlToValidate="txtNewQSequenceNumb" 
                                                ErrorMessage=" *Missing sequence order number " 
                                                ToolTip="Give your question a sequence number" 
                                                CssClass="error">
                                        </asp:RequiredFieldValidator>
                                   </td>
           </tr>

           <tr>
                <!--Label -->      <td><asp:Label ID="NewQTxtLabel" runat="server" AssociatedControlID="txtNewQTxt">Question Text:</asp:Label></td>
       
                <!-- Text box -->  <td><asp:TextBox ID="txtNewQTxt" runat="server"></asp:TextBox>
                                         <!-- Validation -->
                                         <asp:RequiredFieldValidator ID="QTxtRequired" runat="server" 
                                                ControlToValidate="txtNewQTxt" 
                                                ErrorMessage=" *Please add a new question" 
                                                ToolTip="Add a new question" 
                                                CssClass="error">
                                        </asp:RequiredFieldValidator>
                                   </td>
           </tr>

          </table>
           <!-- BUTTONS -->  
                <asp:Button ID="btnAddQuestion" runat="server" 
                            Text="Add" 
                            OnClick="btnAddQuestion_Click" />

                <asp:Button ID="btnCancelQuestion" runat="server" 
                            Text="Cancel" 
                            OnClick="btnCancelQuestion_Click" />
            </asp:Panel> 


<h1>QUESTION CHOICES</h1>
        <!-- GRIDVIEW -->
                     <asp:GridView ID="GridView_SelectAnswer" 
                          CssClass="GV_Table"
                          runat="server" 
                          AllowPaging="True"
                          AllowSorting="false"
                          DataKeyNames="QuestionOptionID" 
                          DataSourceID="EDS_SelectAnswer"
                          PageSize="5"
                          AutoGenerateColumns="False" >
                         <Columns>
                            <asp:CommandField ButtonType="Button" HeaderText="Edit" ShowDeleteButton="False" ShowEditButton="True" ShowHeader="True" />
                            <asp:CommandField ButtonType="Button" HeaderText="Delete" ShowDeleteButton="True" ShowEditButton="False" ShowHeader="True" />                    
                            <asp:BoundField DataField="QuestionOptionID" HeaderText="ID" ReadOnly="True" SortExpression="QuestionOptionID" />
                            <asp:BoundField DataField="OptionSequence" HeaderText="Sequence Order" SortExpression="OptionSequence" />
                            <asp:BoundField DataField="OptionText" HeaderText="Text" SortExpression="OptionText" />
                            <asp:CheckBoxField DataField="IsCorrect" HeaderText="Correct Answer" SortExpression="IsCorrect" />
                        </Columns>
                      </asp:GridView>
       
             <!-- DATA SOURCE -->
                      <asp:EntityDataSource ID="EDS_SelectAnswer" runat="server" ConnectionString="name=QuizBuilderEntities" DefaultContainerName="QuizBuilderEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="QuestionOptions">
                      </asp:EntityDataSource>
             
            <!-- ADD NEW BUTTON -->                       
                      <asp:Button ID="btnDisplayAddNewQuestionChoice" CssClass="button" runat="server" Text="Add Question Choice" OnClick="btnDisplayAddNewQuestionChoice_Click" />

<!-- ADD NEW QUESTION CHOICES -->
        <asp:Panel ID="PanelQuestionChoice" runat="server">
        <h3>CREATE NEW QUESTION CHOICES</h3>
        <br>
            <table class="centerTable">
            <tr>
                <!--Label -->      <td><asp:Label ID="NewQCSequenceOrderLabel" runat="server" AssociatedControlID="txtNewQCSequenceOrde">Sequence Order #:</asp:Label></td>
       
                <!-- Text box -->  <td><asp:TextBox ID="txtNewQCSequenceOrder" runat="server"></asp:TextBox>
                                         <!-- Validation -->
                                         <asp:RequiredFieldValidator ID="QCSequenceOrderRequired" runat="server" 
                                                ControlToValidate="txtNewQCSequenceOrder" 
                                                ErrorMessage=" *Missing sequence number" 
                                                ToolTip="Add a sequence order number" 
                                                CssClass="error">
                                        </asp:RequiredFieldValidator>
                                   </td>
           </tr>

           <tr>
                <!--Label -->      <td><asp:Label ID="NewQCTextLabel" runat="server" AssociatedControlID="txtNewQCText">Question Choice Text:</asp:Label></td>
       
                <!-- Text box -->  <td><asp:TextBox ID="txtNewQCText" runat="server"></asp:TextBox>
                                         <!-- Validation -->
                                         <asp:RequiredFieldValidator ID="QCTextRequired" runat="server" 
                                                ControlToValidate="txtNewQCText" 
                                                ErrorMessage=" *Please add a question choice" 
                                                ToolTip="Add a new question choice" 
                                                CssClass="error">
                                        </asp:RequiredFieldValidator>
                                   </td>
           </tr>

          </table>
           <!-- BUTTONS -->  
                <asp:Button ID="btnAddQuestionChoice" runat="server" 
                            Text="Add" 
                            OnClick="btnAddQuestionChoice_Click" />

                <asp:Button ID="btnCancelQuestionChoice" runat="server" 
                            Text="Cancel" 
                            OnClick="btnCancelQuestionChoice_Click" />
            </asp:Panel>       
            
      </form>
</asp:Content>


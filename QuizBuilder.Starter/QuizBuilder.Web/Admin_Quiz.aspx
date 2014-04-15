<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/Admin.master" AutoEventWireup="true" CodeFile="Admin_Quiz.aspx.cs" Inherits="Admin_Quiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content_Intro" Runat="Server">
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
            
            <!-- ADD NEW -->    
                <asp:Button runat="server" Text="Add Scenario" />


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
             
            <!-- DATA SOURCE -->
                    <asp:Button runat="server" Text="Add Question" />


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
             
            <!-- ADD NEW -->                       
                      <asp:Button CssClass="button" runat="server" Text="Add Question Choice" />
       </form>
</asp:Content>


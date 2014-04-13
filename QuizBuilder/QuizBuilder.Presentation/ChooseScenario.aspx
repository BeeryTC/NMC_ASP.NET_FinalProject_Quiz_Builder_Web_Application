<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChooseScenario.aspx.cs" Inherits="ChooseScenario" %>

<!DOCTYPE html>
<!-- 
    Bethany Beery
    Final Web App
    Created 4/12/2014
    Northwestern Michigan College
    Instructor John Valis
-->

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Choose the Scenario<br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            DataSourceID="ScenarioListODS" DataTextField="ScenarioID" 
            DataValueField="ScenarioID">
        </asp:DropDownList>
        <asp:ObjectDataSource ID="ScenarioListODS" runat="server" 
            SelectMethod="GetScenarios" TypeName="QuizBuilder.Data.ScenarioRepository">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="quizID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
        Questions for the Scenario<br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="ScenarioQuestionsODS">
            <Columns>
                <asp:BoundField DataField="QuestionID" HeaderText="QuestionID" 
                    SortExpression="QuestionID" />
                <asp:BoundField DataField="ScenarioID" HeaderText="ScenarioID" 
                    SortExpression="ScenarioID" />
                <asp:BoundField DataField="QuestionSequence" HeaderText="QuestionSequence" 
                    SortExpression="QuestionSequence" />
                <asp:BoundField DataField="QuestionText" HeaderText="QuestionText" 
                    SortExpression="QuestionText" />
                <asp:CheckBoxField DataField="isRichText" HeaderText="isRichText" 
                    SortExpression="isRichText" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ScenarioQuestionsODS" runat="server" 
            SelectMethod="GetQuestions" TypeName="QuizBuilder.Data.QuestionRepository">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="0" 
                    Name="scenarioID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>

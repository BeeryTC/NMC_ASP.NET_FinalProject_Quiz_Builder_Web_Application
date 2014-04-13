<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QuestionList.aspx.cs" Inherits="QuestionList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Questions<br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="QuestionsEDS">
            <Columns>
                <asp:BoundField DataField="QuestionID" HeaderText="QuestionID" ReadOnly="True" 
                    SortExpression="QuestionID" />
                <asp:BoundField DataField="ScenarioID" HeaderText="ScenarioID" ReadOnly="True" 
                    SortExpression="ScenarioID" />
                <asp:BoundField DataField="QuestionText" HeaderText="QuestionText" 
                    ReadOnly="True" SortExpression="QuestionText" />
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
        <asp:EntityDataSource ID="QuestionsEDS" runat="server" 
            ConnectionString="name=QuizBuilderEntities" 
            DefaultContainerName="QuizBuilderEntities" EnableFlattening="False" 
            EntitySetName="Questions" 
            Select="it.[QuestionID], it.[ScenarioID], it.[QuestionText]">
        </asp:EntityDataSource>
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataSourceID="QuestionsODS">
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
        <asp:ObjectDataSource ID="QuestionsODS" runat="server" 
            SelectMethod="GetQuestions" TypeName="QuizBuilder.Data.QuestionRepository">
            <SelectParameters>
                <asp:Parameter DefaultValue="20" Name="scenarioID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>

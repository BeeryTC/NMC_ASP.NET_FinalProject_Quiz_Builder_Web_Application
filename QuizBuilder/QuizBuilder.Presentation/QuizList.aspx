<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QuizList.aspx.cs" Inherits="QuizList" %>

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
    
        Quiz List<br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="QuizListEDS">
            <Columns>
                <asp:BoundField DataField="QuizID" HeaderText="QuizID" ReadOnly="True" 
                    SortExpression="QuizID" />
                <asp:BoundField DataField="QuizName" HeaderText="QuizName" ReadOnly="True" 
                    SortExpression="QuizName" />
                <asp:BoundField DataField="Title" HeaderText="Title" ReadOnly="True" 
                    SortExpression="Title" />
                <asp:BoundField DataField="Description" HeaderText="Description" 
                    ReadOnly="True" SortExpression="Description" />
            </Columns>
        </asp:GridView>
        <asp:EntityDataSource ID="QuizListEDS" runat="server" 
            ConnectionString="name=QuizBuilderEntities" 
            DefaultContainerName="QuizBuilderEntities" EnableFlattening="False" 
            EntitySetName="Quizzes" 
            Select="it.[QuizID], it.[QuizName], it.[Title], it.[Description]">
        </asp:EntityDataSource>
    
    </div>
    </form>
</body>
</html>

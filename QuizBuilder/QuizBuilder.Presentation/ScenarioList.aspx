<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ScenarioList.aspx.cs" Inherits="ScenarioList" %>

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
    
        Scenarios<br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="ScenariosEDS">
            <Columns>
                <asp:BoundField DataField="ScenarioID" HeaderText="ScenarioID" ReadOnly="True" 
                    SortExpression="ScenarioID" />
                <asp:BoundField DataField="ScenarioName" HeaderText="ScenarioName" 
                    ReadOnly="True" SortExpression="ScenarioName" />
                <asp:BoundField DataField="ScenarioText" HeaderText="ScenarioText" 
                    ReadOnly="True" SortExpression="ScenarioText" />
            </Columns>
        </asp:GridView>
        <asp:EntityDataSource ID="ScenariosEDS" runat="server" 
            ConnectionString="name=QuizBuilderEntities" 
            DefaultContainerName="QuizBuilderEntities" EnableFlattening="False" 
            EntitySetName="Scenarios" 
            Select="it.[ScenarioID], it.[ScenarioName], it.[ScenarioText]">
        </asp:EntityDataSource>
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataSourceID="ScenariosODS">
            <Columns>
                <asp:BoundField DataField="ScenarioID" HeaderText="ScenarioID" 
                    SortExpression="ScenarioID" />
                <asp:BoundField DataField="QuizID" HeaderText="QuizID" 
                    SortExpression="QuizID" />
                <asp:BoundField DataField="ScenarioSequence" HeaderText="ScenarioSequence" 
                    SortExpression="ScenarioSequence" />
                <asp:BoundField DataField="ScenarioName" HeaderText="ScenarioName" 
                    SortExpression="ScenarioName" />
                <asp:BoundField DataField="ScenarioText" HeaderText="ScenarioText" 
                    SortExpression="ScenarioText" />
                <asp:CheckBoxField DataField="IsRichText" HeaderText="IsRichText" 
                    SortExpression="IsRichText" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ScenariosODS" runat="server" 
            SelectMethod="GetScenarios" TypeName="QuizBuilder.Data.ScenarioRepository">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="quizID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>

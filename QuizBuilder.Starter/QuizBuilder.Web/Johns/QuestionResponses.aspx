<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QuestionResponses.aspx.cs" Inherits="QuestionResponses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Question Responses<br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="QuestionResponseID" DataSourceID="QuestionResponsesEDS">
            <Columns>
                <asp:BoundField DataField="QuestionResponseID" HeaderText="QuestionResponseID" 
                    ReadOnly="True" SortExpression="QuestionResponseID" />
                <asp:BoundField DataField="QuizAttemptID" HeaderText="QuizAttemptID" 
                    SortExpression="QuizAttemptID" />
                <asp:BoundField DataField="QuestionOptionID" HeaderText="QuestionOptionID" 
                    SortExpression="QuestionOptionID" />
                <asp:BoundField DataField="QuestionID" HeaderText="QuestionID" 
                    SortExpression="QuestionID" />
                <asp:CheckBoxField DataField="IsCorrect" HeaderText="IsCorrect" 
                    SortExpression="IsCorrect" />
                <asp:CheckBoxField DataField="UserReviewFlag" HeaderText="UserReviewFlag" 
                    SortExpression="UserReviewFlag" />
            </Columns>
        </asp:GridView>
        <asp:EntityDataSource ID="QuestionResponsesEDS" runat="server" 
            ConnectionString="name=QuizBuilderEntities" 
            DefaultContainerName="QuizBuilderEntities" EnableFlattening="False" 
            EntitySetName="QuestionResponses">
        </asp:EntityDataSource>
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataSourceID="QuestionResponseODS">
            <Columns>
                <asp:BoundField DataField="QuestionResponseID" HeaderText="QuestionResponseID" 
                    SortExpression="QuestionResponseID" />
                <asp:BoundField DataField="QuizAttemptID" HeaderText="QuizAttemptID" 
                    SortExpression="QuizAttemptID" />
                <asp:BoundField DataField="QuestionOptionID" HeaderText="QuestionOptionID" 
                    SortExpression="QuestionOptionID" />
                <asp:BoundField DataField="QuestionID" HeaderText="QuestionID" 
                    SortExpression="QuestionID" />
                <asp:CheckBoxField DataField="IsCorrect" HeaderText="IsCorrect" 
                    SortExpression="IsCorrect" />
                <asp:CheckBoxField DataField="UserReviewFlag" HeaderText="UserReviewFlag" 
                    SortExpression="UserReviewFlag" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="QuestionResponseODS" runat="server" 
            SelectMethod="GetQuestionResponses" 
            TypeName="QuizBuilder.Data.QuestionResponseRepository">
            <SelectParameters>
                <asp:CookieParameter CookieName="CookieQuizAttempt" DefaultValue="45" 
                    Name="quizAttemptID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
    
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QuestionOptions.aspx.cs" Inherits="QuestionOptions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Question Options<br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="QuestionOptionsEDS">
            <Columns>
                <asp:BoundField DataField="QuestionID" HeaderText="QuestionID" ReadOnly="True" 
                    SortExpression="QuestionID" />
                <asp:BoundField DataField="OptionText" HeaderText="OptionText" ReadOnly="True" 
                    SortExpression="OptionText" />
            </Columns>
        </asp:GridView>
        <asp:EntityDataSource ID="QuestionOptionsEDS" runat="server" 
            ConnectionString="name=QuizBuilderEntities" 
            DefaultContainerName="QuizBuilderEntities" EnableFlattening="False" 
            EntitySetName="QuestionOptions" Select="it.[QuestionID], it.[OptionText]">
        </asp:EntityDataSource>
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataSourceID="QuestionOptionsODS">
            <Columns>
                <asp:BoundField DataField="QuestionID" HeaderText="QuestionID" 
                    SortExpression="QuestionID" />
                <asp:BoundField DataField="OptionText" HeaderText="OptionText" 
                    SortExpression="OptionText" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="QuestionOptionsODS" runat="server" 
            SelectMethod="GetQuestionOptions" 
            TypeName="QuizBuilder.Data.QuestionOptionRepository">
            <SelectParameters>
                <asp:CookieParameter CookieName="CookieQuestionID" DefaultValue="4" 
                    Name="questionID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>

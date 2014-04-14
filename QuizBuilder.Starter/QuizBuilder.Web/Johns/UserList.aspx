<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserList.aspx.cs" Inherits="UserList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        UserList<br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="UserID" DataSourceID="UserListEDS">
            <Columns>
                <asp:BoundField DataField="UserID" HeaderText="UserID" ReadOnly="True" 
                    SortExpression="UserID" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                    SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" 
                    SortExpression="LastName" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" 
                    SortExpression="UserName" />
                <asp:BoundField DataField="Password" HeaderText="Password" 
                    SortExpression="Password" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:CheckBoxField DataField="IsAdmin" HeaderText="IsAdmin" 
                    SortExpression="IsAdmin" />
            </Columns>
        </asp:GridView>
        <asp:EntityDataSource ID="UserListEDS" runat="server" 
            ConnectionString="name=QuizBuilderEntities" 
            DefaultContainerName="QuizBuilderEntities" EnableFlattening="False" 
            EntitySetName="Users">
        </asp:EntityDataSource>
    
        <br />
        UserList2<br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataSourceID="UserListODS">
            <Columns>
                <asp:BoundField DataField="UserID" HeaderText="UserID" 
                    SortExpression="UserID" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                    SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" 
                    SortExpression="LastName" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" 
                    SortExpression="UserName" />
                <asp:BoundField DataField="Password" HeaderText="Password" 
                    SortExpression="Password" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:CheckBoxField DataField="IsAdmin" HeaderText="IsAdmin" 
                    SortExpression="IsAdmin" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="UserListODS" runat="server" SelectMethod="GetUsers" 
            TypeName="QuizBuilder.Data.UserRepository"></asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>

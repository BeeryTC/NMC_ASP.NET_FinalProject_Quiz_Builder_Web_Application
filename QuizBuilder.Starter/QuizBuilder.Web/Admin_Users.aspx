<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/Admin.master" AutoEventWireup="true" CodeFile="Admin_Users.aspx.cs" Inherits="Admin_Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content_Intro" Runat="Server">

    <!--
    Class: CIT218 ASP.NET
    Instructor: John Velis
    Created by: Bethany Beery
    Project: Quizer Builder Application: Server and Validation Controls
    Date Created: 4/14/2014

    Admins can perform CRUD operations on users
    
    -->

    <section>
         <h1>MANAGE USERS</h1>
         <h2>Add, Modify, and Delete Users</h2>
    </section>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content_Main" Runat="Server">
    <form id="form1" runat="server">
    <div>
     <!-- GRIDVIEW -->
            <asp:GridView ID="GridView_CRUDUsers" runat="server" 
                 CssClass="GV_Table"
                 PageSize="5"
                 AllowPaging="True" 
                 AllowSorting="false"
                 AutoGenerateColumns="False" 
                 DataKeyNames="UserID" 
                 DataSourceID="EntityDataSource1">
                <Columns>
                     <asp:CommandField ButtonType="Button" HeaderText="Edit" ShowDeleteButton="False" ShowEditButton="True" ShowHeader="True" />
                     <asp:CommandField ButtonType="Button" HeaderText="Delete" ShowDeleteButton="True" ShowEditButton="False" ShowHeader="True" />                     
                     <asp:BoundField DataField="UserID" HeaderText="UserID" ReadOnly="True" SortExpression="UserID" />
                     <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                     <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                     <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="UserName" />
                     <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                     <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                     <asp:CheckBoxField DataField="IsAdmin" HeaderText="Adminstrator" SortExpression="IsAdmin" />
                     </Columns>
            </asp:GridView>

    <!-- DATA SOURCE -->
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=QuizBuilderEntities" DefaultContainerName="QuizBuilderEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Users" EntityTypeFilter="User">
            </asp:EntityDataSource>
    
        <!-- ADD NEW BUTTON -->
            <asp:Button ID="btnAddUser" runat="server" Text="Add User" OnClick="btnAddUser_Click" />

        <asp:Panel ID="Panel1" runat="server" Height="485px">
        <h3>CREATE A NEW USER</h3>
        <br>
            <table class="centerTable">
            <!-- FIRST NAME -->
            <tr>
                <!--Label -->      <td><asp:Label ID="FirstNameLabel" runat="server" AssociatedControlID="txtFirstName">First Name:</asp:Label></td>
       
                <!-- Text box -->  <td><asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                                         <!-- Validation -->
                                         <asp:RequiredFieldValidator ID="FirstNameRequired" runat="server" 
                                                ControlToValidate="txtFirstName" 
                                                ErrorMessage="First Name is required." 
                                                ToolTip="First Name is required." 
                                                CssClass="error"
                                                ValidationGroup="formRegistration">* 
                                         </asp:RequiredFieldValidator>
                                  </td>
           </tr>

            <!-- LAST NAME -->
            <tr>
                <!--Label -->      <td><asp:Label ID="LastNameLabel" runat="server" AssociatedControlID="txtLastName">Last Name:</asp:Label></td>
       
                <!-- Text box -->  <td><asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                                         <!-- Validation -->
                                         <asp:RequiredFieldValidator ID="LastNameRequired" runat="server" 
                                                ControlToValidate="txtLastName" 
                                                ErrorMessage="Last Name is required." 
                                                ToolTip="Last Name is required." 
                                                CssClass="error"
                                                ValidationGroup="formRegistration">* 
                                         </asp:RequiredFieldValidator>
                                  </td>
           </tr>

           <!-- USER NAME -->
            <tr>
                <!--Label -->      <td><asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="txtUserName">User Name:</asp:Label></td>
       
                <!-- Text box -->  <td><asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                                         <!-- Validation -->
                                         <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                ControlToValidate="txtUserName" 
                                                ErrorMessage="User Name is required." 
                                                ToolTip="User Name is required." 
                                                CssClass="error"
                                                ValidationGroup="formRegistration">* <!--Matches ID -->
                                         </asp:RequiredFieldValidator>
                                  </td>
           </tr>

          <!-- PASSWORD -->
           <tr>
               <!--Label -->      <td><asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="txtPassword">Password:</asp:Label></td>
              
               <!-- Text box -->  <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                                         <!-- Validation -->
                                         <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                ControlToValidate="txtPassword" 
                                                ErrorMessage="Password is required." 
                                                ToolTip="Password is required."
                                                CssClass="error" 
                                                ValidationGroup="formRegistration">*
                                         </asp:RequiredFieldValidator>
                                   </td>
          </tr>

         <!-- CONFIRM PASSWORD -->
          <tr>
               <!--Label -->      <td><asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="txtConfirmPassword">Confirm Password: </asp:Label></td>
                                                
               <!-- Text box -->  <td><asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                        <!-- Validation -->                 
                                        <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                               ControlToValidate="txtConfirmPassword" 
                                               ErrorMessage="Confirm Password is required." 
                                               ToolTip="Confirm Password is required." 
                                               CssClass="error"
                                               ValidationGroup="formRegistration">*
                                        </asp:RequiredFieldValidator>
                                  </td>
          </tr>
                                            
        <!-- EMAIL -->                                      
          <tr>                                       
               <!--Label -->      <td><asp:Label ID="EmailLabel" runat="server" AssociatedControlID="txtEmail">E-mail:</asp:Label></td>
                                                
               <!-- Text box -->  <td><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                        <!-- Validation -->  
                                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                               ControlToValidate="txtEmail" 
                                               ErrorMessage="E-mail is required." 
                                               ToolTip="E-mail is required." 
                                               CssClass="error"
                                               ValidationGroup="formRegistration">*
                                        </asp:RequiredFieldValidator>
                                  </td>
           </tr>

         
             <!-- COMPARE VALIDATOR -->              
           <tr>
                                  <td colspan="2">
                                       <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                               ControlToCompare="txtPassword" 
                                               ControlToValidate="txtConfirmPassword" 
                                               Display="Dynamic" 
                                               ErrorMessage="The Password and Confirmation Password must match." 
                                               CssClass="error"
                                               ValidationGroup="formRegistration">
                                       </asp:CompareValidator>
                                  </td>
           </tr>

           <!-- DISPLAY ERRORS -->
           <tr>                   <td colspan="2" style="color:Red; height: 20px;">
                                       <asp:Literal ID="ErrorMessage" runat="server" 
                                              EnableViewState="False">
                                       </asp:Literal>
           </tr>   
           
                      <!-- VALIDATION SUMMARY CONTROL -->
           <tr>             
                                 <td colspan="2">
                                       <asp:ValidationSummary ID="ValidationSummary" runat="server" 
                                               HeaderText="Please correct these entries:"
                                               BorderStyle="Solid"
                                               BorderWidth="1px"
                                               ForeColor="#FF6600"
                                               ValidationGroup="formRegistration">
                                       </asp:ValidationSummary>
                                  </td>
           </tr>   
           
           </table>
           <!-- BUTTON -->  
                <asp:Button ID="btnAddUserToDatabase" runat="server" 
                                      Text="Add" 
                                      ValidationGroup="formRegistration"
                                      OnClick="submitNewUserInfo_Click" />
         </asp:Panel> 
     </div>
</form>

</asp:Content>
    
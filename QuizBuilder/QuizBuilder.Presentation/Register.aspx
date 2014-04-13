<%@ Page Title="REGISTER" Language="C#" MasterPageFile="~/Master Pages/Default.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="mainRegistrationContent" runat="server" ContentPlaceHolderID="MainContent">
   
     <!-- 
    Bethany Beery
    Final Web App
    Created 4/12/2014
    Northwestern Michigan College
    Instructor John Valis
    -->

    <section>
    <form ID="formRegistration" runat="server" defaultbutton="submitNewUserInfo" defaultfocus="UserName" style="height: 431px"> -->
    <h1><pre>                       HARNESS THE POWER OF ASP.NET</pre></h1><!-- to more accurately center text than css is -->
        <h2><pre>                       REGISTER TODAY</pre></h2><!-- to more accurately center text than css is -->

        <br>
       <table>
           <!-- USER NAME -->
            <tr>
                <!--Label -->      <td><asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label></td>
       
                <!-- Text box -->  <td><asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                         <!-- Validation -->
                                         <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                ControlToValidate="UserName" 
                                                ErrorMessage="User Name is required." 
                                                ToolTip="User Name is required." 
                                                ValidationGroup="formContent">* <!--Matches ID -->
                                         </asp:RequiredFieldValidator>
                                  </td>
           </tr>

          <!-- PASSWORD -->
           <tr>
               <!--Label -->      <td><asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label></td>
              
               <!-- Text box -->  <td><asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                         <!-- Validation -->
                                         <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                ControlToValidate="Password" 
                                                ErrorMessage="Password is required." 
                                                ToolTip="Password is required." 
                                                ValidationGroup="formContent">*
                                         </asp:RequiredFieldValidator>
                                   </td>
          </tr>

         <!-- CONFIRM PASSWORD -->
          <tr>
               <!--Label -->      <td><asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password: </asp:Label></td>
                                                
               <!-- Text box -->  <td><asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                        <!-- Validation -->                 
                                        <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                               ControlToValidate="ConfirmPassword" 
                                               ErrorMessage="Confirm Password is required." 
                                               ToolTip="Confirm Password is required." 
                                               ValidationGroup="formContent">*
                                        </asp:RequiredFieldValidator>
                                  </td>
          </tr>
                                            
        <!-- EMAIL -->                                      
          <tr>                                       
               <!--Label -->      <td><asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label></td>
                                                
               <!-- Text box -->  <td><asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                        <!-- Validation -->  
                                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                               ControlToValidate="Email" 
                                               ErrorMessage="E-mail is required." 
                                               ToolTip="E-mail is required." 
                                               ValidationGroup="formContent">*
                                        </asp:RequiredFieldValidator>
                                  </td>
           </tr>

         
             <!-- COMPARE VALIDATOR -->              
           <tr>
                                  <td colspan="2">
                                       <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                               ControlToCompare="Password" 
                                               ControlToValidate="ConfirmPassword" 
                                               Display="Dynamic" 
                                               ErrorMessage="The Password and Confirmation Password must match." 
                                               ValidationGroup="formContent">
                                       </asp:CompareValidator>
                                  </td>
           </tr>

           <!-- DISPLAY ERRORS -->
           <tr>                   <td colspan="2" style="color:Red; height: 20px;">
                                       <asp:Literal ID="ErrorMessage" runat="server" 
                                              EnableViewState="False">
                                       </asp:Literal>
           </tr>   
           
           <!-- BUTTON -->               
           <tr>
                                 <td><!-- empty first column --></td>               
                                 <td><asp:Button ID="submitNewUserInfo" runat="server" 
                                      Text="Register" 
                                      Width ="100px" OnClick="submitNewUserInfo_Click" />
                                </td> 
            </tr> 
       </table>    
     </form>
   </section>
</asp:Content> 



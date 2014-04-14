<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/Default.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content runat="server" ID="Content2" ContentPlaceHolderID="MainContent">

    <!-- 
    Bethany Beery
    Final Web App
    Created 4/12/2014
    Northwestern Michigan College
    CIT218 ASP.NET
    Instructor John Valis

    First page of website for quiz taker users and admins
    -->  

<section class="center">
                <img src="Images/Waves Banner.png" height="200" width="1000" alt="Waves"/>
                <br><br>
    <form ID="formLogInUser" runat="server" style="height: 431px"> 
        <h2><pre>      PLEASE LOG IN</pre></h2><!-- to more accurately center text than css is -->
        <br>
       <table>
        <!-- EMAIL -->                                      
          <tr>                                       
                <!--Label -->      <td><asp:Label ID="Label_EmailLogin" runat="server" AssociatedControlID="txt_EmailLogin" >E-mail:</asp:Label></td>
                                                
               <!-- Text box -->  <td style="width: 536px"><asp:TextBox ID="txt_EmailLogin" runat="server"></asp:TextBox>
                                        <!-- Validation -->  
                                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                               ControlToValidate="txt_EmailLogin" 
                                               ErrorMessage="E-mail is required." 
                                               ToolTip="E-mail is required." 
                                               ValidationGroup="formLogInUser">*
                                        </asp:RequiredFieldValidator>
                                  </td>
           </tr>

          <!-- PASSWORD -->
           <tr>
               <!--Label -->      <td><asp:Label ID="Label_PasswordLogin" runat="server" AssociatedControlID="txt_PasswordLogin">Password:</asp:Label></td>
              
               <!-- Text box -->  <td style="width: 536px"><asp:TextBox ID="txt_PasswordLogin" runat="server" TextMode="Password"></asp:TextBox>
                                         <!-- Validation -->
                                         <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                ControlToValidate="txt_PasswordLogin" 
                                                ErrorMessage="Password is required." 
                                                ToolTip="Password is required." 
                                                ValidationGroup="formLogInUser">*
                                         </asp:RequiredFieldValidator>
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
                                               ValidationGroup="formLogInUser">
                                       </asp:ValidationSummary>
                                  </td>
           </tr>   
           
           <!-- LOGIN BUTTON -->               
           <tr>
                                 <td><!-- empty first column --></td>               
                                 <td style="width: 536px">
                                     <a runat="server" href="Register.aspx"><h3>* Register if you don't have an account</h3></a>
                                     <asp:Button ID="btn_loginUser" runat="server" 
                                      Text="LOG IN" 
                                      Width ="100px" 
                                      ValidationGroup="formLogInUser"
                                      OnClick="btn_loginUser_Click" />
                                </td> 
            </tr> 

       </table>    
     </form>
  </section>
</asp:Content>


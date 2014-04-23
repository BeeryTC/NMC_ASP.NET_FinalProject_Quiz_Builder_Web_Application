using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Configuration;
using QuizBuilder.Data;
using QuizBuilder;


namespace QuizBuilder
{
    public class AuthenticateUser
    {
        public enum UserType
        {
            Admin,
            User
        }

        public static UserType CurrentUserRole = UserType.User;
        QuizBuilderEntities QBContext = new QuizBuilderEntities();

        //public UserType? IsValidUser(string Username, string Password)
        //{
        //    string connectionString = App_Code.GetConnectionString();
        //    using (QBContext)
        //    {
        //        User user = (from u in QBContext.Users
        //                     where u.UserName.Trim().ToLower() == Username.Trim().ToLower()
        //                     && u.Password.Trim() == Password.Trim()
        //                     && u.IsActive == true
        //                     select u).SingleOrDefault();

        //        if (user != null)
        //        {
        //            //if(user.IsAdmin return UserType.Admin else return usertype.User
        //            if (user.IsAdmin == true)
        //            {
        //                return UserType.Admin;
        //            }
        //            else
        //            {
        //                return UserType.User;
        //            }
        //        }
        //        else
        //        {//invalid login
        //            return null;
        //        }
        //    }
        //}
    }
}

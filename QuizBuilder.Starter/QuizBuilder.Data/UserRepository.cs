using System.Collections.Generic;
using System.Linq;

namespace QuizBuilder.Data
{
    public class UserRepository 
    {

        public User GetUser(int userID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                return ctx.Users.FirstOrDefault(u => u.UserID == userID);
            }
        }

        public User GetUser(string username, string password)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                return ctx.Users.FirstOrDefault(u => u.UserName == username && u.Password == password);
            }
        }

        public List<User> GetUsers()
        {

            using (var ctx = new QuizBuilderEntities())
            {
                return ctx.Users
                   .OrderBy(u => u.LastName)
                   .OrderBy(u => u.FirstName)
                   .ToList();
            }
        }

        public void SaveUser(User user)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                ctx.AddToUsers(user);
                ctx.SaveChanges();
            }
        }

        public void UpdateUser(User user)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                ctx.Attach(user);
                var stateEntry = ctx.ObjectStateManager.GetObjectStateEntry(user);
                foreach (var propertyName in stateEntry.CurrentValues
                                     .DataRecordInfo.FieldMetadata
                                     .Select(fm => fm.FieldType.Name))
                {
                    stateEntry.SetModifiedProperty(propertyName);
                }
                ctx.SaveChanges();
            }
        }

        public void DeleteUser(int userID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                var user = ctx.Users.FirstOrDefault(u => u.UserID == userID);

                if (user != null)
                {
                    ctx.DeleteObject(user);
                    ctx.SaveChanges();
                }
            }
        }
    }
}

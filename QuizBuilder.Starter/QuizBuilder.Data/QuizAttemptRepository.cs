using System.Collections.Generic;
using System.Linq;

namespace QuizBuilder.Data
{
    public class QuizAttemptRepository
    {

        public QuizAttempt GetQuizAttempt(int quizAttemptID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                return ctx.QuizAttempts.FirstOrDefault(qa => qa.QuizAttemptID == quizAttemptID);
            }
        }

        public List<QuizAttempt> GetQuizAttempts(int userID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                return ctx.QuizAttempts
                 .Where(qa => qa.UserID == userID)
                 .OrderBy(qa => qa.QuizDate)
                 .ToList();
            }
        }

        public void SaveQuizAttempt(QuizAttempt quizAttempt)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                ctx.AddToQuizAttempts(quizAttempt);
                ctx.SaveChanges();
            }
        }

        public void UpdateQuizAttempt(QuizAttempt quizAttempt)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                ctx.Attach(quizAttempt);
                var stateEntry = ctx.ObjectStateManager.GetObjectStateEntry(quizAttempt);
                foreach (var propertyName in stateEntry.CurrentValues
                                     .DataRecordInfo.FieldMetadata
                                     .Select(fm => fm.FieldType.Name))
                {
                    stateEntry.SetModifiedProperty(propertyName);
                }
                ctx.SaveChanges();
            }
        }

        public void DeleteQuizAttempt(int quizAttemptID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                var quizAttempt = ctx.QuizAttempts.FirstOrDefault(qa => qa.QuizAttemptID == quizAttemptID);

                if (quizAttempt != null)
                {
                    ctx.DeleteObject(quizAttempt);
                    ctx.SaveChanges();
                }
            }
        }
    }
}

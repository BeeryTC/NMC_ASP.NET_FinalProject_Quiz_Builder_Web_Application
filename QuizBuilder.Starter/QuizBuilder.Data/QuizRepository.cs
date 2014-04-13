using System.Collections.Generic;
using System.Linq;

namespace QuizBuilder.Data
{
    public class QuizRepository
    {

        public Quiz GetQuiz(int quizID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                return ctx.Quizzes.FirstOrDefault(q => q.QuizID == quizID);
            }
        }

        public List<Quiz> GetQuizzes()
        {
            using (var ctx = new QuizBuilderEntities())
            {
                return ctx.Quizzes
                     .OrderBy(q => q.QuizName)
                     .ToList();
            }
        }

        public void SaveQuiz(Quiz quiz)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                ctx.AddToQuizzes(quiz);
                ctx.SaveChanges();
            }
        }

        public void UpdateQuiz(Quiz quiz)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                ctx.Attach(quiz);
                var stateEntry = ctx.ObjectStateManager.GetObjectStateEntry(quiz);
                foreach (var propertyName in stateEntry.CurrentValues
                                     .DataRecordInfo.FieldMetadata
                                     .Select(fm => fm.FieldType.Name))
                {
                    stateEntry.SetModifiedProperty(propertyName);
                }
                ctx.SaveChanges();
            }
        }

        public void DeleteQuiz(int quizID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                var quiz = ctx.Quizzes.FirstOrDefault(q => q.QuizID == quizID);

                if (quiz != null)
                {
                    ctx.DeleteObject(quiz);
                    ctx.SaveChanges();
                }
            }
        }
    }
}

using System.Collections.Generic;
using System.Linq;

// Bethany Beery
// Final Web App
// Created 4/12/2014
// Northwestern Michigan College
// Instructor John Valis

namespace QuizBuilder.Data
{
    public class QuestionOptionRepository
    {

        public QuestionOption GetQuestionOption(int questionOptionID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                return ctx.QuestionOptions.FirstOrDefault(qo => qo.QuestionOptionID == questionOptionID);
            }
        }

  
        public QuestionOption GetCorrectQuestionOption(int questionID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                return ctx.QuestionOptions.FirstOrDefault(qo => qo.QuestionID == questionID && qo.IsCorrect == true);
            }
        }

        //added 4/10/2013
        public QuestionOption GetLast(int questionID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                var questionOption = ctx.QuestionOptions
                    .Where(q => q.QuestionID == questionID)
                    .OrderByDescending(o => o.OptionSequence)
                    .FirstOrDefault();

                return questionOption;
            }
        }
  
        public List<QuestionOption> GetQuestionOptions(int questionID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                return ctx.QuestionOptions
                   .Where(qo => qo.QuestionID == questionID)
                   .OrderBy(qo => qo.OptionSequence)
                   .ToList();
            }
        }

        public void SaveQuestionOption(QuestionOption questionOption)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                ctx.AddToQuestionOptions(questionOption);
                ctx.SaveChanges();
            }
        }

        public void UpdateQuestionOption(QuestionOption questionOption)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                ctx.Attach(questionOption);
                var stateEntry = ctx.ObjectStateManager.GetObjectStateEntry(questionOption);
                foreach (var propertyName in stateEntry.CurrentValues
                                     .DataRecordInfo.FieldMetadata
                                     .Select(fm => fm.FieldType.Name))
                {
                    stateEntry.SetModifiedProperty(propertyName);
                }
                ctx.SaveChanges();
            }
        }

        public void DeleteQuestionOption(int questionOptionID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                var questionOption = ctx.QuestionOptions.FirstOrDefault(qo => qo.QuestionOptionID == questionOptionID);

                if (questionOption != null)
                {
                    ctx.DeleteObject(questionOption);
                    ctx.SaveChanges();
                }
            }
        }
   }
}

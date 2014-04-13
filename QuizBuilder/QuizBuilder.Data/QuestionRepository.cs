using System.Collections.Generic;
using System.Linq;

// Bethany Beery
// Final Web App
// Created 4/12/2014
// Northwestern Michigan College
// Instructor John Valis

namespace QuizBuilder.Data
{
    public class QuestionRepository 
    {

        public Question GetQuestion(int questionID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                return ctx.Questions.FirstOrDefault(q => q.QuestionID == questionID);
            }
        }
        
        public List<Question> GetQuestions(int scenarioID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                return ctx.Questions
                  .Where(q => q.ScenarioID == scenarioID)
                  .OrderBy(q => q.QuestionSequence)
                  .ToList();
            }
        }


        public Question GetPrevious(int questionID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                Question previousQuestion = null;

                //fetch the question 
                var currentQuestion = ctx.Questions.FirstOrDefault(q => q.QuestionID == questionID);
                if (currentQuestion != null)
                {
                    //get the collection of questions based on the scenario
                    var quizQuestions = GetQuestions(currentQuestion.ScenarioID);
                    //find this question in the collection
                    var current = quizQuestions.First(q => q.QuestionID == questionID);
                    //is there a previous question? If not - return null
                    previousQuestion = quizQuestions.ElementAtOrDefault(quizQuestions.IndexOf(current) - 1);
                }
                return previousQuestion;
            }
        }

        //added 3/5/2012
        public Question GetFirst(int scenarioID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                var question = ctx.Questions
                    .Where(s => s.ScenarioID == scenarioID )
                    .OrderBy(s => s.QuestionSequence)
                    .FirstOrDefault();

                return question;
            }
        }

        //added 4/10/2013
        public Question GetLast(int scenarioID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                var question = ctx.Questions
                    .Where(s => s.ScenarioID == scenarioID)
                    .OrderByDescending(s => s.QuestionSequence)
                    .FirstOrDefault();

                return question;
            }
        }

        public Question GetNext(int questionID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                Question nextQuestion = null;

                //fetch the question 
                var currentQuestion = ctx.Questions.FirstOrDefault(q => q.QuestionID == questionID);
                if (currentQuestion != null)
                {
                    //get the collection of questions based on the scenario
                    var quizQuestions = GetQuestions(currentQuestion.ScenarioID);
                    //find this question in the collection
                    var current = quizQuestions.First(s => s.QuestionID == questionID);
                    //is there a next question? If not - return null
                    nextQuestion = quizQuestions.ElementAtOrDefault(quizQuestions.IndexOf(current) + 1);
                }
                return nextQuestion;
            }
        }

        public void SaveQuestion(Question question)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                ctx.AddToQuestions(question);
                ctx.SaveChanges();
            }
        }

        public void UpdateQuestion(Question question)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                ctx.Attach(question);
                var stateEntry = ctx.ObjectStateManager.GetObjectStateEntry(question);
                foreach (var propertyName in stateEntry.CurrentValues
                                     .DataRecordInfo.FieldMetadata
                                     .Select(fm => fm.FieldType.Name))
                {
                    stateEntry.SetModifiedProperty(propertyName);
                }
                ctx.SaveChanges();
            }
        }

        public void DeleteQuestion(int questionID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                var question = ctx.Questions.FirstOrDefault(q => q.QuestionID == questionID);

                if (question != null)
                {
                    ctx.DeleteObject(question);
                    ctx.SaveChanges();
                }
            }
        }
    }
}

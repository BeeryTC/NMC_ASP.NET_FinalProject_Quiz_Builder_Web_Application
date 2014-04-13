using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

// Bethany Beery
// Final Web App
// Created 4/12/2014
// Northwestern Michigan College
// Instructor John Valis

namespace QuizBuilder.Data
{
    public class QuestionResponseRepository 
    {

        public QuestionResponse GetQuestionResponse(int questionResponseID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                return ctx.QuestionResponses
                    .Include("Question")
                    .Include("Question.Scenario")
                    .Include("Question.QuestionOptions")
                    .Include("QuestionOption")
                    .FirstOrDefault(qr => qr.QuestionResponseID == questionResponseID);
            }
        }

        
        public QuestionResponse GetQuestionResponse(int quizAttemptID, int questionID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                return ctx.QuestionResponses
                    .FirstOrDefault(qr => qr.QuizAttemptID == quizAttemptID && qr.QuestionID == questionID );
            }
        }
        
        //updated 2/29/2012
        public List<QuestionResponse> GetQuestionResponses()
        {
            using (var ctx = new QuizBuilderEntities())
            {
                return ctx.QuestionResponses
                  .OrderBy(qr => qr.Question.Scenario.ScenarioSequence)
                  .ThenBy(qr => qr.Question.QuestionSequence)
                  .ToList();
            }
        }

        //added 2/29/2012
        public List<QuestionResponse> GetQuestionResponses(int quizAttemptID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
               // ctx.ContextOptions.LazyLoadingEnabled = false;
                
                return ctx.QuestionResponses
                    .Include("Question")
                    .Where(qr => qr.QuizAttemptID == quizAttemptID)
                    .OrderBy(qr => qr.Question.Scenario.ScenarioSequence)
                    .ThenBy(qr => qr.Question.QuestionSequence)
                    .ToList();
            }
        }

        //updated 2/29/2012
        public List<QuestionResponse> GetQuestionResponsesUnanswered(int quizAttemptID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                return ctx.QuestionResponses
                  .Where(qr => qr.QuestionOptionID == null && qr.QuizAttemptID == quizAttemptID)
                  .OrderBy(qr => qr.Question.Scenario.ScenarioSequence)
                  .ThenBy(qr => qr.Question.QuestionSequence)
                  .ToList();
            }
        }

        //updated 2/29/2012
        public List<QuestionResponse> GetQuestionResponsesForReview(int quizAttemptID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                return ctx.QuestionResponses
                  .Where(qr => qr.UserReviewFlag == true && qr.QuizAttemptID == quizAttemptID)
                  .OrderBy(qr => qr.Question.Scenario.ScenarioSequence)
                  .ThenBy(qr => qr.Question.QuestionSequence)
                  .ToList();
            }
        }

        //updated 3/13/2013
        public QuestionResponse GetFirstQuestionResponse(int quizAttemptID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                return ctx.QuestionResponses
                  .Where(qr => qr.QuizAttemptID == quizAttemptID)
                  .OrderBy(qr => qr.Question.Scenario.ScenarioSequence)
                  .ThenBy(qr => qr.Question.QuestionSequence)
                  .FirstOrDefault();
                 
            }
        }

        public QuestionResponse GetLastQuestionResponse(int quizAttemptID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                return ctx.QuestionResponses
                  .Where(qr => qr.QuizAttemptID == quizAttemptID)
                  .OrderByDescending(qr => qr.Question.Scenario.ScenarioSequence)
                  .ThenByDescending(qr => qr.Question.QuestionSequence)
                  .FirstOrDefault();

            }
        }
        //added 2/29/2012
        public QuestionResponse GetPrevious(int questionResponseID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                QuestionResponse previousQuestionResponse = null;

                //fetch the questionResponse 
                var currentQuestionResponse = ctx.QuestionResponses.FirstOrDefault(q => q.QuestionResponseID == questionResponseID);
                if (currentQuestionResponse != null)
                {
                    //get the collection of questionResponses based on the scenario
                    var quizQuestionResponses = GetQuestionResponses(currentQuestionResponse.QuizAttemptID);
                    //find this questionResponse in the collection
                    var current = quizQuestionResponses.First(q => q.QuestionResponseID == questionResponseID);
                    //is there a previous questionResponse? If not - return null
                    previousQuestionResponse = quizQuestionResponses.ElementAtOrDefault(quizQuestionResponses.IndexOf(current) - 1);
                }
                return previousQuestionResponse;
            }
        }

        //added 2/29/2012
        public QuestionResponse GetNext(int questionResponseID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                QuestionResponse nextQuestionResponse = null;

                //fetch the questionResponse 
                var currentQuestionResponse = ctx.QuestionResponses.FirstOrDefault(q => q.QuestionResponseID == questionResponseID);
                if (currentQuestionResponse != null)
                {
                    //get the collection of questionResponses based on the scenario
                    var quizQuestionResponses = GetQuestionResponses(currentQuestionResponse.QuizAttemptID);
                    //find this questionResponse in the collection
                    var current = quizQuestionResponses.First(s => s.QuestionResponseID == questionResponseID);
                    //is there a next questionResponse? If not - return null
                    nextQuestionResponse = quizQuestionResponses.ElementAtOrDefault(quizQuestionResponses.IndexOf(current) + 1);
                }
                return nextQuestionResponse;
            }
        }

        public void SaveQuestionResponse(QuestionResponse questionResponse)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                ctx.AddToQuestionResponses(questionResponse);
                ctx.SaveChanges();
            }
        }

        public void UpdateQuestionResponse(QuestionResponse questionResponse)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                ctx.Attach(questionResponse);
                var stateEntry = ctx.ObjectStateManager.GetObjectStateEntry(questionResponse);
                foreach (var propertyName in stateEntry.CurrentValues
                                     .DataRecordInfo.FieldMetadata
                                     .Select(fm => fm.FieldType.Name))
                {
                    stateEntry.SetModifiedProperty(propertyName);
                }
                ctx.SaveChanges();
            }
        }

        public void DeleteQuestionResponse(int questionResponseID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                var questionResponse = ctx.QuestionResponses.FirstOrDefault(qr => qr.QuestionResponseID == questionResponseID);

                if (questionResponse != null)
                {
                    ctx.DeleteObject(questionResponse);
                    ctx.SaveChanges();
                }
            }
        }
    }
}

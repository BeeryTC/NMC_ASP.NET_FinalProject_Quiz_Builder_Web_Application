using System.Collections.Generic;
using System.Linq;

// Bethany Beery
// Final Web App
// Created 4/12/2014
// Northwestern Michigan College
// Instructor John Valis

namespace QuizBuilder.Data
{
    public class ScenarioRepository
    {

        public Scenario GetScenario(int scenarioID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                return ctx.Scenarios.FirstOrDefault(s => s.ScenarioID == scenarioID);
            }
        }

        //added 3/5/2012
        public Scenario GetFirst(int quizID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                var scenario = ctx.Scenarios
                    .Where(s => s.QuizID == quizID)
                    .OrderBy(s => s.ScenarioSequence)
                    .FirstOrDefault();

                return scenario;
            }
        }

        //added 4/10/2013
        public Scenario GetLast(int quizID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                var scenario = ctx.Scenarios
                    .Where(s => s.QuizID == quizID)
                    .OrderByDescending(s => s.ScenarioSequence)
                    .FirstOrDefault();

                return scenario;
            }
        }

        public Scenario GetPrevious(int scenarioID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                Scenario previousScenario = null;

                //fetch the scenario 
                var currentScenario = ctx.Scenarios.FirstOrDefault(s => s.ScenarioID == scenarioID);
                if (currentScenario != null)
                {
                    //get the collection of scenarios based on the quiz
                    var quizScenarios = GetScenarios(currentScenario.QuizID);
                    //find this scenario in the collection
                    var current = quizScenarios.First(s => s.ScenarioID == scenarioID);
                    //is there a previous scenario? If not - return null
                    previousScenario = quizScenarios.ElementAtOrDefault(quizScenarios.IndexOf(current) - 1);
                }
                return previousScenario;
            }
        }

        public Scenario GetNext(int scenarioID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                Scenario nextScenario = null;

                //fetch the scenario 
                var currentScenario = ctx.Scenarios.FirstOrDefault(s => s.ScenarioID == scenarioID);
                if (currentScenario != null)
                {
                    //get the collection of scenarios based on the quiz
                    var quizScenarios = GetScenarios(currentScenario.QuizID);
                    //find this scenario in the collection
                    var current = quizScenarios.First(s => s.ScenarioID == scenarioID);
                    //is there a next scenario? If not - return null
                    nextScenario = quizScenarios.ElementAtOrDefault(quizScenarios.IndexOf(current) + 1);
                }
                return nextScenario;
            }
        }

        public List<Scenario> GetScenarios(int quizID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                return ctx.Scenarios
                  .Where(s => s.QuizID == quizID)
                  .OrderBy(s => s.ScenarioSequence)
                  .ToList();
            }
        }

        public void SaveScenario(Scenario scenario)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                ctx.AddToScenarios(scenario);
                ctx.SaveChanges();
            }
        }

        public void UpdateScenario(Scenario scenario)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                ctx.Attach(scenario);
                var stateEntry = ctx.ObjectStateManager.GetObjectStateEntry(scenario);
                foreach (var propertyName in stateEntry.CurrentValues
                                     .DataRecordInfo.FieldMetadata
                                     .Select(fm => fm.FieldType.Name))
                {
                    stateEntry.SetModifiedProperty(propertyName);
                }
                ctx.SaveChanges();
            }
        }

        public void DeleteScenario(int scenarioID)
        {
            using (var ctx = new QuizBuilderEntities())
            {
                var scenario = ctx.Scenarios.FirstOrDefault(s => s.ScenarioID == scenarioID);

                if (scenario != null)
                {
                    ctx.DeleteObject(scenario);
                    ctx.SaveChanges();
                }
            }
        }
    }
}

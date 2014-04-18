using QuizBuilder.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/*
    Bethany Beery
    Final Web App
    Created 4/12/2014
    Northwestern Michigan College
    CIT218 ASP.NET
    Instructor John Valis
 
    Page for admins to perform CRUD operations on quiz
 */


public partial class Admin_Quiz : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PanelScenario.Visible = false;
        PanelQuestion.Visible = false;
        PanelQuestionChoice.Visible = false;
    }
    

/* SCENARIO  */

    protected void btnDisplayAddNewScenario_Click(object sender, EventArgs e)
    {
        PanelScenario.Visible = true;
    }

    protected void btnAddScenario_Click(object sender, EventArgs e)
    {
        using (QuizBuilderEntities QBContext = new QuizBuilderEntities())
        {
            Scenario scenario = new Scenario();
            scenario.ScenarioName = txtNewScenarioTxt.Text;
            scenario.ScenarioSequence = Convert.ToInt32(txtNewScenarioSeq.Text);
            scenario.ScenarioText = txtNewScenarioTxt.Text;

            ScenarioRepository sR = new ScenarioRepository();
            sR.SaveScenario(scenario);

            /*Reload page so gridview will display new scenario */
            Response.Redirect("Admin_Quiz.aspx");
        }

            clearScenarioInputControls();
            PanelScenario.Visible = false;
        }

            void clearScenarioInputControls()
            {
                 txtNewScenarioName.Text = string.Empty;
                 txtNewScenarioSeq.Text = string.Empty;
                 txtNewScenarioTxt.Text = string.Empty;
            }

            protected void btnCancelScenario_Click(object sender, EventArgs e)
            {
                txtNewScenarioName.Text = string.Empty;
                txtNewScenarioSeq.Text = string.Empty;
                txtNewScenarioTxt.Text = string.Empty;
                Response.Redirect("Admin_Quiz.aspx");
                PanelScenario.Visible = false;
            }



/* QUESTIONS  */

            protected void btnDisplayAddNewQuestion_Click(object sender, EventArgs e)
            {
                PanelQuestion.Visible = true;
            }

            protected void btnAddQuestion_Click(object sender, EventArgs e)
            {
                using (QuizBuilderEntities QBContext = new QuizBuilderEntities())
                {
                    Question question = new Question();
                    question.ScenarioID = Convert.ToInt32(txtNewQScenarioID.Text);
                    question.QuestionSequence = Convert.ToInt32(txtNewQSequenceNumb.Text);
                    question.QuestionText = txtNewQTxt.Text;

                    QuestionRepository qR = new QuestionRepository();
                    qR.SaveQuestion(question);

            /*Reload page so gridview will display new scenario */
            Response.Redirect("Admin_Quiz.aspx");
        }

            clearQuestionInputControls();
        }

            void clearQuestionInputControls()
            {
                 txtNewQScenarioID.Text = string.Empty;
                 txtNewQSequenceNumb.Text = string.Empty;
                 txtNewQTxt.Text = string.Empty;
            }

            protected void btnCancelQuestion_Click(object sender, EventArgs e)
            {
                txtNewQScenarioID.Text = string.Empty;
                txtNewQSequenceNumb.Text = string.Empty;
                txtNewQTxt.Text = string.Empty;
                Response.Redirect("Admin_Quiz.aspx");
                PanelQuestion.Visible = false;
            }


/* QUESTION CHOICES  */

            protected void btnAddQuestionChoice_Click(object sender, EventArgs e)
            {
                PanelQuestionChoice.Visible = true;

            }

            protected void btnDisplayAddNewQuestionChoice_Click(object sender, EventArgs e)
            {
                using (QuizBuilderEntities QBContext = new QuizBuilderEntities())
                {
                    QuestionOption questionOpt = new QuestionOption();
                    questionOpt.OptionSequence = Convert.ToInt32(txtNewQCSequenceOrder.Text);
                    questionOpt.OptionText = txtNewQCText.Text;

                    QuestionOptionRepository qRO = new QuestionOptionRepository();
                    qRO.SaveQuestionOption(questionOpt);

                    /*Reload page so gridview will display new scenario */
                    Response.Redirect("Admin_Quiz.aspx");
                }

                clearQuestionChoiceInputControls();
            }

            void clearQuestionChoiceInputControls()
            {
                txtNewQCSequenceOrder.Text = string.Empty;
                txtNewQCText.Text = string.Empty;
            }

            protected void btnCancelQuestionChoice_Click(object sender, EventArgs e)
            {
                txtNewQCSequenceOrder.Text = string.Empty;
                txtNewQCText.Text = string.Empty;
                Response.Redirect("Admin_Quiz.aspx");
                PanelQuestionChoice.Visible = false;
            }

}


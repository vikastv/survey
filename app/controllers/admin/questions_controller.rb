class Admin::QuestionsController < Admin::BaseController
  def create
    question = params[:question]
    question_type = params[:question_type]
    survey_id = params[:survey_id]

    if !question.blank?
      question_params = { :question => question, :question_type => question_type,
        :survey_list_id => survey_id}

      question = Question.new(question_params)
      if question.save
        flash[:success] = "Question added successfully."
        redirect_to admin_survey_path(survey_id)
      else
        flash[:error] = "Question failed to add. #{question.errors.messages}"
        redirect_to admin_survey_path(survey_id)
      end
    else
      flash[:error] = "Empty question name.."
      redirect_to admin_survey_path(survey_id)
    end
  end

  def update_question
    question_text = params[:question]
    question_type = params[:question_type]
    survey_id = params[:survey_id]
    question_id = params[:question_id]

    question = Question.find_by_id(question_id)
    if !question.nil?
      question_params = {:question => question_text, :question_type => question_type,
        :survey_list_id => survey_id}
      question.update_attributes(question_params)
      flash[:success] = "Question updated successfully."
      redirect_to admin_survey_path(survey_id)
    else
      flash[:error] = "Question could not be found.."
      redirect_to admin_survey_path(survey_id)
    end
  end

  private
  def question_params
    params.require(:survey_list).permit(:question, :question_type, :survey_list_id)
  end
end

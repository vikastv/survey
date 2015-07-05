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

  private
  def question_params
    params.require(:survey_list).permit(:question, :question_type, :survey_list_id)
  end
end

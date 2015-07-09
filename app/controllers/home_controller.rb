class HomeController < ApplicationController
  def index
    @surveys = SurveyList.all.order(:id)
    @surveys = @surveys.paginate(:page => params[:page], :per_page => 10)
  end

  def answer
    survey_id = params[:survey_id]
    @survey = SurveyList.find_by_id(survey_id)

    @questions = Question.where(:survey_list_id => survey_id).all
    @questions = @questions.order(:id).paginate(:page => params[:page], :per_page => 10)
  end

  def answer_submit
    user_id = current_user.id
    survey_id = params[:survey_id]
    answer_params = []

    data = params[:q]
    data.each do |key,val|
      answer_build = {}
      answer_build[:question_id] = key
      answer_build[:user_id] = user_id
      answer_build[:survey_list_id] = survey_id
      answer_build[:answer] = val

      answer_params << answer_build
    end
    answer = Answer.create(answer_params)
    flash[:success] = "Survey completed successfully."
    redirect_to root_path
  end

end

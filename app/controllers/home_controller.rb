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
    redirect_to root_path
  end

end

class Admin::DashboardController < Admin::BaseController
  def index
    @surveys = SurveyList.all.order(:id)
    @surveys = @surveys.paginate(:page => params[:page], :per_page => 10)
  end

  def survey_responses
    survey_id = params[:id]
    @responses = Response.where(:survey_list_id => survey_id).all
  end
end

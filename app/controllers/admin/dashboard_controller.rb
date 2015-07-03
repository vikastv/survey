class Admin::DashboardController < Admin::BaseController
  def index
    @surveys = SurveyList.all
    @surveys = @surveys.paginate(:page => params[:page], :per_page => 10)
  end
end

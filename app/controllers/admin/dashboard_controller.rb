class Admin::DashboardController < Admin::BaseController
  def index
    @surveys = SurveyList.all.order(:id)
    @surveys = @surveys.paginate(:page => params[:page], :per_page => 10)
  end
end

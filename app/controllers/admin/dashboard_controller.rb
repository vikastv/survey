class Admin::DashboardController < Admin::BaseController
  def index
    @surveys = SurveyList.all
  end
end

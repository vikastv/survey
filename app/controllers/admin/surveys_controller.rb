class Admin::SurveysController < Admin::BaseController
  def create
    survey_name = params[:name]
    survey_params = {:name => survey_name}

    if !survey_name.blank?
      survey = SurveyList.new(survey_params)
      if survey.save
        flash[:success] = "Survey added successfully."
        redirect_to admin_root_path
      else
        flash[:error] = "Survey failed to add. #{survey.errors.messages}"
        redirect_to admin_root_path
      end
    else
      flash[:error] = "Empty survey name.."
      redirect_to admin_root_path
    end
  end

  private
  def survey_params
    params.require(:survey_list).permit(:name)
  end
end

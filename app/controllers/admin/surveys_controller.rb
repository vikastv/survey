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

  def update_name
    survey_id = params[:id]
    survey_name = params[:name]

    survey = SurveyList.find(survey_id)
    if !survey.nil?
      survey.update_attributes(:name => survey_name)
      flash[:success] = "Survey updated successfully."
      redirect_to admin_root_path
    else
      flash[:error] = "Failed to update survey."
      redirect_to admin_root_path
    end
  end

  def destroy
    survey_id = params[:id]
    survey = SurveyList.find(survey_id)
    if !survey.nil?
      survey.destroy
      flash[:success] = "Survey deleted successfully."
      redirect_to admin_root_path
    else
      flash[:error] = "Failed to delete survey."
      redirect_to admin_root_path
    end
  end

  private
  def survey_params
    params.require(:survey_list).permit(:name)
  end
end

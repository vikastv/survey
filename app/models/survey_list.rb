class SurveyList < ActiveRecord::Base
  validates :name, presence: true
end

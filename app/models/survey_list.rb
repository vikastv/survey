class SurveyList < ActiveRecord::Base
  validates :name, presence: true
  has_many :questions
  has_many :answers
end

class Question < ActiveRecord::Base
  validates :question, presence: true
  belongs_to :survey_list


  module Type
    EssayOrText = "EssayOrText".freeze
    Numeric   = "Numeric".freeze
    DateTime = "DateTime".freeze
  end
end

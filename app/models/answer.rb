class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  belongs_to :survey_list
end

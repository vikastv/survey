class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey_list
end

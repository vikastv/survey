class CreateSurveyList < ActiveRecord::Migration
  def change
    create_table :survey_lists do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end

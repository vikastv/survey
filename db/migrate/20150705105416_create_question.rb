class CreateQuestion < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.string :question_type
      t.references :survey_list, :null => false

      t.timestamps
    end
  end
end

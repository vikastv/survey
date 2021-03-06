class CreateAnswer < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer

      t.references :question, :null => false
      t.references :user, :null => false
      t.references :survey_list, :null => false

      t.timestamps
    end
  end
end

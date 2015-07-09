class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :response

      t.references :survey_list, :null => false
      t.references :user, :null => false
      t.timestamps
    end
  end
end

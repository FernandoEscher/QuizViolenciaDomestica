class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :answer
      t.string :phone
      t.references :question

      t.timestamps
    end
    add_index :responses, :question_id
  end
end

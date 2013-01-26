class Quizzes < ActiveRecord::Migration
  def up
  	create_table :quizzes do |t|
  		t.string :name
  	end
  end

  def down
  	drop_table :quizzes
  end
end

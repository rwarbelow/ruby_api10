class CreateCourses < ActiveRecord::Migration
  def change
  	create_table :courses do |t|
  		t.integer :grade_level
  		t.string :title
  		t.references :teacher

  		t.timestamps
  	end
  	
  end
end

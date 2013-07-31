class CreateStudentsTeachers < ActiveRecord::Migration
  def change
  	create_table :students_teachers do |t|
  		t.references :teacher
  		t.references :student

  		t.timestamps
  	end
  end
end

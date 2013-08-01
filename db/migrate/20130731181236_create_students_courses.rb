class CreateStudentsCourses < ActiveRecord::Migration
  def change
  	create_table :students_courses do |t|
  		t.references :course
  		t.references :student

  		t.timestamps
  	end
  end
end

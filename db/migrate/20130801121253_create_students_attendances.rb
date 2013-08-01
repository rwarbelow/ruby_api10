class CreateStudentsAttendances < ActiveRecord::Migration
  def change
  	create_table :students_attendances do |t|
  		t.references :student
  		t.references :attendance

  		t.timestamps
  	end
  end
end

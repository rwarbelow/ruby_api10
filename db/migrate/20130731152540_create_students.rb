class CreateStudents < ActiveRecord::Migration
  def change
  	create_table :students do |t|
      t.string :first_name
      t.string :middle_name
  		t.string :last_name
      t.string :address
      t.string :student_id
  		t.string :grade_level
      t.string :student_email
      t.string :cell_phone

  		t.timestamps
  	end
  end
end

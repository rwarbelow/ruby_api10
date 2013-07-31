class CreateStudents < ActiveRecord::Migration
  def change
  	create_table :contacts do |t|
  		t.integer :id_number
  		t.string :first_name
  		t.string :middle_name
  		t.string :last_name
  		t.string :address
  		t.integer :grade_level
  		t.string :personal_email
  		t.string :cell_phone

  		t.timestamps
  	end

  end
end

class CreateStudents < ActiveRecord::Migration
  def change
  	create_table :contacts do |t|
  		t.string :first_name
  		t.string :middle_name
  		t.string :last_name
  		t.integer :id_number

  		t.timestamps
  	end

  end
end

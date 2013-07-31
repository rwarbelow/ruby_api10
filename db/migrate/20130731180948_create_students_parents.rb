class CreateStudentsParents < ActiveRecord::Migration
  def change
  	create_table :students_parents do |t|
  		t.references :parent
  		t.references :student

  		t.timestamps
  	end
  end
end

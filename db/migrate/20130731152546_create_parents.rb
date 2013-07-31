class CreateParents < ActiveRecord::Migration
  def change
  	create_table :parents do |t|
      t.string :first_name
  		t.string :last_name
  		t.string :relationship_to_student
  		t.string :personal_email
      t.string :cell_phone
      t.string :home_phone
      t.string :preferred_language

  		t.timestamps
  	end
  end
end

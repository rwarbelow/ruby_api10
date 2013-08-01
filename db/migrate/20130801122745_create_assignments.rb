class CreateAssignments < ActiveRecord::Migration
  def change
  	create_table :assignments do |t|
  		t.string :title
  		t.string :description
  		t.date :date_assigned
  		t.date :due_date

  		t.timestamps
  		
  	end
  end
end

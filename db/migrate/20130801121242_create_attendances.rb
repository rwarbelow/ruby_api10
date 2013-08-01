class CreateAttendances < ActiveRecord::Migration
  def change
  	create_table :attendance do |t|
  		t.integer :presence

  		t.timestamps
  	end
  end
end

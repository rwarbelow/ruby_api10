class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
  		t.string :last_name
      t.string :address
      t.string :title
  		t.string :interact_email
      t.string :swot_email
      t.string :personal_email
      t.string :cell_phone
      t.string :other_phone

  		t.timestamps
  	end
  end
end

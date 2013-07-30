class CreateSentMessages < ActiveRecord::Migration
  def change
  	create_table :sent_messages do |t|
  		t.string :phone_number
  		t.integer :contact_id
  		t.text :message

  		t.timestamps
  	end

  end
end

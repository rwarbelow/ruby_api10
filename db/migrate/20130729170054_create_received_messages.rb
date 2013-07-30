class CreateReceivedMessages < ActiveRecord::Migration
  def change
  	create_table :received_messages do |t|
  		t.string :phone_number
  		t.integer :contact_id
  		t.text :message

  		t.timestamps
  	end
  end
end

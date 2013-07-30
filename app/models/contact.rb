class Contact < ActiveRecord::Base
  # Remember to create a migration!
  has_many :received_messages
  has_many :sent_messages
  
end

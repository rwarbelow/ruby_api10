class Course < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :teacher
end

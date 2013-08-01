class StudentsCourse < ActiveRecord::Base
  # Remember to create a migration!
 	belongs_to :student
  belongs_to :course
end

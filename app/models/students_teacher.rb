class StudentsTeacher < ActiveRecord::Base
  # Remember to create a migration!
 	belongs_to :student
  belongs_to :teacher
end

class Teacher < ActiveRecord::Base
  # Remember to create a migration!
  has_many :students_teachers
  has_many :students, through: :students_teachers
end

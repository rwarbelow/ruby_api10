class Attendance < ActiveRecord::Base
  # Remember to create a migration!
  has_many :students_attendances
  has_many :students, through: :students_attendances
end

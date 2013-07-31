class Student < ActiveRecord::Base
  # Remember to create a migration!
  has_many :students_parents
  has_many :parents, through: :students_parents
  has_many :students_teachers
  has_many :teachers, through: :students_teachers

end

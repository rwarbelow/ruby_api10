class Student < ActiveRecord::Base
  # Remember to create a migration!
  has_many :students_parents
  has_many :parents, through: :students_parents

  has_many :students_courses
  has_many :courses, through: :students_courses
  
  has_many :students_attendances
  has_many :attendances, through: :students_attendances

end

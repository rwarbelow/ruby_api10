class Parent < ActiveRecord::Base
  # Remember to create a migration!
  has_many :students_parents
  has_many :students, through: :students_parents
end

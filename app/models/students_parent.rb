class StudentsParent < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :student
  belongs_to :parent
  validates :student_id, :uniqueness => { :scope => :parent_id }
end

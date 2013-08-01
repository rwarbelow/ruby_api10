class Course < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :teacher
  has_many :students, through: :students_courses
  has_many :students_courses

  def has_students?
  	if self.students.length > 0
  		true
  	else
  		false
  	end
  end

end

class Teacher < ActiveRecord::Base
  # Remember to create a migration!
  has_many :students_teachers
  has_many :students, through: :students_teachers
  has_many :courses

  def has_classes?
  	if self.courses.length > 0
  		true
  	else
  		false
  	end
  end

end

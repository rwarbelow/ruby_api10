class Teacher < ActiveRecord::Base
  # Remember to create a migration!
  has_many :courses
  has_many :students, through: 

  def has_courses?
  	if self.courses.length > 0
  		true
  	else
  		false
  	end
  end

end


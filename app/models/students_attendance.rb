class StudentsAttendance < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :student
  belongs_to :attendance
  validates :student_id, :uniqueness => { :scope => :attendance_id }
end

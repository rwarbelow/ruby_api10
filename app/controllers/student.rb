post '/create_student' do	
	@student = Student.create(params)
	redirect "/students/#{@student.id}"
end

get '/students/:student_id' do
	@student = Student.find(params[:student_id])
	erb :'students/student_profile'
end

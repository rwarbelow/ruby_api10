post '/create_student' do	
	@student = Student.create(params)
	redirect '/'
end
post '/create_teacher' do	
	@teacher = Teacher.create(params)
	p @teacher
	redirect "/teachers/#{@teacher.id}"
end


get "/teachers/:teacher_id" do
	@teacher = Teacher.find(params[:teacher_id])
	erb :'teachers/teacher_profile'
end

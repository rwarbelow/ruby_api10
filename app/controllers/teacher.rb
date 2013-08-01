post '/create_teacher' do	
	@teacher = Teacher.create(params)
	p @teacher
	redirect "/teachers/#{@teacher.id}"
end


get "/teachers/:teacher_id" do
	@teacher = Teacher.find(params[:teacher_id])
	erb :'teachers/teacher_profile'
end

post "/teachers/courses/new_course/:teacher_id" do
	p params
	@course = Course.new(params[:course])
	@course.teacher_id = params[:teacher_id]
	if @course.save
		redirect "/teachers/#{@course.teacher_id}"
	else
		erb :'teachers/teacher_profile'
	end

end

get '/teachers/courses/:course_id' do
	@course = Course.find(params[:course_id])
	erb :'/courses/teacher_course_view'
end

post '/create_parent' do
	@parent = Parent.new(params[:parent])
	if @parent.save
		redirect "/parent_profile/#{@parent.id}"
	else
		@errors = @parent.errors.full_messages
		erb :index
	end
end


get '/parent_profile/:parent_id' do
	@parent = Parent.find(params[:parent_id])
	erb :parent_profile
end

post '/add_student/:parent_id' do
	@parent = Parent.find(params[:parent_id])
	student = Student.find(params[:parent][:student_id])
	@parent.students << student
end
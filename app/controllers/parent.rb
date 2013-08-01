post '/parents/new_parent' do
	@parent = Parent.new(params[:parent])
	if @parent.save
		redirect "/parents/#{@parent.id}"
	else
		@errors = @parent.errors.full_messages
		erb :index
	end
end

get '/parents/:parent_id' do
	@parent = Parent.find(params[:parent_id])
	erb :'parents/parent_profile'
end

post '/parents/add_student/:parent_id' do
	@parent = Parent.find(params[:parent_id])
	student = Student.find(params[:parent][:student_id])
	@parent.students << student
	redirect "/parents/#{@parent.id}"
end
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
	erb :
end


# 	if params[:parent][:student_id]
# 		student = Student.find(params[:parent][:student_id])
# @parent.students << student
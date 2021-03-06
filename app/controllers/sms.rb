# send a text message
post '/send_message' do
  myMessage = Message.new(params[:number], params[:message])
  myMessage.send
  erb :index
end

# look at old sent messages
get '/sent_messages' do
  myMessages = Message.new
  @allmessages = myMessages.get_sent_messages
  erb :'messages/all_sent_messages'
end

# look at old received messages
get '/received_messages' do
  myMessages = Message.new
  @allmessages = myMessages.get_received_messages
  erb :'messages/all_received_messages'
end

# to respond to text
get '/sms-quickstart' do
  @caller = Parent.find_by_cell_phone(params["From"])
  if params["Body"] == "grades"
    twiml = Twilio::TwiML::Response.new do |r|
      r.Sms "You have requested grades for #{@caller.first_name} #{@caller.last_name}."
    end
  elsif params["Body"] == "attendance"
    twiml = Twilio::TwiML::Response.new do |r|
      r.Sms "You have requested attendance for #{@caller.first_name} #{@caller.last_name}."
    end 
  elsif params["Body"] == "behavior"
    twiml = Twilio::TwiML::Response.new do |r|
      r.Sms "You have requested behavior for #{@caller.first_name} #{@caller.last_name}."
    end 
  else
    twiml = Twilio::TwiML::Response.new do |r|
      r.Sms "You have requested something else for #{@caller.first_name} #{@caller.last_name}."
    end 
  end
  twiml.text
end
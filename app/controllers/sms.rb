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
  erb :all_sent_messages
end

# look at old received messages
get '/received_messages' do
  myMessages = Message.new
  @allmessages = myMessages.get_received_messages
  erb :all_received_messages
end

# to respond to text
get '/sms-quickstart' do
  p params
  p params["body"]
  p params[:body]
  if params["body"] == "grades"
    twiml = Twilio::TwiML::Response.new do |r|
      r.Sms "You have requested grades."
    end
  elsif params["body"] == "attendance"
    twiml = Twilio::TwiML::Response.new do |r|
      r.Sms "You have requested attendance."
    end 
  elsif params["body"] == "behavior"
    twiml = Twilio::TwiML::Response.new do |r|
      r.Sms "You have requested behavior."
    end 
  else
    twiml = Twilio::TwiML::Response.new do |r|
      r.Sms "You have requested something else."
    end 
  end
    
  twiml.text
end
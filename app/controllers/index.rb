get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/send_message' do
  myMessage = Message.new(params[:number], params[:message])
  myMessage.send
end


get '/sms-quickstart' do
  twiml = Twilio::TwiML::Response.new do |r|
    r.Sms "Here is an automated response."
  end
  twiml.text
end

post '/call' do
  myMessage = Message.new(params[:number])
  myMessage.call
end

get '/sent_messages' do
  myMessages = Message.new
  @allmessages = myMessages.get_sent_messages

  erb :all_sent_messages
end

get '/received_messages' do
  myMessages = Message.new
  @allmessages = myMessages.get_received_messages

  erb :all_received_messages
end

get '/sms-quickstart' do
  Twilio::TwiML::Response.new do |r|
    r.Say "Hello Monkey! You will get an SMS message soon."
    r.Sms "Here it is!"
  end.text
end
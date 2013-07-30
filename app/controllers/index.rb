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

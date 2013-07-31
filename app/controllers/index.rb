get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/send_message' do
  myMessage = Message.new(params[:number], params[:message])
  myMessage.send
  erb :index
end

post '/call' do
  myMessage = Message.new(params[:number])
  myMessage.call
  erb :index
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

get '/voice/?' do
  response = Twilio::TwiML::Response.new do |r|
    r.Say 'Congratulations! You\'ve successfully deployed ' \
          'the Twilio HackPack for Heroku and Sinatra!', :voice => 'woman'
  end
  response.text
end

def get_or_post(path, opts={}, &block)
  get(path, opts, &block)
  post(path, opts, &block)
end

# # Home page and reference
# get '/' do
#   @title = "Home"
#   erb :home
# end

# Voice Request URL
get '/voice_mail/?' do
  response = Twilio::TwiML::Response.new do |r|
    r.Say 'Congratulations! You\'ve successfully deployed ' \
          'the Twilio HackPack for Heroku and Sinatra!', :voice => 'woman'
  end
  response.text
end

# SMS Request URL
get '/sms-quickstart' do
  p params
  twiml = Twilio::TwiML::Response.new do |r|
    r.Sms "Texted from #{params["From"]}, with #{params["Body"]}. "
  end 
  twiml.text
end


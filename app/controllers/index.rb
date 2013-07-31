# get '/' do
#   # Look in app/views/index.erb
#   erb :index
# end

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

# Home page and reference
get '/' do
  @title = "Home"
  erb :home
end

# Voice Request URL
get_or_post '/voice/?' do
  response = Twilio::TwiML::Response.new do |r|
    r.Say 'Congratulations! You\'ve successfully deployed ' \
          'the Twilio HackPack for Heroku and Sinatra!', :voice => 'woman'
  end
  response.text
end

# SMS Request URL
get '/sms-quickstart' do
  twiml = Twilio::TwiML::Response.new do |r|
    r.Sms "Hey Monkey. Thanks for the message!"
  end
  twiml.text
end

# Twilio Client URL
get_or_post '/client/?' do
  TWILIO_ACCOUNT_SID = "AC153ccfc825f37dc1e598b5e65b1b774c"
  TWILIO_AUTH_TOKEN = "3090f0831d0ee9fc0191f4daaf8bb232"
  TWILIO_APP_SID = "APfbf12f8d84e510bdd82aa9a4f5f974aa"
  
  if !(TWILIO_ACCOUNT_SID && TWILIO_AUTH_TOKEN && TWILIO_APP_SID)
    return "Please run configure.rb before trying to do this!"
  end
  @title = "Twilio Client"
  capability = Twilio::Util::Capability.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)
  capability.allow_client_outgoing(TWILIO_APP_SID)
  capability.allow_client_incoming('twilioRubyHackpack')
  @token = capability.generate
  erb :client
end
get '/' do
  # Look in app/views/index.erb
  erb :index
end

# look at old basic functions
get '/basic_functions' do
  # Look in app/views/index.erb
  erb :basic_functions
end

# to read to caller
get '/voice_mail' do
  p params
  response = Twilio::TwiML::Response.new do |r|
    r.Say 'Hi Allen! I can write whatever I want this to say', :voice => 'woman'
  end
  response.text
end


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

get '/hello-monkey' do
  people = {
    '+14158675309' => 'Curious George',
    '+14158675310' => 'Boots',
    '+14158675311' => 'Virgil',
    '+14158675312' => 'Marcel',
  }

  name = people[params['From']] || 'Monkey'
  Twilio::TwiML::Response.new do |r|
    r.Say "Hello #{name}"
    r.Play 'http://demo.twilio.com/hellomonkey/monkey.mp3'
    r.Gather :numDigits => '1', :action => '/hello-monkey/handle-gather', :method => 'get' do |g|
      g.Say 'To speak to a real monkey, press 1.'
      g.Say 'Press 2 to record your own monkey howl.'
      g.Say 'Press any other key to start over.'
    end
  end.text
end
 
get '/hello-monkey/handle-gather' do
  redirect '/hello-monkey' unless ['1', '2'].include?(params['Digits'])
  if params['Digits'] == '1'
    response = Twilio::TwiML::Response.new do |r|
      r.Dial '+13105551212'
      r.Say 'The call failed or the remote party hung up. Goodbye.'
    end
  elsif params['Digits'] == '2'
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Record your monkey howl after the tone.'
      r.Record :maxLength => '30', :action => '/hello-monkey/handle-record', :method => 'get'
    end
  end
  response.text
end
 
 
get '/hello-monkey/handle-record' do
  Twilio::TwiML::Response.new do |r|
    r.Say 'Listen to your monkey howl.'
    r.Play params['RecordingUrl']
    r.Say 'Goodbye.'
  end.text
end
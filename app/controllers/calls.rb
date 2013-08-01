get '/hello-monkey' do
  @caller = Parent.find_by_cell_phone([params['From']]) || 'Guest'
  Twilio::TwiML::Response.new do |r|
    r.Say "Hello #{@caller.first_name}"
    r.Gather :numDigits => '1', :action => '/hello-monkey/handle-gather', :method => 'get' do |g|
      g.Say 'I cannot believe I programmed this.'
      g.Say 'Push a key. One will read you a little message. Two will let you record yourself so you can listen to yourself talk. Three will let you record a voicemail that I will receive.'
      g.Say 'But you can also press any other key to start over.'
    end
  end
end
 

get '/hello-monkey/handle-gather' do
  redirect '/hello-monkey' unless ['1', '2', '3'].include?(params['Digits'])
  if params['Digits'] == '1'
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'You pushed one. Yay. And I do not know how to program anything else. Sorry.'
    end
  elsif params['Digits'] == '2'
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Record something. There is no point really to this other than for you to hear your own voice. Press pound when you are finished.'
      r.Record :maxLength => '30', :action => '/hello-monkey/handle-record', :method => 'get'
    end
  elsif params['Digits'] == '3'
    redirect "http://twimlets.com/voicemail?Email=rachelwarbelow%40gmail.com&Message=Record%20your%20message%20after%20the%20tone.%20&Transcribe=true&"
  end
  response.text
end


get '/hello-monkey/handle-record' do
  Twilio::TwiML::Response.new do |r|
    r.Say 'Listen to your message.'
    r.Play params['RecordingUrl']
    r.Say 'Goodbye.'
  end.text
end

post '/call' do
  myMessage = Message.create(params[:numbers])
end

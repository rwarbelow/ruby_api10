get '/hello-monkey' do

  Twilio.incoming_call

  # @caller = Parent.find_by_cell_phone([params['From']]) || 'Guest'
  # Twilio::TwiML::Response.new do |r|
  #   r.Say "Hello #{@caller.first_name}"
  #   r.Gather :numDigits => '1', :action => '/hello-monkey/handle-gather', :method => 'get' do |g|
  #     g.Say 'I cannot believe I programmed this.'
  #     g.Say 'Push a key. One or two or three.'
  #     g.Say 'But you can also press any other key to start over.'
  #   end
  # end.text
end
 
get '/hello-monkey/handle-gather' do
  redirect '/hello-monkey' unless ['1', '2', '3'].include?(params['Digits'])
  if params['Digits'] == '1'
    response = Twilio::TwiML::Response.new do |r|
      r.Dial '+13105551212'
      r.Say 'You pushed one. Yay. And I do not know how to program anything else. Sorry.'
    end
  elsif params['Digits'] == '2'
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Record something. I do not think I will be able to receive it because I am not a good programmer yet. Press pound when you are finished. Leave me a really good message in case I can get it. Ok?'
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
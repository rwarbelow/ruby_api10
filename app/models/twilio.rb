class Twilio

	def self.incoming_call
		@caller = Parent.find_by_cell_phone([params['From']]) || 'Guest'
  	Twilio::TwiML::Response.new do |r|
    r.Say "Hello #{@caller.first_name}"
    r.Gather :numDigits => '1', :action => '/hello-monkey/handle-gather', :method => 'get' do |g|
      g.Say 'I cannot believe I programmed this.'
      g.Say 'Push a key. One or two or three.'
      g.Say 'But you can also press any other key to start over.'
    end
  end.text
	end

end

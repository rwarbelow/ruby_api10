# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)

set :app_file, __FILE__

configure do
  # See: http://www.sinatrarb.com/faq.html#sessions
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || 'this is a secret shhhhh'

  # Set the views to 
  set :views, File.join(Sinatra::Application.root, "app", "views")
end

run Sinatra::Application

 
class BasicVoicemail < Sinatra::Application
  API_VERSION = '2010-04-01'
  ACCOUNT_SID = 'AC153ccfc825f37dc1e598b5e65b1b774c'
  ACCOUNT_TOKEN = '3090f0831d0ee9fc0191f4daaf8bb232'

  post '/' do
    @r = Twilio::Response.new
    @r.addSay("Please leave a message. Include your name and press any digit to end. Maximum length is three minutes.", :voice => "woman")
    @r.addRecord(:action => '/phone/recorded', :method => 'POST', :timeout => '4', :transcribe => 'false', :maxLength => 180)
    @r.addSay("You did not leave a message. Stop wasting my time and piss off.")
    @r.respond
  end
 
  post '/recorded' do
    @r = Twilio::Response.new
    @r.addSay("Thank you. Goodbye!", :voice => "woman")
    @r.respond
  end
 
end
 
run BasicVoicemail
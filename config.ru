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

# update an exisiting heroku repo that's been renamed
# git remote set-url heroku git@heroku.com:intense-waters-8288.git
# git fetch heroku
# git push heroku master

# i created a new app on heroku's website and want to push to the repo
# git remote add heroku git@heroku.com:intense-waters-8288.git
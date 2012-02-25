

require 'rubygems'
require 'sinatra'
require 'haml'
require 'parse-ruby-client'

enable :sessions

helpers do
    def validate(username, password)

        return username == "test"
    end

    def is_logged_in?
    session["logged_in"] == true
    end
  
    def clear_session
    session.clear
    end
  
    def the_user_name
        if is_logged_in? 
            session["username"] 
        else
        "not logged in"
        end
    end
end


get '/' do 
    @word = "YOU"
    haml :index
end

post '/login' do
  if(validate(params["username"], params["password"]))
    puts "yay"
    session["logged_in"] = true
    session["username"] = params["username"]
    # NOTE the right way to do messages like this is to use Rack::Flash
    # https://github.com/nakajima/rack-flash
    @message = "You've been logged in.  Welcome back, #{params["username"]}"
    haml :index
  else
    puts "error"
    # See note above
    @error_message = "Sorry, those credentials aren't valid."
    haml :login
  end
end

get '/logout' do
  clear_session
  @message = "You've been logged out."
  haml :index
end


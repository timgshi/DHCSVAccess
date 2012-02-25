

require 'rubygems'
require 'sinatra'
require 'haml'
require 'parse-ruby-client'

get '/' do 
    word = "YOU"
    haml :index
end


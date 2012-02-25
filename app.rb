

require 'rubygems'
require 'sinatra'
require 'haml'
require 'parse-ruby-client'

get '/' do
  haml :index
end


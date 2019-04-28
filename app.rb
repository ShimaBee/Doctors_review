require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

get '/top' do
    erb :top
  end
  
require 'sinatra'
require 'sinatra/reloader'
require 'pg'

connection = PG::connect(:host => "localhost", :user => "shimabukuroyuuta", :dbname => "review_doctors", :port => 5432)

get '/' do
  @result = connection.exec("SELECT * FROM users")
  erb :index
end

get '/top' do
    erb :top
end
require 'sinatra'
require 'sinatra/reloader'
require 'pg'

enable :sessions

connection = PG::connect(
  :host => "localhost", 
  :user => "shimabukuroyuuta", 
  :dbname => "review_doctors", 
  :port => 5432)

get '/' do
  erb :index
end

get '/top' do
  @result = connection.exec("SELECT * FROM reviews")
  erb :top
end

get '/register' do
  erb :register
end

post '/register' do
  name = params['name']
  email = params['email']
  password = params['password']
  connection.exec("insert into users (name, email, password) values($1, $2, $3)",[name, email, password])
  redirect '/'
end

get '/login' do
  erb :login
end

post '/login' do
  name = params['name']
  password = params['password']
  @user_id = connection.exec("select id from users where name = $1 and password = $2",[name, password]).first
  # if user
  #   session[:user_id] = user
  #   redirect '/mypage'
  # else
  #   erb :login
  # end
  erb :index
end

get '/mypage' do
  @result = connection.exec("SELECT * FROM reviews")
  erb :mypage
end

get '/post' do
  erb :post
end

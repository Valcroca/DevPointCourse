require 'sinatra'
require 'pry'

get '/' do
  erb :home
end

get '/contact' do
  erb :contact
end

get '/ander_and_me' do
  erb :ander_and_me
end



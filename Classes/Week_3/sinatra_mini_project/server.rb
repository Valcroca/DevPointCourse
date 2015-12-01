require 'sinatra'
require 'pry'

get '/' do
  erb :home
end

get '/contact' do
  erb :contact
end

get '/resume' do
  erb :resume
end


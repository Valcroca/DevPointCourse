
require 'sinatra'
require 'pry'
require 'babbler'

def user_info(name)
  @name = name.downcase
  case @name
    when 'glenn'
      @age = 35
      @city_of_birth = 'Sandy'
    when 'seth'
      @age = 22
      @city_of_birth = 'Sandy'
    when 'val'
      @age = 27
      @city_of_birth = 'Buenos Aires'
  end
end

# get routes
get '/' do 
  @print_name = params[:print_name]
  @babble = Babbler.babble
  erb :index
end

get '/class_members' do
  @class_members = []
  erb :class_members
end

get '/class_member/:name' do
  user_info(params[:name])
  erb :class_member
end

#displays form
get '/class_member_search' do
  erb :class_member_search
end

get '/resume' do
  "My Resume"
end

get '/hello' do
  "Hello"
end

get '/hello/:name' do
  "Hello, #{params[:name]}"
end

get '/hello/:name/:age' do
  "hello, #{params[:name]}, you are #{params[:age]}"
end

# get '/city/:city/state/:state/zip/:zip' do
#   "#{params[:city]}, #{params[:state]}, #{params[:zip]}"
# end

get '/query_string' do
  "Your sport was #{params[:sport]}, #{params[:difficulty]}"
end

#POST Routes
post '/search_class_member' do
  user_info(params[:member_name])
  erb :class_member
end

#error page Routes
not_found do
  status 404
  'not found'
end
require 'pry'
require 'json'

begin
  gem "curb"
rescue LoadError
  system("gem install curb")
  Gem.clear_paths
end

require 'curb'

def api_call
  BASE_URL = "http://devpoint-ajax-example-server.herokuapp.com/api/v1"
  http = Curl.get("#{BASE_URL}/users")
  @response = JSON.parse(http.body_str)
end

def menu
  puts "--- Users API Menu ---"
  puts "1) All Users\n2) Single User\n3) Create User\4) Update User\n5) Delete User\n6) User Count\n7) Quit"
  @menu_input = gets.strip.to_i
  if @menu_input == 1
    option_1
  elsif @menu_input == 2
    option_2
  end
end

def option_1  
  api_call
  if @response.has_key?("users")
    users = response["users"]
      users.each do |user|
        puts "--- User Info ---"
        puts "Id: #{user["id"]}"
        puts "First Name: #{user["first_name"]}"
        puts "Last Name: #{user["last_name"]}"
        puts "Phone: #{user["phone"]}"
        puts
      end
  else
    puts "No Users Found."
  end
end

def option_2
  puts "Enter the user ID you are looking for: "
  @id_input = gets.strip.to_i
  api_call

  if @response.has_key?("users")
    users = response["users"]
      users.each do |user|
        if @id_input == user["id"]
          puts "We found user with id: #{user["id"]}"
          puts "--- User Info ---"
          puts "First Name: #{user["first_name"]}"
          puts "Last Name: #{user["last_name"]}"
          puts "Phone: #{user["phone"]}"
      end
  else
    puts "No Users Found."
  end
end

menu
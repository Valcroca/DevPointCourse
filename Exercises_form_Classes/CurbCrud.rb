require 'curb'
require 'pry'
require 'JSON'

BASE_URL = "http://devpoint-ajax-example-server.herokuapp.com/api/v1/users/"

class Printer
  def self.print_user(user, *attrs_to_exclude)
    puts "User Info:"
    user.each do |key, value|
      next if attrs_to_exclude.include?(key)
      puts "#{key} - #{value}"
    end
  end
end

def user_info(user_id)
  user_response = Curl.get(BASE_URL + user_id)
  # TODO: Handle server errors, this code is assuming the user is inputting valid data
  Printer.print_user(JSON.parse(user_response.body)['user'])
end

# INDEX ACTION
def list_users
  users_response = Curl.get(BASE_URL)
  # TODO: Handle server errors, this code is assuming the user is inputting valid data
  parsed = JSON.parse(users_response.body)
  parsed['users'].each do |user|
    Printer.print_user(user, 'first_name')
  end
end

# SHOW ACTION
def list_user
  puts 'What user id do you want to get info for: '
  user_id = gets.strip
  list_user if user_id.length == 0
  user_info(user_id)
end

# CREATE ACTION
def new_user
  puts "First Name For New User: "
  user_first_name = gets.strip
  puts "Last Name For New User: "
  user_last_name = gets.strip
  puts "Phone Number For New User: "
  user_phone = gets.strip
  if user_first_name.length == 0 || user_last_name.length == 0
    puts "first and last name are required"
    new_user
  else
    user_create_response = Curl::Easy.http_post(BASE_URL,
                             Curl::PostField.content('user[first_name]', user_first_name),
                             Curl::PostField.content('user[last_name]', user_last_name),
                             Curl::PostField.content('user[phone_number]', user_phone))
    # TODO: Handle server errors, this code is assuming the user is inputting valid data
    puts "New User Info:"
    Printer.print_user(JSON.parse(user_create_response.body)['user'])
  end
end

# UPDATE ACTION
def edit_user
  puts "Enter the id of the user that you want to edit: "
  user_id = gets.strip
  edit_user if user_id.length == 0
  puts "Editing user with info: "
  user_info(user_id)
  puts "Enter a new first name (or press enter to leave it the same)"
  new_first = gets.strip
  puts "Enter a new last name (or press enter to leave it the same)"
  new_last = gets.strip
  puts "Enter a new phone number (or press enter to leave it the same)"
  new_phone = gets.strip
  # TODO: Finish this edit
end

# DESTROY ACTION
def destroy_user
  puts "Enter the id of the user that you want to destroy: "
  user_id = gets.strip
  destroy_user if user_id.length == 0
  delete_response = Curl::Easy.http_delete(BASE_URL + user_id)
  # TODO: Handle server errors, this code is assuming the user is inputting valid data
  puts JSON.parse(delete_response.body)['message']
end

def menu
  while true
    puts "CURB CRUD MENU:", "1) List all users", "2) List a single user", "3) Create a new user", "4) Edit a user", "5) Destroy a user"
    user_input = gets.strip
    if user_input.downcase == 'quit'
      puts 'Thanks for using CURB CRUD'
      exit 0
    else
      user_input = user_input.to_i
    end
    case user_input
      when 1
        list_users
      when 2
        list_user
      when 3
        new_user
      when 4
        edit_user
      when 5
        destroy_user
      else
        puts "Not a valid selection. Please try again."
        menu
    end
  end
end

menu
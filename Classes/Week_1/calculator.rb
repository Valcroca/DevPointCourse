# check scopes of variables
require 'pry'

def no_letters_please
  @user_input = gets.strip.split('')

  alphabet = ('a'..'z').to_a
    @user_input.each do |item|
      if alphabet.include?(item)
          puts "You can't input letters. Try again."
          first
      end
    
    end
end


def first
  puts "Let´s do some math"
  puts "input first number?"
  no_letters_please
  @first_number = @user_input.to_f
  oprt
end

def oprt
  puts "What kind of operator do you want to choose?
  '+'
  '-'
  '*'
  '/' "
  no_letters_please
  @operator = @user_input.to_sym
  second
end

def calculator(first_number, operator, second_number)
  result = first_number.send(operator, second_number)
  puts "Your result is #{result}"
  ended
end

def second
  puts "second number?"
  no_letters_please
  @second_number = @user_input.to_f
  calculator
end
#this isnt working

calculator(@first_number, @operator, @second_number)
binding.pry
def ended
  puts "Do you want to exit? yes or no"
  exit = gets.strip.downcase
  if exit == "no"
    first
  else
    puts "Invalid. Try again."
  end
end

first


#i want to implement this code to have only one user input instad of 3:
    # puts "Let´s do some math"
    # puts "input the equation you want to solve (operations available are +, -, *, / )"
    # str = gets.strip
    # arr_str = str.gsub(" ","").split(/(\+|\-|\/|\*)/)
    # puts str




    
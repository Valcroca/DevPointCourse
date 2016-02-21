

@main_dishes = {"Lamb shank stew" => 17.0, "Halibut Thai Curry" => 15.0, "Tuna Steak" => 20.0 }
@side_dishes = { "Steamed Veggies" => 3.0, "Sweet Potato Mash" => 2.0, "Green Salad" => 1.5, "Caprese Salad" => 3.5 }

class Side
  attr_accessor :dish, :price
  
  def initialize(dish, price)
      @dish = dish
      @price = price
  end
end

def print_main_dish_menu
  puts `clear`
  puts "<<<<<<<<<<<<<<<Welcome to Lunch Lady Dinner>>>>>>>>>>>>>>>\n\nHere are your options for your main dish:\n\n"
  sleep (1)
  @main_dishes.each do |dish, price|
    puts ">>> #{dish} for $#{price}"
  end
end

def main_dish_choice
  puts "\nWhat do you choose? A: for the Lamb, B: for the Halibut or C: for the Tuna ?\n"
  @main_choice = gets.strip.downcase
  sleep (1)

  if @main_choice == "a"
    puts "Great! Lamb it is."
    @main_key = @main_dishes.key(17.0)
    @main_value = @main_dishes["Lamb shank stew"]
  elsif @main_choice == "b"
    puts "Good choice!"
    @main_key = @main_dishes.key(15.0)
    @main_value = @main_dishes["Halibut Thai Curry"]
  elsif @main_choice == "c"
    puts "Excellent. We only serve it medium-rare."
    @main_key = @main_dishes.key(20.0)
    @main_value = @main_dishes["Tuna Steak"]
  else
    puts "Sorry, that wasn't an option.\n"
    sleep (1)
    main_dish_choice
  end
  
end


def print_side_dish_menu
  
  puts "\nAnd here are your options for side dishes:\n\n"
  sleep (1)
  @side_dishes.each do |dish, price|
    puts ">>> #{dish} for $#{price}"
  end
  
end


def side_dish_choice
  puts "\nWhat do you choose? Type A: for Veggies, B: for Mashed Pot, C: for the Salad or D: for the Caprese.\n"
  @side_choice = gets.strip.downcase
  sleep (1)
  
  if @side_choice == "a"
    @side_key = @side_dishes.key(3.0)
    @side_value = @side_dishes["Steamed Veggies"]
  elsif @side_choice == "b"
    @side_key = @side_dishes.key(2.0)
    @side_value = @side_dishes["Sweet Potato Mash"]
  elsif @side_choice == "c"
    @side_key = @side_dishes.key(1.5)
    @side_value = @side_dishes["Green Salad"]
  elsif @side_choice == "d" 
    @side_key = @side_dishes.key(3.5)
    @side_value = @side_dishes["Caprese Salad"]
  else 
    puts "I didn´t get that. Try again.\n"
    sleep (1)
    side_dish_choice
  end
  
end

def side_one
  puts "\nGreat combo!\n"
  @side_one = Side.new(@side_key, @side_value)
  puts "And now for the second side...\n"
  sleep (1)
end

def side_two
  side_dish_choice
  @side_two = Side.new(@side_key, @side_value)
  puts "\nAll right."
  sleep (2)
end

def add_ons
  puts "Do you want to get an add_on item? YES or NO"
  @add = gets.strip.downcase

  if @add == 'yes'
    puts "\nType in an add-on item you want."
    @add_input = gets.strip.capitalize
    @add_on = Side.new(@add_input, 0.75)

  elsif @add == 'no'
    puts "Ok, no add_ons today."
  else 
    puts "Sorry, I don't understand. Let's try again."
    sleep(1)
    add_on
  end
end


def full_order
  puts `clear`
  puts "\n\nSo, your complete order is #{@main_key} with sides of #{@side_one.dish} and #{@side_two.dish}, and with the add_on items of #{@add_on.dish}."
end

def total
  puts "\n\nYour total is: $ #{ @main_value + @side_one.price + @side_two.price + @add_on.price } -" 
  sleep (1)
  puts "\n\n<<<<<<<<<<<<<<<Thanks for comming in today! Have a great one!>>>>>>>>>>>>>>>\n\n"
end

print_main_dish_menu

main_dish_choice

print_side_dish_menu

side_dish_choice

side_one

side_two

add_ons

full_order

total



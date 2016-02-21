# Basic Goals

# 1) write a ruby script to take user input
# 2) check to see if that user input is a palindrome
# 3) do NOT use the .reverse method in ruby

# Bonus Goals
# 1) make sure spaces work
# 2) make sure caps and lowers of the letters work in each word
# 3) make sure you can check for word, phrases, numbers, or other sequences
# 4) make the script loop so you can keep inputting words without having to run the script again
# 5) make the script quit if the user types in a certain word: (eg. stop)

# Palindrome Defination:
# A palindrome is a word, phrase, number, or other sequence of characters which reads the same backward or forward.

def user_input
  puts `clear`
  puts "<<<<<<<<<<<<<<<<<<<<<<<Please enter a word to see if it is a polindrome<<<<<<<<<<<<<<<<<<<<\n\n"
  @word_input = gets.strip.downcase
end

def check_for_polindrome
  if condition
    
  end
end

user_input
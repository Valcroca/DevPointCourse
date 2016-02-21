# HOLE 1: Sum an array
# Create a method that takes in an array sums the array then returns the array and the sum
def sa(x)
  t = x.inject {|s, n| s += n}
  puts x, t
end
a = [1, 1]
sa(a)

# HOLE 2: Rock paper scissors
# Takes a user input the computer randomly chooses and the winner is output to the screen 
puts 'Write R, P or S'
i = gets.strip.upcase
a = ['R', 'P', 'S'].sample
def r_p_s(i, a)
  if i == a
    puts 'It is a Tie'
  elsif (i == 'R' && a == 'P') || (i == 'P' && a == 'S') || (i == 'S' && a == 'R')
    puts 'You loose'
  elsif (a == 'R' && i == 'P') || (a == 'P' && i == 'S') || (a == 'S' && i == 'R')
    puts 'You win'
  end
end
r_p_s(i, a)

# HOLE 3: FIZZBUZZ
# For numbers 1-100 print “FIZZ” if the number is divisible by 3, “BUZZ” if the number is divisible by 5, “FIZZBUZZ” if the number is divisible by both 3 and 5 otherwise print the number
(1..100)
case 
  when  n % 15 == 0

  when  n % 3 == 0

  when  n % 5 == 0
end







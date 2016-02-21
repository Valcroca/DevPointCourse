# def fibonacci(n)
#   if n == 0 || n == 1
#     return 1
#   end
#   (fibonacci(n - 1) + fibonacci(n-2)
# end

# puts fibonacci(3)


number = gets.to_i

def fibonacci(number)
 return number if number <= 1
 fibonacci(number - 1) + fibonacci(number - 2)
end

puts fibonacci(number)
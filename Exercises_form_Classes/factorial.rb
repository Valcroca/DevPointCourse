def factorial(number)
  if number == 0 || number == 1
    puts 1
  else
    sum = 1
    number.times do |n|
      sum *= (n + 1)
    end
    puts sum 
  end
end

factorial(1)

# ----------------------------
def recur_factorial(n)
  if n == 0
    # returns 1:
    1
  else
    puts n * recur_factorial(n - 1)
  end
  # we can do a one liner too like this: 
  # puts n * recur_factorial(n - 1) unless n == 0
end

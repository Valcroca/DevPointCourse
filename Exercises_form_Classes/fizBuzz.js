// fizz buzz : takes a range of numbers 0-100. if divisible by 3 print fizz. if divisible by 5 print buzz. 
// if divisible by 3 & 5 print fiz-buzz

for (var i=1; i <= 20; i++)
{
    if (i % 15 == 0)
        console.log("FizzBuzz");
    else if (i % 3 == 0)
        console.log("Fizz");
    else if (i % 5 == 0)
        console.log("Buzz");
    else
        console.log(i);
}

// in ruby:
// (1..100).each do |x|
//   if n % 15 == 0  
//     puts "FizzBuzz"
//   elsif i % 5 == 0
//     puts "Buzz"
//   elsif i % 3 == 0
//     puts "Fizz"
//   else
//     puts i
//   end
// end
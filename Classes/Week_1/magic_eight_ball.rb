# - Magic Eight Ball: 
# Ask the ball a question and get a random answer. (Bonus objectives)
# Basic Objectives:
# - User inputs question


def eight_ball
  puts 'What is your question?'
  question = gets.strip
  # - Computer outputs random answer
  @array_answers = ['It is certain', 'It is decidedly so', 'Without a doubt', 'Yes, definitely', 'You may rely on it' 'As I see it, yes', 'Most likely', 'Outlook good', 'Yes', 'Signs point to yes' 'Reply hazy try again', 'Ask again later', 'Better not tell you now', 'Cannot predict now', 'Concentrate and ask again', "Don't count on it", 'My reply is no','My sources say no',
  'Outlook not so good', 'Very doubtful']
  answer = @array_answers.sample(1)
  puts answer
  again_or_quit
end

def add_answers
  puts "Add an answer? YES or NO"
  add_answer_input = gets.strip.downcase
  if add_answer_input == 'yes'
    puts "Write the answer you want to add"
    new_answer = gets.strip.capitalize
    @array_answers << new_answer
    puts 'Your answer has been added'
    again_or_quit
  elsif add_answer_input == 'no'
    puts 'Ok. No added answers'
    again_or_quit
  else
    puts "I didn't get that. Try again."
    add_answers
  end
end

# - User inputs "QUIT"
def again_or_quit
  puts 'Write AGAIN to play again, ADD to add an answer or QUIT to exit?'
  user_input = gets.strip.downcase

  if user_input == 'quit'
# - Computer outputs a goodbye message and exits
    puts 'Thanks for playing. Goodbye!'
  elsif user_input == 'again'
    eight_ball
  elsif user_input == 'add'
    add_answers
  else
    puts "Sorry I don´t understand that."
    again_or_quit
  end
end



eight_ball
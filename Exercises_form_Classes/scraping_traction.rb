require 'mechanize'
require 'pry'

agent = Mechanize.new
page = agent.get('http://localhost:3000/users/sign_in')

# get the login form
login_form = page.forms.first
#sumulates a user typing into the text box with the name of 'q'
login_form['user[email]'] = 'valeria@hotmail.com'
login_form['user[password]'] = 'password123'
# submits the login form
page = login_form.submit

binding.pry
page

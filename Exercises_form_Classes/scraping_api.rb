require 'mechanize'
require 'pry'

agent = Mechanize.new
page = agent.get('http://google.com')

# get the search form
search_form = page.forms.first
#sumulates a user typing into the text box with the name of 'q'
search_form['q'] = 'funny cat videos'
# submits the search form
page = search_form.submit
# print out all the link text on the page
page.links.each do |link|
  puts link.text
end

binding.pry
page
puts "Total count of links in page is #{page.links.count}"
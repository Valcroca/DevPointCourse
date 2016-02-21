require 'mechanize'
namespace :scrape do
  desc "Scape dem rappers off dat webpage foshizzle"
  task rappers: :environment do
    agent = Mechanize.new
    page = agent.get('http://www.buzzle.com/articles/rappers-list.html')
    page.search('#article-body .leftnote').each do |rapper|
      name = rapper.text.strip
      rapper = Rapper.new(name: name)
      rapper.og = true if og_rappers.include?(name)
      rapper.auto_tune = true if cant_sing_without_help.include?(name)
      rapper.save
    end
    puts "Rappers Scraped DOGGGGG, There are #{Rapper.count} Rappers in the hood now!"
  end
  def og_rappers
    ['Tupac', 'Biggie', 'The Notorious B.I.G', 'Eminem', 'M.C Hammer', 'Snoop Dogg', 'Dr. Dre', 'Warren G', 'Nelly']
  end

  def cant_sing_without_help
    ['Lil Wayne', 'Kanye West']
  end

end

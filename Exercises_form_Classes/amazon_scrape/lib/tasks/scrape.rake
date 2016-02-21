require 'mechanize'

namespace :scrape do
  desc "scrape the first page of cellphones from amazon.com"
  task cellphones: :environment do
    agent = Mechanize.new
    page = agent.get("http://www.amazon.com")
    search_form = page.forms.first
    search_form['field-keywords'] = 'cellphones'
    cellphone_page = search_form.submit
    cellphone_containers = cellphone_page.search('.s-item-container')
    phone_count = 0
    cellphone_containers.each do |container|
      title = container.search('.s-access-title')
      next unless title.any?
      phone = Cellphone.new
      phone.name = title.text.strip
      phone.img_src = container.search('.s-access-image').first.attribute('src').value
      phone.stars = container.search('.s-icon-star').text.strip
      phone.price = container.search('.s-price').text.strip
      phone.save
      phone_count += 1
    end
    puts "#{phone_count} phones scraped successpully!"
  end

end

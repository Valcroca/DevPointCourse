namespace :populate do
  desc "Populate 3000 random users"
  task users: :environment do
    User.populate(3000) do |user|
      user.first_name = Faker::Name.first_name
      user.last_name = Faker::Name.last_name
      user.email = Faker::Internet.email
      user.age = Faker::Number.between(1, 90)
    end
    puts "3000 random users populated. User count is now: #{User.count}"
  end

end

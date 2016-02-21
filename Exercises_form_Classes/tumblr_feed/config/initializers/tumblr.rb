tumblr = "#{Rails.root}/config/tumblr.yml"
if File.exists? tumblr
  config = YAML.load_file(tumblr)
  config.each {|key, value| ENV[key] || ENV[key] = value.to_s}
end

Tumblr.configure do |config|
  config.consumer_key = ENV['CONSUMER_KEY']
  config.consumer_secret = ENV['SECRET_KEY']
end
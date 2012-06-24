if File.exists?("#{Rails.root}/config/bitly.yml")
  bitly_config = YAML.load_file("#{Rails.root}/config/bitly.yml")
  BITLY = {}
  BITLY[:login] = bitly_config['login']
  BITLY[:api_key] = bitly_config['api_key']
else
  BITLY[:login] = ENV['BITLY_LOGIN']
  BITLY[:api_key] = ENV['BITLY_API_KEY']
end
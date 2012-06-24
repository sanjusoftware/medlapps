if File.exists?("#{Rails.root}/config/app_auth.yml")
  app_auth_config = YAML.load_file("#{Rails.root}/config/app_auth.yml")
  APP_AUTH = {}
  APP_AUTH[:username] = app_auth_config['username']
  APP_AUTH[:password] = app_auth_config['password']
else
  APP_AUTH[:username] = ENV['APP_AUTH_USERNAME']
  APP_AUTH[:password] = ENV['APP_AUTH_PASSWORD']
end
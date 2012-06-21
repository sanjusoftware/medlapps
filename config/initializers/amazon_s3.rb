Paperclip.interpolates(:s3_southeast_url) { |attachment, style|
  "#{attachment.s3_protocol}//s3-ap-southeast-1.amazonaws.com/#{attachment.bucket_name}/#{attachment.path(style).gsub(%r{^/}, "")}"
}

if File.exists?("#{Rails.root}/config/s3.yml")
  s3_config = YAML.load_file("#{Rails.root}/config/s3.yml")
  S3 = {}
  S3[:key] = s3_config[Rails.env]['access_key_id']
  S3[:secret] = s3_config[Rails.env]['secret_access_key']
  S3[:bucket] = s3_config[Rails.env]['bucket']
else
  S3[:key] = ENV['S3_KEY']
  S3[:secret] = ENV['S3_SECRET']
  S3[:bucket] = ENV['S3_BUCKET']
end
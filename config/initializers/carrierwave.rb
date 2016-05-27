CarrierWave.configure do |config|
  unless Rails.env.development?
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      region:                'us-east-1'
    }
    config.fog_directory  = ENV["AWS_BUCKET"]
    config.fog_public     = false
    config.fog_attributes = { ssl_version: :TLSv1_2, 'Cache-Control' => "max-age=#{365.day.to_i}" }
  end
end

unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIA3LT2D4X7TFQJ45ME',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'rails-photo-123'
    config.cache_storage = :fog
  end
end
unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIARVPZP2ML3VGUZFSH',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'cat-app-bucket'
    config.cache_storage = :fog
  end
end
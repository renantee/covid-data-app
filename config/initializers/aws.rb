require 'aws-sdk-s3'

Aws.config.update(
  region: ENV['AWS_REGION'],
  credentials: Aws::Credentials.new(
    Rails.application.credentials.dig(:aws, :access_key_id),
    Rails.application.credentials.dig(:aws, :secret_access_key)
  )
)
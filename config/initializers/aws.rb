AWS.config(
  :access_key_id => Rails.application.credentials.dig(:aws, :access_key_id),
  :secret_access_key => Rails.application.credentials.dig(:aws, :secret_access_key)
)

S3_BUCKET =  AWS::S3.new.buckets[ENV['S3_BUCKET']]
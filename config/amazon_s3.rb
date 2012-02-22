require 'aws/s3'
require 'hashie'

S3_CONFIG = Hashie::Mash.new(
  bucket: ENV['S3_BUCKET'],
  access_key_id: ENV['S3_ACCESS_KEY'],
  secret_access_key: ENV['S3_SECRET_KEY'])

AWS::S3::Base.establish_connection!(
  access_key_id:     S3_CONFIG.access_key_id,
  secret_access_key: S3_CONFIG.secret_access_key
)

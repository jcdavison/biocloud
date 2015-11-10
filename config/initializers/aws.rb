# Aws.config.update({
#   region: 'us-west-2',
#   credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
# })

# S3_BUCKET = Aws::S3::Resource.new.bucket(ENV['S3_BUCKET'])
S3_SERVICE = S3::Service.new(:access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                          :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'])

BIO_STREAM_BUCKET = S3_SERVICE.buckets.select {|bucket| bucket.name == 'bio-stream' }.first

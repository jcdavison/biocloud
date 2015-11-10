class Api::AssetUrlsController < ApplicationController
  protect_from_forgery with: :exception, only: []

  def create
    secure_random = SecureRandom.uuid
    s3_data = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read', url: 'https://jd-foo.s3-us-west-2.amazonaws.com')
    render json: {s3Data: {fields: s3_data.fields, url: s3_data.url}}
    rescue
      render json: {s3Data: {}}
  end

  def foo
    binding.pry
    render json: {s3Data: {}}
  end
end

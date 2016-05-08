class Api::EventsController < ApplicationController
  protect_from_forgery with: :exception, only: []
  FOTO_SUFFIX = '-bio-stream-foto.jpg'

  def index
    events = BioEvent.all.order(created_at: 'DESC').map do |event| 
      event.to_builder.attributes!.merge( {photos: event.photos.map {|photo| photo.url} } )
    end
    render json: { events: events } 
    rescue => e
      render json: { events: [] } 
  end

  def create
    bio_event = BioEvent.new(info: params['event']['info'])
    base_64_image_data = URI.unescape(params['event']['image_data'])
    raw_image_data = Base64.decode64(base_64_image_data)
    foto = BIO_STREAM_BUCKET.objects.build foto_file_name
    foto.content = raw_image_data
    foto.acl = 'public_read'
    foto.save
    photo = Photo.new url: foto.url
    bio_event.save
    bio_event.photos << photo
    render json: { event: bio_event.to_waffle.attributes! } 
    rescue => e
      render json: {error: 'foo'}
  end


  private 
    def foto_file_name
      SecureRandom.hex << FOTO_SUFFIX
    end
end

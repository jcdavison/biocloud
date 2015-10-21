class Api::EventsController < ApplicationController
  protect_from_forgery with: :exception, only: []

  def index
    events = BioEvent.all.order(created_at: 'DESC').map { |event| event.to_builder.attributes! }
    render json: { events: events } 
    rescue => e
      render json: { events: [] } 
  end

  def create
    bio_event = BioEvent.new(info: params['bio_event']['info'])
    bio_event.save
    render json: { event: bio_event.to_waffle.attributes! } 
    rescue => e
      render json: {error: 'foo'}
  end
end

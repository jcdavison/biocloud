class Api::EventsController < ApplicationController
  def index
    events = BioEvent.all.map { |event| event.to_builder.attributes! }
    render json: { events: events } 
    rescue => e
      p "there was a problem, #{e}"
      render json: { events: [] } 
  end
end

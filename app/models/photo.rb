class Photo < ActiveRecord::Base
  belongs_to :bio_event
  validates_presence_of :url
end

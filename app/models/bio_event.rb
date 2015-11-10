class BioEvent < ActiveRecord::Base
  include JsonifyHelper
  include WaffleHelper
  has_many :photos

  def display_attributes
    self.attributes.keys
  end
end

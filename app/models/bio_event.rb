class BioEvent < ActiveRecord::Base
  include JsonifyHelper
  include WaffleHelper

  def display_attributes
    self.attributes.keys
  end
end

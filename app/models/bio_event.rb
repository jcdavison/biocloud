class BioEvent < ActiveRecord::Base
  include JsonifyHelper

  def display_attributes
    self.attributes.keys
  end
end

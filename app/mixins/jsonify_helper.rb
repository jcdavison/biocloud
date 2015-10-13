module JsonifyHelper
  def to_builder
    Jbuilder.new do |thingy|
      thingy.(self, *self.display_attributes)
    end
  end
end

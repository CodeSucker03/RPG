require 'ruby2d'

class Water
  attr_accessor :image
  def initialize(x, y, width, height)
    @image = Image.new('Image/Water.png',
     x: x,
     y: y,
     width: width,
     height: height
     )
  end
end
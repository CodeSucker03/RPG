require 'ruby2d'

class Wall
  attr_accessor :image
  def initialize(x, y, width, height)
    @image = Image.new('Image/Wall.png',
     x: x,
     y: y,
     width: width,
     height: height,
     )
  end
end

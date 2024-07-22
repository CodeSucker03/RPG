require 'ruby2d'

class Water
  def initialize(x, y, width, height)
    Image.new('Image/Water.png',
     x: x,
     y: y,
     width: width,
     height: height,
     )
  end
end
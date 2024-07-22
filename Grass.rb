require 'ruby2d'

class Grass
  def initialize(x, y, width, height)
    Image.new('Image/Grass.png',
     x: x,
     y: y,
     width: width,
     height: height,
     )
  end
end
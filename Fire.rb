require 'ruby2d'
require_relative 'ImageHandler'


class Fire
  def initialize(x, y, width,height)
    @fire = Sprite.new(
      'Image/Fire.png',
      x: x,
      y: y,
      width: width,
      height: height,
      clip_width: width_Of('Image/Fire.png') / 8,
      loop: true,
      time: 200,
    )
    self.runAnimation
  end

  def runAnimation
    @fire.play
  end
end

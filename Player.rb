require 'ruby2d'
require_relative 'ImageHandler' # to read dimemsion of image ==> must install (gem install rmagick)
require_relative 'CollisionChecker'
require_relative 'CommonParameter'


class Player < Sprite
  attr_reader :x, :y, :speed, :worldX, :worldY
  attr_accessor :upDirection, :downDirection, :leftDirection, :rightDirection

  def initialize(width, height)
    super(
      'Image/Player.png',
      x: CP::SCREEN_WIDTH / 2 - (CP::TILE_SIZE/2),
      y: CP::SCREEN_HEIGHT / 2 - (CP::TILE_SIZE/2),
      width: width, height: height,
      clip_width: width_Of('Image/Player.png') / 4,
      animations: {fly: 1..3}
    )
    @speed = 3
    @upDirection = false
    @downDirection = false
    @leftDirection = false
    @rightDirection = false

    #
    @worldX = @x
    @worldY = @y








    #Area for collision
    @solidArea = Rectangle.new(
      x: 8, y: 16,            # Position
      width: 32, height: 32,  # Size  
      opacity: 0
    )

    @collisionOn = false
  end


#-------------------------------- Update -----------------------------------------
  def update()
    if(self.upDirection == true)
      @worldY -= @speed
    elsif(self.downDirection == true)
      @worldY += @speed
    elsif(self.leftDirection == true)
      @worldX -= @speed
    elsif(self.rightDirection == true)
      @worldX += @speed
    end
  end


#-------------------------------- Move -----------------------------------------
  def move(map, tile_size)

      new_x = self.x 
      new_y = self.y 
      if(self.upDirection == true)
          new_y = self.y - self.speed
      elsif(self.downDirection == true)
          new_y = self.y + self.speed
      elsif(self.leftDirection == true)
          new_x = self.x - self.speed
      elsif(self.rightDirection == true)
          new_x = self.x + self.speed
      end
  end

#-------------------------------- Setter Methods -----------------------------------------

  def runAnimation()
    self.play(animation: :fly)
  end


#-------------------------------- Stop Moving -----------------------------------------
  
  
end


# player = Player.new(50, 50, 48, 48)
# #Setting Window
# set width: SCREEN_HEIGHT
# set height: SCREEN_WIDTH
# set title: "20x20 Grid RPG" 
# set resizable: true
# #set fullscreen: true
# show


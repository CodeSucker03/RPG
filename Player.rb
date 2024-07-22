require 'ruby2d'
require_relative 'ImageHandler' # to read dimemsion of image ==> must install (gem install rmagick)
require_relative 'CollisionChecker'



class Player < Sprite
  attr_reader :speed
  attr_accessor :upDirection, :downDirection, :leftDirection, :rightDirection

  def initialize(x, y, width, height)
    super(
      'Image/Player.png',
      x: x,
      y: y,
      width: width, height: height,
      clip_width: width_Of('Image/Player.png') / 4,
      animations: {fly: 1..3}
    )
    @speed = 2
    @upDirection = false
    @downDirection = false
    @leftDirection = false
    @rightDirection = false


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
      self.y = self.y - self.speed
    elsif(self.downDirection == true)
      self.y = self.y + self.speed
    elsif(self.leftDirection == true)
      self.x = self.x - self.speed
    elsif(self.rightDirection == true)
      self.x = self.x + self.speed
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


    @wallcollision = false  # Reset wall collision state before checking
    (map.size).times do |row|
      (map.size).times do |col|
       if map[row][col] == 4
        wall_x = col * (tile_size)
        wall_y = row * (tile_size)
        @wallcollision = Collision_between_2_objects(new_x, new_y, self.width, self.height, wall_x, wall_y, tile_size, tile_size)
        break if @wallcollision  # Exit loop early if collision detected
       end
      end
      break if @wallcollision  # Exit loop early if collision detected
    end

     # Check for collisions with obstacles
    if Check_Within_Map_Boundary(self, map, tile_size) && !(@wallcollision)
      self.x = new_x
      self.y = new_y
    end  
  end

#-------------------------------- Setter Methods -----------------------------------------

  def runAnimation()
    self.play(animation: :fly)
  end


#-------------------------------- Stop Moving -----------------------------------------
  
  
end


#player = Player.new(50, 50, 200, 200, 'white')
#puts player.contains? 75, 75


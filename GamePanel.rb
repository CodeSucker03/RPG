
require 'ruby2d'
require_relative 'Player'
require_relative 'EventHandler'
require_relative 'KeyHandler'
require_relative 'GameMap'
require_relative 'CommonParameter'


#----------------------------------------- Wolrd Setting -----------------------------





#1. Create objects in the game
map = GameMap.new()
player = Player.new(CP::TILE_SIZE, CP::TILE_SIZE)
text = Text.new(
  '',
  x: 0, y: 0,
  #font: 'vera.ttf',
  style: 'bold',
  size: 20,
  color: 'black',
  #rotate: 90,
  #z: 10
)

#wall = Wall.new(0,0, 48, 48)

#2. Get user's input
get_key_input(player)

#3.
#------------------------------------------------------- Game Loop ------------------------------------------
update do
    player.update()
    text.text = "Coordinate: #{player.worldX}  #{player.worldY} \n"
    map.update(player)

    # wall.image.x = player.worldX 
    # puts "#{wall.image.x} \n"
end



#------------------------------------------------------- Set up window ---------------------------------------
#Setting Window
set width: CP::SCREEN_HEIGHT
set height: CP::SCREEN_WIDTH
set title: "20x20 Grid RPG" 
set resizable: true
#set fullscreen: true


#------------------------------------------------------- Show window ---------------------------------------
show





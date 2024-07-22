
require 'ruby2d'
require_relative 'Player'
require_relative 'EventHandler'
require_relative 'KeyHandler'
require_relative 'GameMap'



#1. Create objects in the game
map = GameMap.new()
player = Player.new(48, 48, TILE_SIZE, TILE_SIZE)
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


#2. Get user's input
get_key_input(player)

#3.
#------------------------------------------------------- Game Loop ------------------------------------------
update do
    player.update()
    text.text = "Coordinate: #{player.x}  #{player.y} \n"
end



#------------------------------------------------------- Set up window ---------------------------------------
#Setting Window
set width: SCREEN_HEIGHT
set height: SCREEN_WIDTH
set title: "20x20 Grid RPG" 
set resizable: true
#set fullscreen: true


#------------------------------------------------------- Show window ---------------------------------------
show





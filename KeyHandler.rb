# event_handlers.rb



#---------------------------------------- When user presses a key --------------------------------------
def handle_key_down(event, player)
  case event.key
    when 'w' 
      player.upDirection = true
    when 's'
      player.downDirection = true
    when 'a'
      player.leftDirection = true
    when 'd'
      player.rightDirection = true
  end
end

#---------------------------------------- When user releases a key --------------------------------------
def handle_key_up(event, player)
  case event.key
    when 'w' 
      player.upDirection = false
    when 's'
      player.downDirection = false
    when 'a'
      player.leftDirection = false
    when 'd'
      player.rightDirection = false
  end
end

#---------------------------------------- Set up Player to be moveable --------------------------------------
def get_key_input(player)

  on :key_held do |event|
    player.runAnimation()
    handle_key_down(event, player)
    #puts "You are PRESSING a key\n" 
  end

  on :key_up do |event|
    handle_key_up(event, player)
    player.stop                             #stop animation when do not press any key
    #puts "You are REALEASING a key\n"
  end
end

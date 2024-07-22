# event_handlers.rb







#---------------------------------------- When user presses a key --------------------------------------
def handle_key_down(event, player_square)
    case event.key
      when 'a' 
        player_square.set_speed(-2, 0)
      when 'd'
        player_square.set_speed(2, 0)
      when 'w'
        player_square.set_speed(0, -2)
      when 's'
        player_square.set_speed(0, 2)
    end
  end
  
#---------------------------------------- When user releases a key --------------------------------------
  def handle_key_up(event, player_square)
    case event.key
      when 'a', 'd', 'w', 's'
        player_square.stop
    end
  end
  
#---------------------------------------- Set up Player to be moveable --------------------------------------
  def setup_moveable_player(player_square)
    on :key_held do |event|
      player_square.runAnimation()
      handle_key_down(event, player_square)
      puts "You are PRESSING a key 11111\n" 
    end
  
    on :key_up do |event|
      handle_key_up(event, player_square)
      puts "You are REALEASING a key 1111111\n"
    end
  end
  
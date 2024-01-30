class Game
  attr_accessor :humanplayer, :enemies

  def initialize(name, enemies_number)
    enemies_generator(enemies_number)
    @humanplayer = HumanPlayer.new(name)
  end

  def enemies_generator(enemies_number)
    @enemies = []
    enemies_number.times do
      rng = RandomNameGenerator.new
      @enemies << Player.new(rng.compose(2))
    end
  end

  def killed(enemie_killed)
    @enemies.delete_at(enemie_killed)
  end

  def all_enemies_killed
    @enemies = []
  end

  def show_players
    print @humanplayer.human_state
    puts "#{@enemies.length}enemies still alive"
  end

  def is_still_ongoing?
    if @humanplayer.life_points > 0 && @enemies.length > 0
      return true
    else
      return false
    end
  end

  def human_choice
    puts "Choice your actions (maybe the last)"
    puts
    puts "[a] Do you want try to find better weapon ?"
    puts "[s] Do you want to heal you maybe ?"
    puts
    puts "Choose enemy to attack :"
    number_choice = 0
    @enemies.each do |enemy|
      print "#{number_choice} > "
      print "#{enemy.show_state}"
      number_choice += 1
    end
  end

  def human_consequence(user_input)
    if user_input == "a"
      humanplayer.search_weapon
        gets
    elsif user_input == "s"
      humanplayer.search_lifepack
        gets
    else input = user_input.to_i
      player_to_attack = @enemies[input]
      humanplayer.attacks(player_to_attack)
      if player_to_attack.is_dead?
        killed(input)
      end
    end
  end

  def enemies_attack
    number_of_attack = rand(0..6)
    enemy = @enemies.sample(number_of_attack)
    enemy.each do |enemys|
        enemys.attacks(humanplayer)
    end
  end
end
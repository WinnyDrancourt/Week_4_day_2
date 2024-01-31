class Game
  attr_accessor :humanplayer, :enemies

  def initialize(name, enemies_number) #Init Human + enemies
    enemies_generator(enemies_number)
    @humanplayer = HumanPlayer.new(name)
  end

  def enemies_generator(enemies_number) #Generation of enemies with random name / enemies_numbers take from app3.rb with difficulty lvl
    @enemies = []
    enemies_number.times do
      rng = RandomNameGenerator.new
      @enemies << Player.new(rng.compose(2))
    end
  end

  def new_players_in_sight
      dice_roll = rand (1..6)
      rng = RandomNameGenerator.new
      case dice_roll
        when 1..4
          puts "No one's coming"
        when 5
          new_enemy = Player.new(rng.compose(2))
          @enemies << new_enemy
          puts "Watch out! Someone's coming. #{new_enemy.name} is ready to fight."
        when 6
          new_enemies = Array.new(2){Player.new(rng.compose(2))}
          new_enemies.each do |enemy|
          @enemies << enemy
          end
          puts "Watch out! Two enemies are coming. #{new_enemies.map(&:name).join(', ')} are ready to fight."
      end
  end

  def killed(enemie_killed) #remove enemie killed
    @enemies.delete_at(enemie_killed)
  end

  def all_enemies_killed # arry empty
    @enemies = []
  end

  def show_players   # Information of game and Human
    print @humanplayer.human_state
    puts "#{@enemies.length}enemies still alive"
  end

  def is_still_ongoing? #games need continues ? player life > 0 and somes enemies to killed
    if @humanplayer.life_points > 0 && @enemies.length > 0
      return true
    else
      return false
    end
  end

  def human_choice # Menu of choice
    puts "Choice your actions (maybe the last)"
    puts
    puts "[q] Do you want try to find better weapon ?"
    puts "[w] Do you want try to find better armor ?"
    puts "[e] Do you want to heal you maybe ?"
    puts
    puts "Choose enemy to attack :"
    dynamic_menu = @enemies.sample(rand(5..15)).sort_by{|e| @enemies.index(e)}.map do |e| # Thx Annies, i need to studies a little more this
      {option: @enemies.index(e).to_s, text: e.show_states}
    end
    dynamic_menu.each {|item| puts"#{item[:option]} - #{item[:text]}"}
  end

  def human_consequence(user_input) # repsonse of menu
    if user_input == "q"
      humanplayer.search_weapon
        gets
    elsif user_input == "w"
        humanplayer.search_armor
          gets
    elsif user_input == "e"
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

  def enemies_attack # Attack of enemies random
    number_of_attack = 0
    numbers_of_attack = rand(1..10) # generate random number of attack
    if (numbers_of_attack - @humanplayer.shield_bonus) < 1
      number_of_attack = 0
    else number_of_attack = numbers_of_attack - @humanplayer.shield_bonus
    end
    puts "[#{numbers_of_attack} - #{@humanplayer.shield_bonus}] attacks you ! Take care"
    enemy = @enemies.sample(number_of_attack) # take random enenmies of @enemies with the number of attack
    enemy.each do |enemys|
        enemys.attacks(humanplayer)
    end
  end

  def end
    puts "This games have end."
    if humanplayer.is_alive?
      puts "Congratulation ! You win"
    else
      puts "oh no, you loose ! Try again. And dont be stupid !"
    end
  end
end
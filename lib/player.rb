class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    if @life_points <= 0
      puts "#{@name} is Dead !"
    else
      puts "#{@name} have #{@life_points} life points."
    end
  end

  def gets_damage(dmg)
    @life_points -= dmg
    self.show_state
  end

  def compute_damage
    return rand(1..6)
  end

  def attacks(player_to_attack)
    puts "#{@name} attacks, #{player_to_attack.name}"
    damages = compute_damage
    puts "He deals #{damages} damage points."
    player_to_attack.gets_damage(damages)
  end

  def is_alive?
    if @life_points > 0
      return true
    else
      return false
    end
  end

  def is_dead?
    if @life_points <1
      return true
    else
      return false
    end
  end

end
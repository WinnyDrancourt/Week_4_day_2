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
      puts "#{@name} have #{@life_points} HP."
    end
  end

  def gets_damage(dmg) #  how damage is make on life points
    @life_points -= dmg
    self.show_state
    puts "_____________________"
  end

  def show_states
    if @life_points <= 0
      return "#{@name} is Dead !"
      else
      return "#{@name} have #{@life_points} HP."
    end
  end


  def compute_damage #random damage
    return rand(1..6)
  end

  def attacks(player_to_attack) # define of attack
    damages = compute_damage
    puts "#{@name} attacks, #{player_to_attack.name} for #{damages}HP !"
    player_to_attack.gets_damage(damages)
  end

  def is_alive? #player alive ?
    if @life_points > 0
      return true
    else
      return false
    end
  end

  def is_dead? #player dead ?
    if @life_points <1
      return true
    else
      return false
    end
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level, :shield_bonus


  def initialize(name)
    super(name)
    @weapon_level = 1
    @shield_bonus = 1
    @life_points = 100
  end

  def human_state
    if @life_points <= 0
      puts "#{@name} is Dead !"
      else
        puts "#{@name} have #{@life_points} HP. You have a lvl #{@weapon_level} weapon and lvl #{@shield_bonus} armor bonus."
    end
  end

  def compute_damage #random damage for Human
    return rand(1..6) * @weapon_level
  end

  def search_weapon
    weapon_rand = rand(1..6)
    puts "You fin a lvl #{weapon_rand} weapon !"
    if weapon_rand > @weapon_level
      @weapon_level = weapon_rand #Replace value @weapon_level by weapon_rand
      puts "You're so happy, this weapons is so much better and you take it."
    else
      puts "You're so sick, because this weapon is so TRASH !"
    end
  end

  def search_armor
    shield_rand = rand(1..6)
    puts "You fin a lvl #{shield_rand} weapon !"
    if shield_rand > @shield_bonus
      @shield_bonus = shield_rand #Replace value @weapon_level by weapon_rand
      puts "You're so happy, this armor is so much better and you take it."
    else
      puts "You're so sick, because this armor is so TRASH !"
    end
  end

  def search_lifepack
    life_rand = rand(1..6)
    if life_rand == 1
      puts "You find nothing !"
      elsif 1 < life_rand && life_rand < 6
        health_rand = rand(10..50)
        if @life_points + health_rand > 100
          @life_points = 100
          else @life_points = @life_points + health_rand
        end
        puts "You find a #{health_rand} Health pack, now you have #{@life_points}HP"
      elsif life_rand == 6
        health_rand = rand(40..80)
        if @life_points + health_rand > 100
          @life_points = 100
          else @life_points = @life_points + health_rand
        end
        puts "You are so lucky !!!"
        puts "You find a #{health_rand} Health pack, now you have #{@life_points}HP"
    end
  end
end

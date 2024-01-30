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

  def compute_damage #random damage
    return rand(1..6)
  end

  def attacks(player_to_attack) # define of attack
    puts "#{@name} attacks, #{player_to_attack.name}"
    damages = compute_damage
    puts "He deals #{damages} damage points."
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
  attr_accessor :weapon_level


  def initialize(name)
    super(name)
    @weapon_level = 1
    @life_points = 100
  end

  def human_state
    if @life_points <= 0
      puts "#{@name} is Dead !"
      else
        puts "#{@name} have #{@life_points} HP and have a lvl #{@weapon_level} weapon"
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
      puts "You're new Weapon level is #{weapon_rand}"
    else
      puts "You're so sick, because this weapon is so TRASH !"
    end
  end

  def search_lifepack
    life_rand = rand(1..6)
    if life_rand == 1
      puts "You find nothing !"
      elsif 1 < life_rand && life_rand < 6
        if @life_points +50 > 100
          @life_points = 100
          else @life_points = @life_points + 50
        end
        puts "You find a 50 Health pack, now you have #{@life_points}HP"
      elsif life_rand == 6
        if @life_points +80 > 100
          @life_points = 100
          else @life_points = @life_points + 80
        end
        puts "You are so lucky !!!"
        puts "You find a 80 Health pack, now you have #{@life_points}HP"
    end
  end
end

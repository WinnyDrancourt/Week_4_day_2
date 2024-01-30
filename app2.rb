require 'bundler'
Bundler.require

require_relative 'lib/player2'
require_relative 'lib/game'



def welcome_screen
  puts " _________________________________________________________ "
  puts "|                                                         |"
  puts "|            Welcome to this awsome game :                |"
  puts "|              They all want my skin !!!                  |"
  puts "|     Good Luck and have fun, for leave this Alive        |"
  puts "|_________________________________________________________|"
end

def human_init
  puts "Tell me victim, what's your name ?"
  print "> "
  player_name = gets.chomp
  humanplayer = HumanPlayer.new(player_name)
  return humanplayer
end

def human_choice(enemy1, enemy2)
  puts "Choice your actions (maybe the last)"
  puts
  puts "[a] Do you want try to find better weapon ?"
  puts "[s] Do you want to heal you maybe ?"
  puts
  puts "Attack on sight ?"
  print "[q] >"
  print "#{enemy1.show_state}"
  print "[w] >"
  print "#{enemy2.show_state}"
  puts
  print "> "
  user_input = gets.chomp.to_s
end

def fight(humanplayer, enemy1, enemy2, enemies)
  while humanplayer.is_alive? && (enemy1.is_alive? || enemy2.is_alive?) #Player 1 or 2 alive
    system "clear"
    humanplayer.human_state
    case human_choice(enemy1, enemy2)
      when "a"
        humanplayer.search_weapon
        gets
      when "s"
        humanplayer.search_lifepack
        gets
      when "q"
        humanplayer.attacks(enemy1)
        gets
      when "w"
        humanplayer.attacks(enemy2)
        gets
    end
    puts "They attack you !" if (enemy1.is_alive? || enemy2.is_alive?)
    enemies.each do |enemy|
      if enemy.is_alive?
        enemy.attacks(humanplayer)
        gets
      end
    end
  end
end

def perform
    #Init two player for some test
  enemy1 = Player.new("Josianne")
  enemy2 = Player.new("José")
  enemies = [enemy1, enemy2]
  system "clear"
  welcome_screen
  gets
  humanplayer = human_init
  fight(humanplayer, enemy1, enemy2, enemies)
  puts " You'r still alive ! Enjoy"
  gets
  perform
end

perform

# binding.pry
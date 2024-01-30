require 'bundler'
Bundler.require

require_relative 'lib/player3'
require_relative 'lib/game'

def welcome_screen
  puts " _________________________________________________________ "
  puts "|                                                         |"
  puts "|            Welcome to this awsome game :                |"
  puts "|              They all want my skin !!!                  |"
  puts "|     Good Luck and have fun, for leave this Alive        |"
  puts "|_________________________________________________________|"
end

def game_init
  n_difficulty = 0
  puts "You want try this game !"
  puts "Victim tell me your name ?"
  print "> "
  player_name = gets.chomp
  puts "Choose you'r difficulty now"
  puts "[1] Easy (enemies number between 5 and 15)"
  puts "[2] Normal (enemies number between 15 and 30)"
  puts "[3] Hard (enemies number between 30 and 60)"
  print "> "
  difficulty = gets.chomp
  if difficulty == "1"
    n_difficulty = rand(5..15)
  elsif difficulty == "2"
    n_difficulty = rand(15..30)
  elsif difficulty == "3"
    n_difficulty = rand(30..60)
  end
  return my_game = Game.new(player_name, n_difficulty)
end

def try_again
  puts "Do you want, try again ?"
  puts
  puts "[1] Yes, lets have some fun again !"
  puts
  puts "[2] No, i'm so scarred, i need to go sleep !"
  user_input = gets.chomp
end

def perform
  system "clear"
  welcome_screen
  gets
  my_game = game_init
  while my_game.is_still_ongoing?
    system ('clear')
    my_game.show_players
    my_game.human_choice
      print "> "
      user_input = gets.chomp
    my_game.human_consequence(user_input)
    my_game.enemies_attack
    gets
  end
  my_game.end
  gets
  case try_again
    when "1"
    perform
    when "2"
    exit!
  end
end
perform


# binding.pry
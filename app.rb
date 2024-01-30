require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'

#Init two player for some test
player1 = Player.new("Josianne")
player2 = Player.new("José")

 def fight(player1, player2)
  puts "Let's present you, our two Fighters !"
  print "#{player1.show_state}"
  print "#{player2.show_state}"
  puts "------------------------------"

  while player1.is_alive? || player2.is_alive?
    player1.attacks(player2)
    puts "------------------------------"
      break if player2.is_dead?
    player2.attacks(player1)
    puts "------------------------------"
      break if player1.is_dead?
  end
end


binding.pry
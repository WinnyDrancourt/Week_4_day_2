class Menu

  def welcome_screen
    system ("clear")
    puts " _________________________________________________________ "
    puts "|                                                         |"
    puts "|            Welcome to this awsome game :                |"
    puts "|              They all want my skin !!!                  |"
    puts "|     Good Luck and have fun, for leave this Alive        |"
    puts "|_________________________________________________________|"
  end

  def init_menu
    puts "You want try this game !"
    puts "Victim tell me your name ?"
    print "> "
    player_name = gets.chomp # Take name of player
    puts "Choose you'r difficulty now"
    puts "[1] Easy (enemies number between 5 and 15)"
    puts "[2] Normal (enemies number between 15 and 30)"
    puts "[3] Hard (enemies number between 30 and 60)"
    print "> "
    return player_name
  end

  def try_again # end screen relaunch or quit
    puts "Do you want, try again ?"
    puts
    puts "[1] Yes, lets have some fun again !"
    puts
    puts "[2] No, i'm so scarred, i need to go sleep !"
    final_input = gets.chomp
    return final_input
  end

end
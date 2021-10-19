require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

# Initialisation du user et des ennemies
print "Quel est ton pseudo : "
user = gets.chomp
my_game = Game.new(user)

# Déroulement principal du jeu
while my_game.is_still_ongoing?
    system("clear")
    my_game.show_players
    my_game.menu
    my_game.menu_choice
    gets.chomp
    my_game.enemies_attacks
    gets.chomp
end

my_game.end

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Flo")
player2 = Player.new("Val")

while player1.life_points > 0 && player2.life_points > 0
    puts
    puts ("-" * 50)
    puts "Voici l'état de chaque joueur :"
    player1.show_state
    player2.show_state
    puts ("-" * 50)
    puts
    puts "Passons à la phase d'attaque :"

    
    player2.attacks(player1) if player2.life_points > 0
    player1.attacks(player2) if player1.life_points > 0
end

# binding.pry
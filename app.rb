require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# Initialisation des joueurs
player1 = Player.new("Flo")
player2 = Player.new("Val")

# Boucle Tant que l'un des deux joueurs n'est pas mort
while player1.life_points > 0 && player2.life_points > 0
    puts
    puts ("-" * 50)
    puts "Voici l'état de chaque joueur :"
    puts player1.show_state
    puts player2.show_state
    puts ("-" * 50)
    puts
    puts "Passons à la phase d'attaque :"

    # Les deux joueurs s'attaquent si ils ne sont pas mort
    player2.attacks(player1) if player2.life_points > 0
    player1.attacks(player2) if player1.life_points > 0
end
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

# Initialisation des ennemis et du user
print "Quel est ton prénom ? "
user = HumanPlayer.new(gets.chomp)
player1 = Player.new("José")
player2 = Player.new("Josiane")
enemies = Array.new
enemies << player1
enemies << player2

# Boucle Tant que l'un des deux joueurs n'est pas mort
while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
    system("clear")
    sum_life = 0
    puts user.show_state

    # Menu du jeu
    print "Quelle action veux-tu effectuer ?

    a - chercher une meilleure arme
    s - chercher à se soigner 

    attaquer un joueur en vue :
    0 - #{player1.show_state}
    1 - #{player2.show_state}
    --> "

    # Le joueur doit choisir entre les différentes options du menu
    case gets.chomp
        when "a" then user.search_weapon
        when "s" then user.search_health_pack
        when "0" then user.attacks(player1)
        when "1" then user.attacks(player2)
        else 
            puts "Veuillez choisir une valeur valide du menu."
    end
    
    # On fait la somme totale des points de vie des ennemis
    enemies.each do |enemy|
        sum_life += enemy.life_points
    end

    # Si la somme totale est au dessus de 0 alors on met le puts
    puts "\nLes autres joueurs t'attaquent !" if sum_life > 0 

    # Tout les ennemis attaquent si ils ne sont pas mort
    enemies.each do |enemy| 
        enemy.attacks(user) if enemy.life_points > 0
    end

    gets.chomp
end

# Si la vie totale des annemies est inférieur ou égal à 0 puts "VOUS AVEZ GAGNE !!!!!" sinon, puts "Vous avez perdu................."
puts sum_life <= 0 ? "VOUS AVEZ GAGNE !!!!!" : "Vous avez perdu................."
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

print "Quel est ton prénom ? "
user = HumanPlayer.new(gets.chomp)
player1 = Player.new("José")
player2 = Player.new("Josiane")
enemies = Array.new
enemies << player1
enemies << player2

while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
    system("clear")
    sum_life = 0
    puts user.show_state

    print "Quelle action veux-tu effectuer ?

    a - chercher une meilleure arme
    s - chercher à se soigner 

    attaquer un joueur en vue :
    0 - #{player1.show_state}
    1 - #{player2.show_state}
    --> "

    case gets.chomp
        when "a" then user.search_weapon
        when "s" then user.search_health_pack
        when "0" then user.attacks(player1)
        when "1" then user.attacks(player2)
        else 
            puts "Veuillez choisir une valeur valide du menu."
    end
    
    enemies.each do |enemy|
        sum_life += enemy.life_points
    end

    puts "\nLes autres joueurs t'attaquent !" if sum_life > 0 

    enemies.each do |enemy| 
        enemy.attacks(user) if enemy.life_points > 0
    end

    gets.chomp
end

puts sum_life <= 0 ? "VOUS AVEZ GAGNE !!!!!" : "Vous avez perdu................."

# puts "\nVous avez gagné !" if sum_life <= 0
# puts "\n"
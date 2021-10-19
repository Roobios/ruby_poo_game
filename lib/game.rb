class Game 
    attr_accessor :human_player, :enemies

    def initialize(user_name)
        @enemies = Array.new
        @user = HumanPlayer.new(user_name)
        5.times {|i| @enemies << Player.new("Robot #{i+1}")}
    end

    def kill_player(player)
        @enemies.each_index do |i|
            @enemies.delete_at(i) if @enemies[i].name == player
        end
    end

    def is_still_ongoing?
        @user.life_points > 0 && !@enemies.empty? ? true : false
    end

    def show_players
        puts @user.show_state
        puts "Il reste #{@enemies.length} ennemies à combattre."
    end

    def menu
        puts "Quelle action veux-tu effectuer ?"
        puts
        puts "a - chercher une meilleure arme"
        puts "s - chercher à se soigner" 
        puts
        puts "Attaquer un joueur en vue :"
        @enemies.each_index {|i| print i, " --> ", @enemies[i].show_state, "\n"}
        print "--> "
    end

    def menu_choice
        choice = gets.chomp
        case choice
        when "a" then @user.search_weapon
        when "s" then @user.search_health_pack
        else 
            choice = choice.to_i
            if choice.between?(0, @enemies.length)
                @user.attacks(@enemies[choice])
            end
        end
        @enemies.each {|enemy| kill_player(enemy.name) if enemy.life_points <= 0}
    end

    def enemies_attacks
        puts "\nLes autres joueurs t'attaquent !"
        @enemies.each do |enemy|
            enemy.attacks(@user)
        end
    end

    def end
        puts ".../*-+ THE GAME IS OVER +-*/..."
        puts @user.life_points > 0 ? "VOUS AVEZ GAGNE !!!" : "TU AS PERDU...."
    end
end
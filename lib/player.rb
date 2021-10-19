class Player
    attr_accessor :name, :life_points

    def initialize(name)
        @name = name
        @life_points = 10
    end

    # Montre le nombre de points de vie et le nom du joueur
    def show_state
        return "#{@name} a #{@life_points} points de vie"
    end

    # Enlève des points de vie à un joueur et envoie un message si la joueur est mort
    def gets_damage(points)
        return false unless points.is_a?(Integer)
        @life_points -= points
        @life_points = 0 if @life_points < 0
        puts "Le joueur #{@name} a été tué !" if (@life_points <= 0)
    end

    # Annonce les points dégats et lance la méthode gets_damage()
    def attacks(player)
        puts "Le joueur #{@name} attaque le joueur #{player.name}"
        player_attacks = compute_damage()
        puts "Il lui inflige #{player_attacks} points de dommages."
        player.gets_damage(player_attacks)
    end

    # Retourne des points de dégats aléatoires
    def compute_damage
        return rand(1..6)
    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        super(name)
        @life_points = 100
        @weapon_level = 1
    end

    # Retourne le nom, les points de vie et l'arme du joueur
    def show_state
        return "#{@name} a #{life_points} points de vie et une amre de niveau #{weapon_level}"
    end
    # Retourne des points de dégats aléatoires en le multipliant par le niveau de l'arme
    def compute_damage
        rand(1..6) * @weapon_level
    end

    # Retourne la meilleur arme suivant son niveau
    def search_weapon
        new_weapon_level = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
        if new_weapon_level > @weapon_level
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
            @weapon_level = new_weapon_level
        else
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end
    end

    # Ajoute suivant le dé des points de vie
    def search_health_pack
        case rand(1..6)
            when 1 then puts "Tu n'as rien trouvé"
            when (2..5)
                @life_points > 50 ? @life_points = 100 : @life_points += 50
                puts "Bravo, tu as trouvé un pack de +50 points de vie !"
            when 6
                @life_points > 20 ? @life_points = 100 : @life_points += 80
                puts "Waow, tu as trouvé un pack de +80 points de vie !"
        end
    end
end

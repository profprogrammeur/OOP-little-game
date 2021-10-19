
class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

#affiche l'état du joueur
  def show_state
    puts "#{@name} a #{@life_points} points de vie !!"
  end

  def gets_damage(damage) 
    @life_points = @life_points - damage
    if @life_points <= 0
      puts "le joueur #{@name} a été tué !" 
      puts "     (×_×#)   "
    end
  end
#impute le dommage au joueur attaqué :
  def attacks(other_player)
    puts "Le joueur #{@name} attaque le joueur #{other_player.name}"
    damage = compute_damage
    puts "Il lui inflige #{damage} points de dommages"
    other_player.gets_damage(damage)
  end

# retourne un nombre aléatoire pour les dommages causés :
  def compute_damage
      return rand(1..6) 
  end

# retourne l'état des joueurs
  def self.players_state(player1,player2)
    puts ""
    puts "Voici l'état de chaque joueur :"
    print player1.show_state
    print player2.show_state
    puts ""
  end
end


#######Definition de la classe des humains###########
class HumanPlayer < Player
  attr_accessor :name, :life_points, :weapon_level
#Initialize joueur humain avec nom en paramètre
  def initialize(name)
      super(name)
      @life_points = 100
      @weapon_level = 1
  end
#Montre l'état du joueur
  def show_state
      puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{weapon_level}"
  end


#Ajoute une arme si elle est plus puissante
  def search_weapon
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
    if new_weapon_level > @weapon_level
      @weapon_level = new_weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
    puts ""
  end

#Ajoute des points de vie au joueur
  def search_health_pack
    dice_throw = rand(1..6)
    if dice_throw == 1
      puts "Tu n'as rien trouvé... "
    elsif dice_throw > 1 && dice_throw >= 5
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      @life_points += 50
      if @life_points > 100
          @life_points = 100
      end
    else dice_throw == 6
      puts  "Waow, tu as trouvé un pack de +80 points de vie !"
      @life_points += 80
      if @life_points > 100
          @life_points = 100
      end
    puts ""
    end
  end
end
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "     -------------------------------------------------"
puts "     |Bienvenue sur  'OOP-Little Role-Playing Game' !|"
puts "     |Le but du jeu est d'être le dernier survivant !|"
puts "     -------------------------------------------------"

# Initialisation du joueur :
puts "Salutation Humain quel est ton nom"
puts "Entrez votre nom"
print "> "
human_name = gets.chomp
user = HumanPlayer.new(human_name)

# Initialisation des ennemis :
player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = []
enemies += [player1, player2]

#affiche le menu de sélection et les points des joueurs
def user_action(user,enemies)  
  puts "----------------------------------"
  puts "Quelle action veux-tu effectuer ?"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner "
  puts "attaquer un joueur en vue :"    
  puts "0 - Josiane a #{enemies[0].life_points} points de vie"
  puts "1 - José a #{enemies[1].life_points} points de vie"
  puts "Tu as #{user.life_points} points de vie"
  print "> "
  
    choice = gets.chomp 
    case choice
      when "a" then user.search_weapon
      when "s" then user.search_health_pack
      when "0" then user.attacks(enemies[0])
      when "1" then user.attacks(enemies[1])
      else
        puts "Tu n'as pas appelé la bonne fonction"
        puts""
    end
  
end

#fait jouer tous les ennemis chacun à leur tour
def enemies_action(user, enemies)
  enemies.each do |playerX|
    if playerX.life_points > 0 
        playerX.attacks(user)
    end
  end
end

#annonce la fin de partie
def game_end(user)
  puts "La partie est finie" 
  if user.life_points > 0
      puts  "BRAVO ! TU AS GAGNE !"
  else 
      puts "Loser ! Tu as perdu !"
  end
end

#lance la phase de combat : action du joueur puis attaques des enemies
def fight_phase(user, enemies)
  while user.life_points > 0 && (enemies[0].life_points > 0 || enemies[1].life_points >0)
      user_action(user, enemies)
      enemies_action(user, enemies)
  end
  game_end(user)
end

fight_phase(user, enemies)





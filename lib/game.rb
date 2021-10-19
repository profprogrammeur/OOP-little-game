class Game
  attr_accessor :human_player, :enemies

#initialise le jeu
  def initialize(name)
    @human_player = HumanPlayer.new(name)
    @player1 = Player.new("BOT1")
    @player2 = Player.new("BOT2")
    @player3 = Player.new("BOT3")
    @player4 = Player.new("BOT4")
    @enemies = []
    @enemies += [@player1,@player2,@player3,@player4]
  end    

#lance les méthodes tant qu'il y a de la vie des 2 cotés
  def is_still_ongoing?
    if @human_player.life_points > 0 && (@player1.life_points > 0 || @player2.life_points > 0 || @player3.life_points > 0 || @player4.life_points > 0)
      return true 
    else 
      return false 
    end         
  end

#affiche l'état des joueurs
  def show_players
      puts "Tu as #{@human_player.life_points} points"
      puts "il reste #{@enemies.length} bots, courage!!"
  end

#affiche le menu
  def menu
    puts ""
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner "
    puts "attaquer un joueur en vie :"    
    @enemies.each do |enemy| 
    puts "#{enemies.index(enemy)} - #{enemy.name} a 10 points de vie"
    end
  end

#gère le menu
  def menu_choice
    choice = gets.chomp 
    case choice
        when "a" then @human_player.search_weapon
        when "s" then @human_player.search_health_pack
        when "0" then @human_player.attacks(enemies[0])
        when "1" then @human_player.attacks(enemies[1])
        when "2" then @human_player.attacks(enemies[2])
        when "3" then @human_player.attacks(enemies[3])
    else
        puts "Tu n'as pas appeler la bonne fonction"
    end
  end

#attaque des méchants enemis tour à tour
  def enemies_attack
    @enemies.each do |playerX|
      if playerX.life_points > 0 
          playerX.attacks(@human_player.name)
      else 
          kill_player
      end
    end
  end

#annonce fin du jeu
  def end_game
    puts "La partie est finie" 
    if @human_player.life_points > 0
        puts  "BRAVO ! TU AS GAGNE !"
    else 
        puts "Loser ! Tu as perdu !"
    end
  end

#Suppression d'un joueur du tableau des vilains
  def kill_player
    @enemies.each do |player|
      if (player.life_points <= 0)
        @enemies.delete(player)
        puts "#{player.name} vient d'être éliminé !"
        end
      end   
  end
  
end


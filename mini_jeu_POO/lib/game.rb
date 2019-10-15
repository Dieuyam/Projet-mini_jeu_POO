
# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
#require 'pry'
require 'time'
require 'bundler'
Bundler.require


require_relative 'player'




class Game


attr_accessor :human_player, :enemies



	def initialize (name_game) #Constructeur
			@human_player=HumanPlayer.new(name_game) 
			player1 = Player.new("Josiane")
			player2 = Player.new("José")
			player3 = Player.new("Yannick")
			player4 = Player.new("Cédric")
			@enemies = [player1, player2, player3, player4]
	
			#@enemies << {"1" => player1, "2" => player2, "3" => player3, "4" => player4}

		
	end



	def kill_player (numberplayer) #methode qui retire les enemis qui ne sont plus vivants
		
	  		#my_game.enemies[0].name[]
	  		#delete my_game.enemies[0].name
	  		@enemies.delete(@enemies[numberplayer-1])
	  		@enemies
	end 


	def is_still_ongoing?  #mthode qui vérifie que le jour est toujours en cours

	 	if @human_player.life_points > 0 &&  !@enemies.empty? 
	    	return true
	    else
	      return false
	    end
	end



	def show_players  # mtéhode qui va afficher 1) l'état du joueur humain et 2) le nombre de joueurs "bots" restant
		@human_player.show_state

		@enemies.each do |enemy|
	  		if enemy.life_points > 0 
	  			enemy.show_state
	  		end 
		end

	end


	def menu
	

		puts "Quelle action veux-tu effectuer? "
		puts "---------------------------------"
		puts "a- chercher une meilleure arme---"
		puts "b- chercher à se soigner---------"
		puts "---------------------------------\n"
		show_players
		 
	end


	def menu_choice  # Cette méthode va permettre de faire réagir le jeu en fonction du choix, dans le menu, de l'utilisateur

		choice = gets.chomp #pour faire le choix

	  case choice
	  when 'a'
	    user.search_weapon

	  when 'b'
	    user.search_health_pack

	  when '0'
	    user.attacks(player1)

	  when '1'
	  user.attacks(player2)

	  end

	end




end #fin de la classe Game


=begin

 #liste des tests des méthodes de la classe Game
my_game = Game.new("Wolverine")
my_game.kill_player(1)
my_game.is_still_ongoing?
my_game.show_players
binding.pry
my_game.menu
=end